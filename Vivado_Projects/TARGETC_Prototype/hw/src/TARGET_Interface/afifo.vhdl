-- link : http://www.asic-world.com/examples/vhdl/asyn_fifo.html
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
    
entity aFifo is
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
architecture rtl of aFifo is
    ----/Internal connections & variables------
    constant FIFO_DEPTH :integer := 2**ADDR_WIDTH;

    type RAM is array (integer range <>)of std_logic_vector (DATA_WIDTH-1 downto 0);
    signal Mem : RAM (0 to FIFO_DEPTH-1);
    
    signal pNextWordToWrite     :std_logic_vector (ADDR_WIDTH downto 0);
    signal pNextWordToRead      :std_logic_vector (ADDR_WIDTH downto 0);
    
    signal Equal, looped       :std_logic;
    signal empty,full   :std_logic;
    
begin

    --------------Code--------------/
    --Data ports logic:
    --(Uses a dual-port RAM).
    --'Data_out' logic:
    process (RClk,rst) begin
    	if rst = '0' then
			Data_out <= (others => '0');
		else
		    if (rising_edge(RClk)) then
		        if (ReadEn_in = '1' and empty = '0') then
		            Data_out <= Mem(to_integer(unsigned(pNextWordToRead(ADDR_WIDTH-1 downto 0))));
		        end if;
		    end if;
		end if;
    end process;
            
    --'Data_in' logic:
    process (WClk,rst) begin
		if rst = '0' then
			for I in 0 to FIFO_DEPTH-1 loop
				Mem(I) <= (others => '0');
			end loop;
		else
		    if (rising_edge(WClk)) then
		        if (WriteEn_in = '1' and full = '0') then
		            Mem(to_integer(unsigned(pNextWordToWrite(ADDR_WIDTH-1 downto 0)))) <= Data_in;
		        end if;
		    end if;
		end if;
    end process;


	process(WClk,rst)
	begin
		if rst = '0' then
			pNextWordToWrite <= (others => '0');
		else
			if rising_edge(WCLK) then
				
				if  (WriteEn_in and (not full)) = '1' then
					pNextWordToWrite <= std_logic_vector(unsigned(pNextWordToWrite) + 1);
				end if;
			end if;
		end if;
	end process;
	  
	process(RClk,rst)
	begin
		if rst = '0' then
			pNextWordToRead <= (others => '0');
		else
			if rising_edge(RCLK) then		
				if (ReadEn_in  and (not empty)) = '1' then
					pNextWordToRead <= std_logic_vector(unsigned(pNextWordToRead) + 1);
				end if;
			end if;
		end if;
	end process;  
	         
    --'EqualAddresses' logic:  EqualAddresses <= '1' when (pNextWordToWrite = pNextWordToRead) else '0';
    Equal <= '1' when (pNextWordToWrite(ADDR_WIDTH-1 downto 0) = pNextWordToRead(ADDR_WIDTH-1 downto 0)) else '0';
    Looped <= '1' when (pNextWordToWrite(ADDR_WIDTH) /= pNextWordToRead(ADDR_WIDTH)) else '0';	
    
	Full  <= '1' when Looped = '1' and Equal = '1'  	else '0';
	Empty <= '1' when Looped = '0' and Equal = '1'      else '0';

	full_out <= full;
	empty_out <= empty;
	
end architecture;
