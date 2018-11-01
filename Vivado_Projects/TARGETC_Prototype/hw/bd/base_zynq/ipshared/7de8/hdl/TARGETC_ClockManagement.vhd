
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
		clk:			in 	std_logic;	-- Clock for the TARGETC SCLK
		WL_CLK_DIV:		in 	std_logic_vector(31 downto 0); -- Clock Divider Through DFF
		
		PLL_LOCKED:		out	std_logic;
		
		SCLK :	 		out	STD_LOGIC;		-- Pin#36
		HSCLK:			out std_logic;		-- Pin#43 to Pin#44
		WL_CLK:			out std_logic;		-- Pin#57 to Pin#58
		RDAD_CLK:		out	std_logic;		-- Pin#61
		SSTIN:			out std_logic;		-- Pin 
		
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
	
	
	component TC_CLK_MNG_V2
	port(
		-- Clock out ports
		PLL_SSTIN: 		out	std_logic;
		PLL_SCLK: 		out	std_logic;
		PLL_RDAD_CLK: 	out	std_logic;
		PLL_HSCLK: 		out	std_logic;
		PLL_WL_CLK: 	out	std_logic;
		-- Status and control signals
		resetn:			in	std_logic;
		locked:			out	std_logic;
		REF_CLK_IN:	in	std_logic
	);
	end component;
	
	component ClkDivider is
		generic(
		MINFREQKHZ:	integer := 15625;
		OPFREQKHZ:	integer := 375000	
	);
	port ( 
		clk_i: 	in	std_logic;
		rst: 	in	std_logic;
		div:	in	std_logic_vector(31 downto 0);
		clk_o: 	out	std_logic
	);
	end component ClkDivider;
	
	-- --------------------------------------------------------------------------------
	-- Signal Declaration
	
	signal locked_intl:	std_logic;
	
	-- Internal Clock signals (intl)
	signal SCLK_intl:		std_logic;
	signal HSCLK_intl:		std_logic;
	signal RDAD_CLK_intl:	std_logic;
	signal SSTIN_intl:		std_logic;
	signal WL_CLK_intl:		std_logic;
	
	signal SCLK_PLL :		std_logic;
	signal HSCLK_PLL :		std_logic;
	signal RDAD_CLK_PLL :	std_logic;
	signal SSTIN_PLL :		std_logic;
	signal WL_CLK_PLL :		std_logic;
	
	signal WL_CLK_DFF:	std_logic;
	signal rstn :		std_logic;
	
begin
	
	TC_CLK_MNG_inst : TC_CLK_MNG_V2
	port map ( 
		-- Clock out ports  
		PLL_SSTIN 	=> SSTIN_PLL,
		PLL_SCLK 	=> SCLK_PLL,
		PLL_RDAD_CLK=> RDAD_CLK_PLL,
		PLL_HSCLK 	=> HSCLK_PLL,
		PLL_WL_CLK 	=> WL_CLK_PLL,
		-- Status and control signals                
		resetn => rst,
		locked => locked_intl,
		-- Clock in ports
		REF_CLK_IN => clk
	);
	
	
	SSTIN_intl <= '0' when locked_intl = '0' else SSTIN_PLL;
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

	WL_CLK_intl <= '0' when locked_intl = '0' else WL_CLK_DFF;
--	process(WL_CLK_DFF)
--	begin
--		if locked_intl = '1' then
--			WL_CLK_intl <= WL_CLK_DFF;
--		else
--			WL_CLK_intl <= '0';
--		end if;
--	end process;
	
	
	ClkDivider_inst : ClkDivider
	port map( 
		clk_i	=> WL_CLK_PLL,
		rst		=> rst,
		div		=>	WL_CLK_DIV,
		clk_o	=>  WL_CLK_DFF
	);
	

	
	--	------------------------------------------------------------
	-- Output For Standard and LVDS
	
	SCLK 	<= SCLK_intl;
	HSCLK	<= HSCLK_intl;
	WL_CLK	<= WL_CLK_intl;
	RDAD_CLK<= RDAD_CLK_intl;
	SSTIN	<= SSTIN_intl;
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


