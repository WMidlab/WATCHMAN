-- link : http://www.asic-world.com/examples/vhdl/asyn_fifo.html
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aFIFOV2 is
    generic (
        DATA_WIDTH :integer := 8;
        ADDR_WIDTH :integer := 4
    );
    port (
    	rst :		in std_logic;
        -- Reading port.
        Data_out    :out std_logic_vector (DATA_WIDTH-1 downto 0);
        Empty_out   :out std_logic;
        ReadEn_in   :in  std_logic;
        RClk        :in  std_logic;
        -- Writing port.
        Data_in     :in  std_logic_vector (DATA_WIDTH-1 downto 0);
        Full_out    :out std_logic;
        WriteEn_in  :in  std_logic;
        WClk        :in  std_logic
    );
end entity;
architecture rtl of aFIFOV2 is

    --- Component
    component GRAY_ENCODER is
		generic(
			NBITS : integer := 8
		);
		Port (
		GRAY_OUT :		out 	std_logic_vector(NBITS-1 downto 0);
		BIN_IN:		in	std_logic_vector(NBITS-1 downto 0)
		);
	end component GRAY_ENCODER;

	component GRAY_DECODER is
		generic(
			NBITS : integer := 8
		);
		Port (
		GRAY_IN :		in 	std_logic_vector(NBITS-1 downto 0);
		BIN_OUT:		out	std_logic_vector(NBITS-1 downto 0)
		);
	end component GRAY_DECODER;

    component clkcrossing_buf is
    	generic(
    		NBITS : integer := 32
    	);
    	port (
    		nrst:	in	std_logic;
    		DA: 	in	std_logic_vector(NBITS-1 downto 0);
    		QB:		out	std_logic_vector(NBITS-1 downto 0);
    		ClkA:	in	std_logic;
    		ClkB:	in	std_logic
    	);
    end component clkcrossing_buf;
    ----/Internal connections & variables------
    constant FIFO_DEPTH :integer := 2**ADDR_WIDTH;

    type RAM is array (integer range <>)of std_logic_vector (DATA_WIDTH-1 downto 0);
    signal Mem : RAM (0 to FIFO_DEPTH-1);

    signal pNextWordToWrite     :std_logic_vector (ADDR_WIDTH downto 0);
    signal pNextWordToRead      :std_logic_vector (ADDR_WIDTH downto 0);

    -- Clock domain signals
    signal pWriteToReadGray     :std_logic_vector (ADDR_WIDTH downto 0);
    signal pReadToWriteGray      :std_logic_vector (ADDR_WIDTH downto 0);

    signal pWriteToReadBuf     :std_logic_vector (ADDR_WIDTH downto 0);
    signal pReadToWriteBuf      :std_logic_vector (ADDR_WIDTH downto 0);

    signal pWriteToRead     :std_logic_vector (ADDR_WIDTH downto 0);
    signal pReadToWrite      :std_logic_vector (ADDR_WIDTH downto 0);

    signal Equal_WR, looped_WR       :std_logic;
    signal Equal_RD, looped_RD       :std_logic;

    -- -------------------------------------------------------------
	-- Constraints on Signals
	-- -------------------------------------------------------------
    -- attribute ram_style : string;
    -- attribute ram_style of Mem : signal is "block";

