
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

library unisim;
use unisim.vcomponents.all;

entity TC_ClockManagementV2 is

	port (
	-- TARGET C Ports for control and function
		nrst:			in	std_logic;
		clk1:			in 	std_logic;	-- Clock for the TARGETC SCLK
		clk2:			in 	std_logic;	-- Clock for the TARGETC SCLK
		
		WL_CLK_DIV:		in 	std_logic_vector(31 downto 0); -- Clock Divider Through DFF
		
		PLL_LOCKED:		out	std_logic;
		
		ClockBus:		out T_ClockBus;

		Timecounter:	out std_logic_vector(63 downto 0);		-- Pin 
		
		HSCLKdif:		in std_logic;		-- Pin#43 to Pin#44		
		 
		-- LVDS Differential Pair
		HSCLK_P:		out std_logic;		-- Pin#43
		HSCLK_N:		out std_logic;		-- Pin#44
		
		WL_CLK_P:		out std_logic;		-- Pin#57
		WL_CLK_N:		out std_logic;		-- Pin#58
		
		SSTIN_P:		out std_logic;		-- Pin#125 		
		SSTIN_N:		out std_logic		-- Pin#126 		
		
	);
end TC_ClockManagementV2;

architecture arch_imp of TC_ClockManagementV2 is

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
		
	component counter is 
	generic(
		NBITS : integer := 8
	);
	port(
		CLK : in  std_logic;
		RST : in  std_logic;
		Q : out std_logic_vector(NBITS-1 downto 0)
	);
	end component counter;	
	-- --------------------------------------------------------------------------------
	-- Signal Declaration
	
	signal locked_WL:	std_logic;
	signal locked_general,locked_general2:	std_logic;
	signal locked_intl:	std_logic;
	
	-- Internal Clock signals (intl)
	
	signal SCLKraw :		std_logic;
	signal HSCLKraw :		std_logic;
	signal RDAD_CLKraw :	std_logic;
	--signal CLK500MHzraw :	std_logic;
	--signal CLK500MHzraw2 :	std_logic;
	signal CLK250MHzraw :	std_logic;
	signal CLK250MHzraw2 :	std_logic;

	signal SSTIN_bufg:		std_logic;	
	signal SCLK_bufg :		std_logic;
	signal HSCLK_bufg :		std_logic;
	signal RDAD_CLK_bufg :	std_logic;
--	signal CLK500MHz_bufg :	std_logic;
	signal CLK250MHz_bufg :	std_logic;
	signal WL_CLK_bufg :		std_logic;
	
	signal SSTIN_intl:		std_logic;
	signal SCLK_intl :		std_logic;
	signal HSCLK_intl :		std_logic;
	signal RDAD_CLK_intl :	std_logic;
--	signal CLK500MHz_intl :	std_logic;
	signal CLK250MHz_intl :	std_logic;
	signal WL_CLK_intl :		std_logic;
	
	signal WL_CLK_100MHzraw : std_logic;
	signal WL_CLK_150MHzraw : std_logic;
	signal WL_CLK_200MHzraw : std_logic;
	signal WL_CLK_250MHzraw : std_logic;
	signal WL_CLK_300MHzraw : std_logic;
	
	signal WL_CLK_100MHz_bufg : std_logic;
	signal WL_CLK_150MHz_bufg : std_logic;
	signal WL_CLK_200MHz_bufg : std_logic;
	signal WL_CLK_250MHz_bufg : std_logic;
	signal WL_CLK_300MHz_bufg : std_logic;
	
	signal rst :		std_logic;
	signal Timecounter_intl : std_logic_vector(63 downto 0);
	signal clkFbOut_WL, clkFbOut : std_logic;
	signal clkFbIn_WL, clkFbIn : std_logic;
	
