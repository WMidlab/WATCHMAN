
-- Clock Wizard for :
		-- |	Name	|	Period	|	Frequency	|
		--  ------------|-----------|---------------|
		-- |	SSTIN	|	64 ns	|	15.625 MHz	| 
		-- |	SCLK	|	...		|	250 MHz		|	Derived from SSTIN main clock 16*SSTIN
		-- |	RDAD_CLK|	...		|	250 MHz		|	Derived from SSTIN main clock 16*SSTIN
		-- |	HSCLK	|	...		|	250 MHz		|	Derived from SSTIN main clock 16*SSTIN
		-- |	WL_CLK	|	...		|	MAXFREQ		|	Derived from SSTIN main clock but Variable [SSTIN:MAXFREQ]
	

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;

entity TC_ClockManagement is

	port (
	-- TARGET C Ports for control and function
		rst:			in	std_logic;
		clk1:			in 	std_logic;	-- Clock for the TARGETC SCLK
		clk2:			in 	std_logic;	-- Clock for the TARGETC SCLK
		
		WL_CLK_DIV:		in 	std_logic_vector(31 downto 0); -- Clock Divider Through DFF
		
		PLL_LOCKED:		out	std_logic;
		
		ClockBus:		out T_ClockBus;

		SSTIN:			in std_logic;		-- Pin 
		
		HSCLKdif:		in std_logic;		-- Pin#43 to Pin#44		
		 
		-- LVDS Differential Pair
		HSCLK_P:		out std_logic;		-- Pin#43
		HSCLK_N:		out std_logic;		-- Pin#44
		
		WL_CLK_P:		out std_logic;		-- Pin#57
		WL_CLK_N:		out std_logic;		-- Pin#58
		
		SSTIN_P:		out std_logic;		-- Pin#125 		
		SSTIN_N:		out std_logic		-- Pin#126 		
		
	);
end TC_ClockManagement;

architecture arch_imp of TC_ClockManagement is

	-- --------------------------------------------------------------------------------
	-- Component Declaration
	component OBUFDS is
	generic(
		CAPACITANCE : string     := "DONT_CARE";
		IOSTANDARD  : string     := "DEFAULT"
	);

	port(
		O  : out std_ulogic;
		OB : out std_ulogic;

		I : in std_ulogic
	);
	end component OBUFDS;
	
	
	component TC_CLK_MNG_V3
	port(
		-- Clock out ports
		PLL_SCLK: 		out	std_logic;
		PLL_RDAD_CLK: 	out	std_logic;
		PLL_HSCLK: 		out	std_logic;
		PLL_500MHz: 	out	std_logic;
		-- Status and control signals
		resetn:			in	std_logic;
		locked:			out	std_logic;
		REF_CLK_IN:	in	std_logic
	);
	end component;
	
	component CLK_MNG_WL
	port(
		-- Clock out ports
		WL_CLK_300MHz: 	out	std_logic;
		WL_CLK_250MHz: 	out	std_logic;
		WL_CLK_200MHz: 	out	std_logic;
		WL_CLK_150MHz: 	out	std_logic;
		WL_CLK_100MHz: 	out	std_logic;
		-- Status and control signals
		resetn:			in	std_logic;
		locked:			out	std_logic;
		
		REF_CLK_IN:	in	std_logic
	);
	end component;
		
	-- --------------------------------------------------------------------------------
	-- Signal Declaration
	
	signal locked_WL:	std_logic;
	signal locked_general:	std_logic;
	signal locked_intl:	std_logic;
	
	-- Internal Clock signals (intl)
	signal SSTIN_intl:		std_logic;
	signal SCLK_intl:		std_logic;
	signal HSCLK_intl:		std_logic;
	signal RDAD_CLK_intl:	std_logic;
	signal CLK500MHz_intl:		std_logic;
	signal WL_CLK_intl:		std_logic;
	
	signal SCLK_PLL :		std_logic;
	signal HSCLK_PLL :		std_logic;
	signal RDAD_CLK_PLL :	std_logic;
	signal CLK500MHz_PLL :	std_logic;
	signal WL_CLK_PLL :		std_logic;
	
	signal WL_CLK_100MHz_intl : std_logic;
	signal WL_CLK_150MHz_intl : std_logic;
	signal WL_CLK_200MHz_intl : std_logic;
	signal WL_CLK_250MHz_intl : std_logic;
	signal WL_CLK_300MHz_intl : std_logic;
	
	signal WL_CLK_DFF:	std_logic;
	signal rstn :		std_logic;
	
	signal dump : std_logic;
	signal clk_intl : std_logic;
