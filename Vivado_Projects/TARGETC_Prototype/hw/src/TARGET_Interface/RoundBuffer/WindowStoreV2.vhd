
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity WindowStoreV2 is
	Generic(
		NBRWINDOWS : integer := 16
	);
	Port (
	nrst : 			in	std_Logic;

	ClockBus:		in T_ClockBus;
	Timecounter:	in std_logic_vector(63 downto 0);

	-- Normal Operation
	valid:		in	std_logic_vector(NBRWINDOWS-1 downto 0);
	wr1_en:		in 	std_logic_vector(NBRWINDOWS-1 downto 0);
	Wr2_en:		in 	std_logic_vector(NBRWINDOWS-1 downto 0);

	triginfo:	in t_triginfobus(NBRWINDOWS-1 downto 0);

	-- FIFO out for Reading RDAD
    RDAD_ReadEn  :in  std_logic;
    RDAD_DataOut : out std_logic_vector(85 downto 0);
    RDAD_Empty	: out std_logic
	);

end WindowStoreV2;

architecture Behavioral of WindowStoreV2 is
	component aFifo is
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
	end component aFifo;

	component MUX256x8 is
	Port (
		A : in	std_logic_vector(255 downto 0);
		B:	out std_logic_vector(7 downto 0)
	);
	end component MUX256x8;

	signal Full_out_intl    : std_logic;
	signal WriteEn_intl  : std_logic;

	signal curr_Timecounter:	std_logic_vector(63 downto 0);
	signal prev_Timecounter:	std_logic_vector(63 downto 0);

	signal NewEvent : std_logic;
	signal data_in_intl : std_logic_vector(85 downto 0);

	signal valid_dly : 	std_logic_vector(NBRWINDOWS-1 downto 0);
	signal enablewdo:	std_logic_vector(NBRWINDOWS-1 downto 0);
	signal tmp_256:		std_logic_vector(255 downto 0);
	signal windowstore : std_logic_vector(7 downto 0);
begin


	-- See which window is being sampled
	process(ClockBus.CLK250MHz)
	begin
		if rising_edge(ClockBus.CLK250MHz) then
			valid_dly <= valid;
		end if;
	end process;

	GEN_en : for I in 0 to NBRWINDOWS-1 generate
		enablewdo(I) <=  '1' when (valid(I) = '1' and valid_dly(I)= '0') else '0';
	end generate;


	tmp_256(NBRWINDOWS-1 downto 0) <= enablewdo;
	tmp_256(255 downto NBRWINDOWS) <= (others => '0');
	Mux : MUX256x8
	port map(
		--A	=> enablewdo,
		A	=> tmp_256,
		B	=> windowstore
	);

	-- Old Style Data Record Now
	Data_in_intl(63 downto 0)		<= prev_TimeCounter;
	Data_in_intl(71 downto 64)	<= windowstore;
	Data_in_intl(72)				<= wr1_en(to_integer(unsigned(windowstore)));
	Data_in_intl(73)				<= wr2_en(to_integer(unsigned(windowstore)));
	--	Data_in_intl(100+5 downto 69+5)	<= x"00000" & triginfo(to_integer(unsigned(windowstore)));
	Data_in_intl(85 downto 74)	<= triginfo(to_integer(unsigned(windowstore)));

  	WriteEn_intl <= '1' when enablewdo /= std_logic_vector(to_unsigned(0,enablewdo'length)) else '0';

	-- Detect a change in any of the windows
	-- if change from 10 something else discard

	-- RDAD and Storage FIFO
	RDAD_STO_AFIFO :  aFifo
    generic map(
        DATA_WIDTH => 86,
        ADDR_WIDTH => 4	--Maybe more ?
    )
    port map (
    	rst 	=> nrst,
        -- Reading port.
        Data_out    => RDAD_DataOut,
        Empty_out   => RDAD_Empty,
        ReadEn_in   => RDAD_ReadEn,
        RClk        => ClockBus.RDAD_CLK,
        -- Writing port.
        Data_in     => Data_in_intl,
        Full_out    => Full_out_intl,
        WriteEn_in  => WriteEn_intl,
        WClk        => ClockBus.CLK250MHz
    );

   	process(ClockBus.SSTIN, nRST)
	begin
		if nrst = '0' then
			curr_TimeCounter <= (others => '0');
			prev_TimeCounter <= (others => '0');
		else
			if rising_edge(ClockBus.SSTIN) then
				curr_TimeCounter <= Timecounter;
				prev_TimeCounter <= curr_Timecounter;
			end if;
		end if;
	end process;


end Behavioral;