begin

    --Read to Write
    ReadWriteGray_Encode:  GRAY_ENCODER
        generic map(
            NBITS => ADDR_WIDTH+1
        )
        Port map(
        BIN_IN  => pNextWordToRead,
        GRAY_OUT => pReadToWriteGray
        );
    CLK_RD2WR : clkcrossing_buf
        generic map(
            NBITS => ADDR_WIDTH+1
        )
        port map(
            nrst  => rst,
            DA    => pReadToWriteGray,
            QB    => pReadToWriteBuf,
            ClkA  => RClk,
            ClkB  => WClk
        );
    ReadWriteGray_Decoder:  GRAY_DECODER
        generic map(
            NBITS => ADDR_WIDTH+1
        )
        Port map(
        GRAY_IN => pReadToWriteBuf,
        BIN_OUT	=> pReadToWrite
        );
        ------------
    WriteReadGray_Encode:  GRAY_ENCODER
        generic map(
            NBITS => ADDR_WIDTH+1
        )
        Port map(
        BIN_IN  => pNextWordToWrite,
        GRAY_OUT => pWriteToReadGray
        );
    CLK_WR2RD : clkcrossing_buf
    	generic map(
    		NBITS => ADDR_WIDTH+1
    	)
    	port map(
    		nrst  => rst,
    		DA    => pWriteToReadGray,
    		QB    => pWriteToReadBuf,
    		ClkA  => WClk,
    		ClkB  => RClk
    	);
    WriteReadGray_Decoder:  GRAY_DECODER
        generic map(
            NBITS => ADDR_WIDTH+1
        )
        Port map(
        GRAY_IN => pWriteToReadBuf,
        BIN_OUT	=> pWriteToRead
        );
    --Code--------------/
    --Data ports logic:
    --(Uses a dual-port RAM).
    --'Data_out' logic:
    process (RClk,rst) begin
    	if rst = '0' then
			pNextWordToRead <= (others => '0');
			Data_out <= (others => '0');
		else
		    if (rising_edge(RClk)) then
		        --if (ReadEn_in = '1' and empty = '0') then
                if (ReadEn_in = '1' and not(Looped_RD = '0' and Equal_RD = '1')) then
                    Data_out <= Mem(to_integer(unsigned(pNextWordToRead(ADDR_WIDTH-1 downto 0))));
		            pNextWordToRead <= std_logic_vector(unsigned(pNextWordToRead) + 1);
		        end if;
		    end if;
		end if;
    end process;

    --'Data_in' logic:
    process (WClk,rst) begin
		if rst = '0' then

			pNextWordToWrite <= (others => '0');
			for I in 0 to FIFO_DEPTH-1 loop
				Mem(I) <= (others => '0');
			end loop;
		else
		    if (rising_edge(WClk)) then
		        --if (WriteEn_in = '1' and full = '0') then
                if (WriteEn_in = '1' and not(Looped_WR = '1' and Equal_WR = '1')) then
                    Mem(to_integer(unsigned(pNextWordToWrite(ADDR_WIDTH-1 downto 0)))) <= Data_in;
		            pNextWordToWrite <= std_logic_vector(unsigned(pNextWordToWrite) + 1);
		        end if;
		    end if;
		end if;
    end process;


    --'EqualAddresses' logic:  EqualAddresses <= '1' when (pNextWordToWrite = pNextWordToRead) else '0';
    -- Write Process
    Equal_WR <= '1' when (pNextWordToWrite(ADDR_WIDTH-1 downto 0) = pReadToWrite(ADDR_WIDTH-1 downto 0)) else '0';
    Looped_WR <= '1' when (pNextWordToWrite(ADDR_WIDTH) /= pReadToWrite(ADDR_WIDTH)) else '0';

    -- Read Process
    Equal_RD <= '1' when (pWriteToRead(ADDR_WIDTH-1 downto 0) = pNextWordToRead(ADDR_WIDTH-1 downto 0)) else '0';
    Looped_RD <= '1' when (pWriteToRead(ADDR_WIDTH) /= pNextWordToRead(ADDR_WIDTH)) else '0';
    --
	Full_out  <= '1' when Looped_WR = '1' and Equal_WR = '1'  	else '0';
	Empty_out <= '1' when Looped_RD = '0' and Equal_RD = '1'      else '0';

	--Full  <= '1' when Looped_WR = '1' and Equal_WR = '1'  	else '0';
	--Empty <= '1' when Looped_RD = '0' and Equal_RD = '1'      else '0';

end architecture;
