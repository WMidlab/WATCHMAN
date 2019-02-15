library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg_old.all;
use std.textio.all;

entity TB_RoundBuffer_Beginning is
end TB_RoundBuffer_Beginning;

architecture implementation of TB_RoundBuffer_Beginning is
	
	component WindowCPUV2 is
		generic(
			ADDRESS : integer := 0
		);
		Port (

		nrst : 			in	std_Logic;
	--	SSTIN:			in std_logic;
		CLK:			in 	std_logic;

		--Window Part
		BusA :			in t_CommandBus;
		BusB :			in t_CommandBus;
		BusC :			in t_CommandBus;
		BusD :			in t_CommandBus;

		TrigInfo_IN:	in t_triggerinformation;
		TrigInfo_OUT:	out std_logic_vector(11 downto 0);

		wr1_en :		out std_logic;
		wr2_en :		out	std_logic;
		valid_o	:		out std_logic;

		CurAddr:		in 	std_logic_vector(7 downto 0);
		PREVBus_IN :	in	std_logic_vector(7 downto 0);
		PREVBus_OUT :	out	std_logic_vector(7 downto 0);
		NEXTBus_IN :	in	std_logic_vector(7 downto 0);
		NEXTBus_OUT :	out	std_logic_vector(7 downto 0)
		);

	end component WindowCPUV2;

	-- -------------------------------------------------------------
	-- Constant
	-- -------------------------------------------------------------
	constant NBRWINDOWS : integer := 16;
	constant BusZero : t_CommandBus := (addr => (others => '0'),
										en => '0',
										cmd => (others => '0'));
	-- -------------------------------------------------------------
	-- SIGNALS
	-- -------------------------------------------------------------

	signal nrst :  std_logic;
	signal Refclk     : std_logic;

	signal trigger_sti : std_logic_vector(3 downto 0);
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';

	signal BusA_intl :			t_CommandBus;
	signal BusB_intl :			t_CommandBus;
	signal BusC_intl :			t_CommandBus;
	signal BusD_intl :			t_CommandBus;
	
	signal	TrigInfo_intl:	t_triggerinformation;
	
	signal wr1_en_intl : std_logic_vector(NBRWINDOWS-1 downto 0);
	signal wr2_en_intl : std_logic_vector(NBRWINDOWS-1 downto 0);
	signal valid_intl : std_logic_vector(NBRWINDOWS-1 downto 0);
	
	signal	CurWindowCnt:		std_logic_vector(7 downto 0);

	signal PREVBus_intl :		Bus_t(NBRWINDOWS-1 downto 0);
	signal NEXTBus_intl :		Bus_t(NBRWINDOWS-1 downto 0);
	
	signal tmp : integer := 0;

	constant CLK100MHz_PERIOD	: time := 10 ns;

	signal ClockBus_intl:		T_ClockBus;
	signal timecounter_intl : std_logic_vector(63 downto 0);

	--Variable for TB
	file fd : text open WRITE_MODE is "/home/jonathan/VivadoProjects/00_WATCHMANN/TARGETC_Prototype/hw/sim/00_Reports/TB_RoundBufferElement_REPORT.txt";