begin
	
	--clk_intl <= clk;
	
	TC_CLK_MNG_inst : TC_CLK_MNG_V3
	port map ( 
		-- Clock out ports  
		PLL_SCLK 	=> SCLK_PLL,
		PLL_RDAD_CLK=> RDAD_CLK_PLL,
		PLL_HSCLK 	=> HSCLK_PLL,
		PLL_500MHz 	=> CLK500MHz_PLL,
		-- Status and control signals                
		resetn => rst,
		locked => locked_general,
		-- Clock in ports
		REF_CLK_IN => clk1
	);
	
	TC_CLK_MNG_WL_inst : CLK_MNG_WL
	port map(
		-- Clock out ports
		WL_CLK_300MHz	=> WL_CLK_300MHz_intl,
		WL_CLK_250MHz	=> WL_CLK_250MHz_intl,
		WL_CLK_200MHz	=> WL_CLK_200MHz_intl,
		WL_CLK_150MHz	=> WL_CLK_150MHz_intl,
		WL_CLK_100MHz	=> WL_CLK_100MHz_intl,
		
		-- Status and control signals
		resetn	=> rst,
		locked	=> locked_WL,
		
		REF_CLK_IN	=> clk2
	);
	
	process(WL_CLK_300MHz_intl)
	begin
		case WL_CLK_DIV is
			when x"00000000" =>
				WL_CLK_PLL <= 	WL_CLK_100MHz_intl;
			when x"00000001" =>
				WL_CLK_PLL <= 	WL_CLK_150MHz_intl;
			when x"00000002" =>
				WL_CLK_PLL <= 	WL_CLK_200MHz_intl;
			when x"00000003" =>
				WL_CLK_PLL <= 	WL_CLK_250MHz_intl;
			when x"00000004" =>
				WL_CLK_PLL <= 	WL_CLK_300MHz_intl;
			when others =>
				WL_CLK_PLL <= 	WL_CLK_100MHz_intl;
		end case;
	end process;
--	WL_CLK_DFF <= 	WL_CLK_100MHz_intl when WL_CLK_DIV = x"00000000" else
--	 				WL_CLK_150MHz_intl when WL_CLK_DIV = x"00000001" else
--	 				WL_CLK_200MHz_intl when WL_CLK_DIV = x"00000002" else
--	 				WL_CLK_250MHz_intl when WL_CLK_DIV = x"00000003" else
--	 				WL_CLK_300MHz_intl when WL_CLK_DIV = x"00000004" else
--	 				WL_CLK_100MHz_intl;
	
	locked_intl <= 	'0' when locked_general = '0' or locked_WL = '0' else
					'1';
					
	CLK500MHz_intl <= '0' when locked_intl = '0' else CLK500MHz_PLL;
--	process(SSTIN_PLL)
--	begin
--		if locked_intl = '1' then
--			SSTIN_intl <= SSTIN_PLL;
--		else
--			SSTIN_intl <= '0';
--		end if;
--	end process;
	
	RDAD_CLK_intl <= '0' when locked_intl = '0' else RDAD_CLK_PLL;
--	process(RDAD_CLK_PLL)
--	begin
--		if locked_intl = '1' then
--			RDAD_CLK_intl <= RDAD_CLK_PLL;
--		else
--			RDAD_CLK_intl <= '0';
--		end if;
--	end process;
	
	SCLK_intl <= '0' when locked_intl = '0' else SCLK_PLL;
--	process(SCLK_PLL)
--	begin
--		if locked_intl = '1' then
--			SCLK_intl <= SCLK_PLL;
--		else
--			SCLK_intl <= '0';
--		end if;
--	end process;
	
	HSCLK_intl <= '0' when locked_intl = '0' else HSCLK_PLL;
--	process(HSCLK_PLL)
--	begin
--		if locked_intl = '1' then
--			HSCLK_intl <= HSCLK_PLL;
--		else
--			HSCLK_intl <= '0';
--		end if;
--	end process;

	WL_CLK_intl <= '0' when locked_intl = '0' else WL_CLK_PLL;
--	process(WL_CLK_DFF)
--	begin
--		if locked_intl = '1' then
--			WL_CLK_intl <= WL_CLK_DFF;
--		else
--			WL_CLK_intl <= '0';
--		end if;
--	end process;
	
	SSTIN_intl <= '0' when locked_intl = '0' else SSTIN;
	
	--	------------------------------------------------------------
	-- Output For Standard and LVDS
	
	ClockBus.SCLK 	<= SCLK_intl;
	ClockBus.HSCLK	<= HSCLK_intl;
	ClockBus.WL_CLK	<= WL_CLK_intl;
	ClockBus.RDAD_CLK<= RDAD_CLK_intl;
	ClockBus.CLK500MHz	<= CLK500MHz_intl;
	ClockBus.SSTIN	<= SSTIN_intl;
	
	
	
	PLL_LOCKED <= locked_intl;
	
	OBUFDF_SSTIN : OBUFDS
	generic map(
		IOSTANDARD  => "LVDS_25"
	)
	port map(
		O	=> SSTIN_P,
		OB	=> SSTIN_N,

		I	=> SSTIN_intl
	);
	
	OBUFDF_WL_CLK : OBUFDS
	generic map(
		IOSTANDARD  => "LVDS_25"
	)
	port map(
		O	=> WL_CLK_P,
		OB	=> WL_CLK_N,

		I	=> WL_CLK_intl
	);
	
	OBUFDF_HSCLK : OBUFDS
	generic map(
		IOSTANDARD  => "LVDS_25"
	)
	port map(
		O	=> HSCLK_P,
		OB	=> HSCLK_N,

		I	=> HSCLKdif
	);
	
end arch_imp;