begin
	
	rst <= not nrst;
	
	  -- MMCM to generate base and fast clocks
	TC_CLK_MNG_inst : MMCME2_ADV
	generic map(
		BANDWIDTH			=> "OPTIMIZED",
		COMPENSATION         => "BUF_IN",
		STARTUP_WAIT         => false,
		DIVCLK_DIVIDE        => 1,
		CLKFBOUT_MULT_F      => 10.0,
		CLKFBOUT_PHASE       => 0.000,
		CLKFBOUT_USE_FINE_PS => false,
		CLKOUT0_DIVIDE_F       => 10.0, -- 169
		CLKOUT0_PHASE        => 0.000,
		CLKOUT0_DUTY_CYCLE   => 0.500,
		CLKOUT0_USE_FINE_PS  => false,
		CLKOUT1_DIVIDE       => 10, -- 254
		CLKOUT1_PHASE        => 0.000,
		CLKOUT1_DUTY_CYCLE   => 0.500,
		CLKOUT1_USE_FINE_PS  => false,
		CLKOUT2_DIVIDE       => 10, -- 51
		CLKOUT2_PHASE        => 0.000,
		CLKOUT2_DUTY_CYCLE   => 0.500,
		CLKOUT2_USE_FINE_PS  => false,
		CLKOUT3_DIVIDE       => 4,
		CLKOUT3_PHASE        => 0.000,
		CLKOUT3_DUTY_CYCLE   => 0.500,
		CLKOUT3_USE_FINE_PS  => false,
		--
		CLKIN1_PERIOD        => 10.0,
		--CLKIN2_PERIOD        => 10.0,
		REF_JITTER1          => 0.010,
		REF_JITTER2          => 0.010)
	port map(
		-- Output clocks
		CLKFBOUT     => clkFbOut,
		CLKFBOUTB    => open,
		CLKOUT0      => SCLKRaw,
		CLKOUT0B     => open,
		CLKOUT1      => RDAD_CLKRaw,
		CLKOUT1B     => open,
		CLKOUT2      => HSCLKRaw,
		CLKOUT2B     => open,
		CLKOUT3      => CLK250MHzRaw,
		CLKOUT3B     => open,
		CLKOUT4      => open,
		CLKOUT5      => open,
		CLKOUT6      => open,
		-- Input clock control
		CLKFBIN      => clkFbIn,
		CLKIN1       => clk1,
		CLKIN2       => '0',
		-- Tied to always select the primary input clock
		CLKINSEL     => '1',
		-- Ports for dynamic reconfiguration
		DADDR        => (others => '0'),
		DCLK         => '0',
		DEN          => '0',
		DI           => (others => '0'),
		DO           => open,
		DRDY         => open,
		DWE          => '0',
		-- Ports for dynamic phase shift
		PSCLK        => '0',
		PSEN         => '0',
		PSINCDEC     => '0',
		PSDONE       => open,
		-- Other control and status signals
		LOCKED       => locked_general,
		CLKINSTOPPED => open,
		CLKFBSTOPPED => open,
		PWRDWN       => '0',
		RST          => rst
	);

   BUFG_FB : BUFG
      port map (
         I => clkFbOut,
         O => clkFbIn
   );  

	BUFG_OUTSCLK : BUFG
	port map (
    	I => SCLKRaw,
    	O => SCLK_bufg
	);
	
	BUFG_OUTRDAD : BUFG
	port map (
    	I => RDAD_CLKRaw,
    	O => RDAD_CLK_bufg
	); 
	
	BUFG_OUTHSCLK : BUFG
	port map (
    	I => HSCLKRaw,
    	O => HSCLK_bufg
	); 
	
	BUFG_OUTCLK250 : BUFG
	port map (
    	I => CLK250MHzRaw,
    	O => CLK250MHz_bufg
	); 


   
	TC_CLK_MNG_WL_inst : MMCME2_ADV
	generic map(
		BANDWIDTH			=> "OPTIMIZED",
		COMPENSATION         => "BUF_IN",
		STARTUP_WAIT         => false,
		DIVCLK_DIVIDE        => 1,
		CLKFBOUT_MULT_F      => 10.0,
		CLKFBOUT_PHASE       => 0.000,
		CLKFBOUT_USE_FINE_PS => false,
		CLKOUT0_DIVIDE_F       => 5.0, -- 169
		CLKOUT0_PHASE        => 0.000,
		CLKOUT0_DUTY_CYCLE   => 0.500,
		CLKOUT0_USE_FINE_PS  => false,
		CLKOUT1_DIVIDE       => 6, -- 254
		CLKOUT1_PHASE        => 0.000,
		CLKOUT1_DUTY_CYCLE   => 0.500,
		CLKOUT1_USE_FINE_PS  => false,
		CLKOUT2_DIVIDE       => 8, -- 51
		CLKOUT2_PHASE        => 0.000,
		CLKOUT2_DUTY_CYCLE   => 0.500,
		CLKOUT2_USE_FINE_PS  => false,
		CLKOUT3_DIVIDE       => 10,
		CLKOUT3_PHASE        => 0.000,
		CLKOUT3_DUTY_CYCLE   => 0.500,
		CLKOUT3_USE_FINE_PS  => false,
		CLKOUT4_DIVIDE       => 15,
		CLKOUT4_PHASE        => 0.000,
		CLKOUT4_DUTY_CYCLE   => 0.500,
		CLKOUT4_USE_FINE_PS  => false,
		--
		CLKIN1_PERIOD        => 10.0,
		--CLKIN2_PERIOD        => 10.0,
		REF_JITTER1          => 0.010,
		REF_JITTER2          => 0.010)
	port map(
		-- Output clocks
		CLKFBOUT     => clkFbOut_WL,
		CLKFBOUTB    => open,
		CLKOUT0      => WL_CLK_300MHzRaw,
		CLKOUT0B     => open,
		CLKOUT1      => WL_CLK_250MHzRaw,
		CLKOUT1B     => open,
		CLKOUT2      => WL_CLK_200MHzRaw,
		CLKOUT2B     => open,
		CLKOUT3      => WL_CLK_150MHzRaw,
		CLKOUT3B     => open,
		CLKOUT4      => WL_CLK_100MHzRaw,
		CLKOUT5      => open,
		CLKOUT6      => open,
		-- Input clock control
		CLKFBIN      => clkFbIn_WL,
		CLKIN1       => clk2,
		CLKIN2       => '0',
		-- Tied to always select the primary input clock
		CLKINSEL     => '1',
		-- Ports for dynamic reconfiguration
		DADDR        => (others => '0'),
		DCLK         => '0',
		DEN          => '0',
		DI           => (others => '0'),
		DO           => open,
		DRDY         => open,
		DWE          => '0',
		-- Ports for dynamic phase shift
		PSCLK        => '0',
		PSEN         => '0',
		PSINCDEC     => '0',
		PSDONE       => open,
		-- Other control and status signals
		LOCKED       => locked_WL,
		CLKINSTOPPED => open,
		CLKFBSTOPPED => open,
		PWRDWN       => '0',
		RST          => rst
	);

   BUFG_WL : BUFG
      port map (
         I => clkFbOut_WL,
         O => clkFbIn_WL
   );          

	BUFG_OUT300 : BUFG
	port map (
    	I => WL_CLK_300MHzRaw,
    	O => WL_CLK_300MHz_bufg
	);
	
	BUFG_OUT250 : BUFG
	port map (
    	I => WL_CLK_250MHzRaw,
    	O => WL_CLK_250MHz_bufg
	); 
	
	BUFG_OUT200 : BUFG
	port map (
    	I => WL_CLK_200MHzRaw,
    	O => WL_CLK_200MHz_bufg
	);
	
	BUFG_OUT150 : BUFG
	port map (
    	I => WL_CLK_150MHzRaw,
    	O => WL_CLK_150MHz_bufg
	); 
	
	BUFG_OUT100 : BUFG
	port map (
    	I => WL_CLK_100MHzRaw,
    	O => WL_CLK_100MHz_bufg
	); 
	
	process(WL_CLK_300MHz_bufg)
	begin
		case WL_CLK_DIV is
			when x"00000000" =>
				WL_CLK_bufg <= 	WL_CLK_100MHz_bufg;
			when x"00000001" =>
				WL_CLK_bufg <= 	WL_CLK_150MHz_bufg;
			when x"00000002" =>
				WL_CLK_bufg <= 	WL_CLK_200MHz_bufg;
			when x"00000003" =>
				WL_CLK_bufg <= 	WL_CLK_250MHz_bufg;
			when x"00000004" =>
				WL_CLK_bufg <= 	WL_CLK_300MHz_bufg;
			when others =>
				WL_CLK_bufg <= 	WL_CLK_100MHz_bufg;
		end case;
	end process;

	
	locked_intl <= 	'0' when locked_general = '0' or locked_WL = '0' else
					'1';
					
	--CLK500MHz_intl <= '0' when locked_intl = '0' else CLK500MHzraw;
	CLK250MHz_intl <= '0' when locked_intl = '0' else CLK250MHzraw;
	
	RDAD_CLK_intl <= '0' when locked_intl = '0' else RDAD_CLK_bufg;
	
	SCLK_intl <= '0' when locked_intl = '0' else SCLK_bufg;
	
	HSCLK_intl <= '0' when locked_intl = '0' else HSCLK_bufg;

	WL_CLK_intl <= '0' when locked_intl = '0' else WL_CLK_bufg;
	
	SSTIN_intl <= '0' when locked_intl = '0' else SSTIN_bufg;
	
	--	------------------------------------------------------------
	-- Output For Standard and LVDS
	
	TimeCnt_inst : counter 
	generic map(
		NBITS => 64
	)
	port map(
		CLK 	=> CLK250MHz_intl,
		RST => nrst,
		Q 	=> Timecounter_intl
	);
	TimeCounter <= Timecounter_intl;
	
	SSTIN_bufg	<= not Timecounter_intl(3);
	
	ClockBus.SCLK 	<= SCLK_intl;
	ClockBus.HSCLK	<= HSCLK_intl;
	ClockBus.WL_CLK	<= WL_CLK_intl;
	ClockBus.RDAD_CLK<= RDAD_CLK_intl;
	ClockBus.CLK250MHz	<= CLK250MHz_intl;
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