begin

	TrigInfo_intl <= (others => (others => '0'));
	
	GEN_CPU : for I in 1 to (NBRWINDOWS-2) generate
		CPUX : WindowCPUV2
			generic map(
				ADDRESS => I
			)
			Port map(
			nrst			=> nrst,
			CLK				=> Refclk,

			BusA 			=> BusA_intl,
			BusB 			=> BusB_intl,
			BusC 			=> BusC_intl,
			BusD 			=> BusD_intl,

			TrigInfo_IN		=> TrigInfo_intl,
			TrigInfo_OUT	=> open,

			valid_o 		=> valid_intl(I),
			wr1_en 			=> wr1_en_intl(I),
			wr2_en			=> wr2_en_intl(I),

			CurAddr			=> CurWindowCnt,
			PREVBus_IN 		=> PREVBus_intl(I),
			PREVBus_OUT 	=> PREVBus_intl(I+1),
			NEXTBus_IN 		=> NEXTBus_intl(I),
			NEXTBus_OUT 	=> NEXTBus_intl(I-1)
			);

	end generate;

	CPU0 : WindowCPUV2
		generic map(
			ADDRESS => 0
		)
		Port map(
		nrst			=> nrst,
		CLK				=> Refclk,

		BusA 			=> BusA_intl,
		BusB 			=> BusB_intl,
		BusC 			=> BusC_intl,
		BusD 			=> BusD_intl,

		TrigInfo_IN		=> TrigInfo_intl,
		TrigInfo_OUT	=> open,

		valid_o 		=> valid_intl(0),
		wr1_en 			=> wr1_en_intl(0),
		wr2_en			=> wr2_en_intl(0),

		CurAddr			=> CurWindowCnt,

		PREVBus_IN => PREVBus_intl(0),
		PREVBus_OUT =>  PREVBus_intl(1),
		NEXTBus_IN 	=> NEXTBus_intl(0),
		NEXTBus_OUT => NEXTBus_intl(NBRWINDOWS-1)
		);

	CPULAST : WindowCPUV2
		generic map(
			ADDRESS => NBRWINDOWS-1
		)
		Port map(
		nrst			=> nrst,
		CLK				=> Refclk,

		BusA 			=> BusA_intl,
		BusB 			=> BusB_intl,
		BusC 			=> BusC_intl,
		BusD 			=> BusD_intl,

		TrigInfo_IN		=> TrigInfo_intl,
		TrigInfo_OUT	=> open,

		valid_o 		=> valid_intl(NBRWINDOWS-1),
		wr1_en 			=> wr1_en_intl(NBRWINDOWS-1),
		wr2_en			=> wr2_en_intl(NBRWINDOWS-1),

		CurAddr			=> CurWindowCnt,
		PREVBus_IN => PREVBus_intl(NBRWINDOWS-1),
		PREVBus_OUT =>  PREVBus_intl(0),
		NEXTBus_IN 	=> NEXTBus_intl(NBRWINDOWS-1),
		NEXTBus_OUT => NEXTBus_intl(NBRWINDOWS-2)
		);

	-- Clock generation
	clock_generator(Refclk,simulation_end_s, CLK100MHz_PERIOD);

	process(Refclk,nrst)
	begin
		if nrst = '0' then
			CurWindowCnt <= (others => '0');
			tmp <= 0;
		else
			if rising_edge(Refclk) then
				tmp <= tmp + 1;
				if tmp = 15 then
					tmp <= 0;
					CurWindowCnt <= (others => '0');
					if CurWindowCnt = std_logic_vector(to_unsigned(NBRWINDOWS-1,8)) then
						CurWindowCnt <= (others => '0');
					else
						CurWindowCnt <= std_logic_vector(unsigned(CurWindowCnt)+1); 
					end if;
				end if;
			end if;
		end if;
	end process;

	tb : process
		variable test : integer	:= 0;
	begin
		simulation_end_s <= '0';
		nrst <= '0';

		BusA_intl <= BusZero;
		BusB_intl <= BusZero;
		BusC_intl <= BusZero;
		BusD_intl <= BusZero;
		
		wait for 10 us;
		nrst <= '1';
		
		wait until  CurWindowCnt = x"02";
		wait until rising_Edge(RefClk);
		BusA_intl.addr <= x"02";
		BusA_intl.cmd <= CMD_WR2_MARKED;
		wait until rising_Edge(RefClk);
		BusA_intl.en <= '1';
		wait until rising_Edge(RefClk); 
		BusA_intl.en <= '0';
		wait until rising_Edge(RefClk);
		wait until  CurWindowCnt = x"03";
		wait until rising_Edge(RefClk);
		BusA_intl.addr <= x"03";
		BusA_intl.cmd <= CMD_WR1_MARKED;
		wait until rising_Edge(RefClk); 
		BusA_intl.en <= '1';
		wait until rising_Edge(RefClk); 
		BusA_intl.en <= '0';
    	wait for 10 us;
		BusA_intl.addr <= x"02";
    	BusA_intl.cmd <= CMD_WR2_EN_DIS;
    	wait until rising_Edge(RefClk); 
    	BusA_intl.en <= '1';
    	wait until rising_Edge(RefClk); 
    	BusA_intl.en <= '0';    	
	end process;

end implementation;
