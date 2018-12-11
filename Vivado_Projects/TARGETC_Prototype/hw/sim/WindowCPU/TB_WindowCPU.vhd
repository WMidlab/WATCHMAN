library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.WindowCPU_pkg.all;

entity TB_WindowCPU is
end TB_WindowCPU;

architecture implementation of TB_WindowCPU is

	component WindowCPU is
		generic(
			ADDRESS : integer := 0
		);
		Port (
		nrst : 			in	std_Logic;

		CLK:			in 	std_logic;

		cmd :			in 	std_logic_vector(2 downto 0);
		cmd_en:			in 	std_logic;

		valid :			out std_logic;
		CurAddr :		in std_logic_vector(7 downto 0);
		PREVBus_IN :	in	std_logic_vector(7 downto 0);

		PREVBus_OUT :	out	std_logic_vector(7 downto 0);

		NEXTBus_IN :	in	std_logic_vector(7 downto 0);

		NEXTBus_OUT :	out	std_logic_vector(7 downto 0)
		);

	end component WindowCPU;

	component WindowSelect is

		Port (
		CurAddr :		in std_logic_vector(7 downto 0);

		NextBus_In:		in Bus_t;
		PrevBus_In:		in Bus_t;

		NextAddr:		out std_logic_vector(7 downto 0);
		PrevAddr:		out std_logic_vector(7 downto 0)
		);
	end component WindowSelect;

	signal nrst :  std_logic;
	signal clk      : std_logic;

	signal cmd_sti :			std_logic_vector(2 downto 0);
	signal cmd_en:				std_logic_vector(15 downto 0);

	signal valid_obs :				std_logic_vector(15 downto 0);

	signal PREVBus_intl :		Bus_t;
	signal NEXTBus_intl :		Bus_t;

	signal CurWindowCnt :	std_logic_vector(7 downto 0);
	signal NextWindowCnt:	std_logic_vector(7 downto 0);
	signal PrevWindowCnt:	std_logic_vector(7 downto 0);

    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';

	constant CLK_PERIOD : time := 4 ns;


begin



	GEN_CPU : for I in 1 to 14 generate
		CPUX : WindowCPU
			generic map(
				ADDRESS => I
			)
			Port map(
			nrst			=> nrst,
			CLK				=> clk,

			cmd 			=> cmd_sti,
			cmd_en			=> cmd_en(I),
			valid 			=> valid_obs(I),

			CurAddr			=> CurWindowCnt,
			PREVBus_IN => PREVBus_intl(I),
			PREVBus_OUT =>  PREVBus_intl(I+1),
			NEXTBus_IN 	=> NEXTBus_intl(I),
			NEXTBus_OUT => NEXTBus_intl(I-1)
			);

	end generate;

	CPU0 : WindowCPU
		generic map(
			ADDRESS => 0
		)
		Port map(
		nrst			=> nrst,
		CLK				=> clk,

		cmd 			=> cmd_sti,
		cmd_en			=> cmd_en(0),
		valid 			=> valid_obs(0),

		CurAddr			=> CurWindowCnt,
		PREVBus_IN => PREVBus_intl(0),
		PREVBus_OUT =>  PREVBus_intl(1),
		NEXTBus_IN 	=> NEXTBus_intl(0),
		NEXTBus_OUT => NEXTBus_intl(15)
		);

	CPU15 : WindowCPU
		generic map(
			ADDRESS => 15
		)
		Port map(
		nrst			=> nrst,
		CLK				=> clk,

		cmd 			=> cmd_sti,
		cmd_en			=> cmd_en(15),
		valid 			=> valid_obs(15),

		CurAddr			=> CurWindowCnt,
		PREVBus_IN => PREVBus_intl(15),
		PREVBus_OUT =>  PREVBus_intl(0),
		NEXTBus_IN 	=> NEXTBus_intl(15),
		NEXTBus_OUT => NEXTBus_intl(14)
		);

	WDOSS : WindowSelect
		Port map (
		CurAddr 	=> CurWindowCnt,

		NextBus_In	=> NEXTBus_intl,
		PrevBus_In	=> PREVBus_intl,

		NextAddr	=> NextWindowCnt,
		PrevAddr	=> PrevWindowCnt
		);

	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);


	tb : process
		variable test : integer	:= 0;
	begin
		simulation_end_s <= '0';
		nrst <= '0';
		CurWindowCnt <= (others => '0');
		cmd_en <= (others => '0');
		wait for 2* CLK_PERIOD;
		nrst <= '1';
		wait for 10 us;

		wait until rising_edge(clk);
		wait for CLK_PERIOD;
		cmd_sti <= CMD_BOTH_EN;
		cmd_en(5) <= '1';
		cmd_en(6) <= '1';
		cmd_en(7) <= '1';
		cmd_en(8) <= '1';

		wait for CLK_PERIOD;
		cmd_en(5) <= '0';
		cmd_en(6) <= '0';
		cmd_en(7) <= '0';
		cmd_en(8) <= '0';

		for I in 0 to 15 loop
			CurWindowCnt <= NextWindowCnt;
			wait for 2*CLK_PERIOD;
		end loop;
		-- USER DEFINE
		wait for 10 us;
		-- Check if can dig out
		CurWindowCnt <= std_logic_vector(to_unsigned(6,8));
		wait until rising_edge(clk);
		wait for CLK_PERIOD;
		cmd_sti <= CMD_WR1_EN_DIS;
		cmd_en(6) <= '1';

		wait for CLK_PERIOD;
		cmd_en(6) <= '0';

		wait for CLK_PERIOD;
		cmd_sti <= CMD_WR2_EN_DIS;
		cmd_en(6) <= '1';

		wait for CLK_PERIOD;
		cmd_en(6) <= '0';


		wait for CLK_PERIOD;
		for I in 0 to 15 loop
			CurWindowCnt <= NextWindowCnt;
			wait for 2*CLK_PERIOD;
		end loop;



    	wait;
	end process;

end implementation;
