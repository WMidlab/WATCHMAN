library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;

entity TB_STO_RDAD is
end TB_STO_RDAD;

architecture implementation of TB_STO_RDAD is
	

	component RoundBufferGray500MHz is
	Generic (
	MAXWINDOWS : integer := 4
	);
	Port ( 
	CLK500MHz :		in  STD_LOGIC;
	RST : 			in	STD_Logic;
	
	ClockBus:		in T_ClockBus;
	TimeCounter:	out	std_logic_vector(63 downto 0);
	--eTPG :			in std_logic;
	
	WR_RS_S:		out std_logic_vector(1 downto 0);
	WR_CS_S:		out std_logic_vector(5 downto 0);

	
	CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
	
	-- FIFO out for Reading RDAD
    RDAD_ReadEn  :in  std_logic;
    RDAD_DataOut : out std_logic_vector(100 downto 0);	
    --RDAD_CLK     :in  std_logic;	-- RDAD CLK
    RDAD_Empty	: out std_logic;
     
    -- FIFO IN for Digiting
    DIG_Full	: out	std_logic;
    DIG_DataIn	: in	std_logic_vector(8 downto 0);
    DIG_WriteEn	: in	std_logic
    --DIG_CLK   	: in	std_logic
	);
	
	end component RoundBufferGray500MHz;

	component TARGETC_RDAD_WL_SMPL is
		Port ( 
		--CLK : 			in  STD_LOGIC;
		RST : 			in	STD_Logic;
	
		DISCH_PERIOD :	in	std_logic_vector(15 downto 0);
		INCR_WAIT_PERIOD:	in std_logic_vector(15 downto 0);
	
		ClockBus:		in T_ClockBus;
		TimeCounter:	in std_logic_vector(63 downto 0);
		
		RDAD_CLK:		out	std_logic;		-- Pin#61
		RDAD_SIN:		out	std_logic;		-- Pin#62
		RDAD_DIR:		out	std_logic;		-- Pin#63
	
		-- Fifo from storage
		RDAD_ReadEn  :	out	std_logic;
		RDAD_DataOut : 	in	std_logic_vector(100 downto 0);	
		--RDAD_CLK     :	out	std_logic;	-- RDAD CLK
		RDAD_Empty	: 	in 	std_logic;
		
		-- FIFO IN for Digiting
		DIG_Full	: in	std_logic;
		DIG_DataIn	: out	std_logic_vector(8 downto 0);
		DIG_WriteEn	: out	std_logic;
		
		RAMP:			out	std_logic;
		GCC_RESET:		out	std_logic;
	
		HSCLK : 			out  STD_LOGIC;
		
		DO : 			in std_logic_vector(15 downto 0);
		SS_INCR:		out std_logic;
		SS_RESET:		out std_logic;
	
		CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
		CtrlBus_OxSL:		out	T_CtrlBus_OxSL; --Outputs from Control Master

		WDOTime:			out std_logic_vector(63 downto 0);
		DIGTime:			out std_logic_vector(63 downto 0);
		Trigger:			out std_logic_vector(31 downto 0);
		WDONbr:				out std_logic_vector(8 downto 0);	
		
		FIFOresponse:		in std_logic
	
		);
	end component TARGETC_RDAD_WL_SMPL;
	
	component FifoManagerV4 is
	generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32

	);
	port (
		nRST:		in	std_logic;
		CLK:		in	std_logic;
		
		--DATA INCOMING
		PRECvalid:	in	std_logic;
		FIFOresponse:	out std_logic;
		--Header Information
		WDOTime	:	in std_logic_vector(63 downto 0);
		DIGTime	:	in std_logic_vector(63 downto 0);
		Trigger	:	in std_logic_vector(31 downto 0);
		WDONBR :	in std_logic_vector(8 downto 0);
		
		--Channels
		CH0 :			in	std_logic_vector(11 downto 0);
		CH1 :			in	std_logic_vector(11 downto 0);
		CH2 :			in	std_logic_vector(11 downto 0);
		CH3 :			in	std_logic_vector(11 downto 0);
	
		CH4 :			in	std_logic_vector(11 downto 0);
		CH5 :			in	std_logic_vector(11 downto 0);
		CH6 :			in	std_logic_vector(11 downto 0);
		CH7 :			in	std_logic_vector(11 downto 0);
	
		CH8 :			in	std_logic_vector(11 downto 0);
		CH9 :			in	std_logic_vector(11 downto 0);
		CH10 :			in	std_logic_vector(11 downto 0);
		CH11 :			in	std_logic_vector(11 downto 0);
	
		CH12 :			in	std_logic_vector(11 downto 0);
		CH13 :			in	std_logic_vector(11 downto 0);
		CH14 :			in	std_logic_vector(11 downto 0);
		CH15 :			in	std_logic_vector(11 downto 0);				
		
		-- DATA TO STREAM
		FIFOvalid:	out	std_logic;
		ready_i:		in 	std_logic;
		DataOut:	out	std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0)
	);
	end component FifoManagerV4;
	
	
	signal rst :  std_logic;
	signal clk      : std_logic;
	signal clk500MHz :std_logic;
	
	signal ClockBus_intl   :  T_ClockBus;
	
	signal CtrlBus_IxSL_intl : T_CtrlBus_OxMS_Intl;
	signal CtrlBus_OxSL_intl : T_CtrlBus_IxMS_Intl;
		
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';

	signal RDAD_ReadEn_intl  :  std_logic;
	signal RDAD_DataOut_intl : std_logic_vector(100 downto 0);
    signal RDAD_Empty_intl     :  std_logic;	
    
    signal DIG_DataIn_intl	: std_logic_vector(8 downto 0);
    signal DIG_WriteEn_intl	: std_logic;
    signal DIG_Full_intl	: std_logic;
    signal DIG_CLK_sti   	: std_logic;
    signal timecounter_intl : std_logic_vector(63 downto 0);
    
    signal FIFOresponse_sti : std_logic;
    signal DO_sti : std_logic_vector(15 downto 0);
    
    signal WDOTime_intl:			 std_logic_vector(63 downto 0);
	signal DIGTime_intl:			 std_logic_vector(63 downto 0);
	signal Trigger_intl:			 std_logic_vector(31 downto 0);
	signal WDONbr_intl:				 std_logic_vector(8 downto 0);
	
	signal ready_sti: std_logic;
	
	constant CLK_PERIOD : time := 10 ns;
	constant CLK500_PERIOD : time := 2 ns;
	constant CLK_RDAD_PERIOD : time := 10 ns;
	constant CLK_WL_PERIOD : time := 10 ns;
	Constant CLK_HSCLK_PERIOD : time := 10 ns;
	constant SSTIN_PERIOD : time := 64 ns;
	
begin


	DUT1 :RoundBufferGray500MHz
	generic map(
		MAXWINDOWS => 4
	)
	port map(
		clk500mhz => clk500mhz,
		RST => rst,
	
		ClockBus	=> ClockBus_intl,
		TimeCounter	=> timecounter_intl,
		--eTPG :			in std_logic;
	
		WR_RS_S		=> open,
		WR_CS_S		=> open,
	
		CtrlBus_IxSL	=> CtrlBus_IxSL_intl,
		
		RDAD_ReadEn => RDAD_ReadEn_intl,
		RDAD_DataOut => RDAD_DataOut_intl,
		--RDAD_CLK	=> ClockBus.RDAD_CLK,
		RDAD_Empty 	=> RDAD_Empty_intl,
		
		DIG_DataIn	=> DIG_DataIn_intl,
    	DIG_WriteEn	=> DIG_WriteEn_intl,
    	--DIG_CLK   	=> clk,
    	DIG_Full	=> DIG_Full_intl
	);
		
	DUT2 :	 TARGETC_RDAD_WL_SMPL 
		Port map( 
		--CLK : 			in  STD_LOGIC;
		RST => rst,
		DISCH_PERIOD	=> x"0064",
		INCR_WAIT_PERIOD => x"0032",
		ClockBus	=> ClockBus_intl,
		TimeCounter	=> timecounter_intl,
		RDAD_CLK => open,
		RDAD_SIN => open,
		RDAD_DIR => open,
	
		-- Fifo from storage
		RDAD_ReadEn	=> RDAD_ReadEn_intl,
		RDAD_DataOut => RDAD_DataOut_intl,
		--RDAD_CLK    => clk,
		RDAD_Empty	=> RDAD_Empty_intl,
		
		-- FIFO IN for Digiting
		DIG_Full	=> DIG_Full_intl,
		DIG_DataIn		=> DIG_DataIn_intl,
		DIG_WriteEn	=> DIG_WriteEn_intl,
    --DIG_CLK   	: in	std_logic
    	
		RAMP => open,
		GCC_RESET => open,
	
		HSCLK  => open,
		
		DO => DO_sti,
		SS_INCR => open,
		SS_RESET => open,
	
		CtrlBus_IxSL		=> CtrlBus_IxSL_intl,
		CtrlBus_OxSL		=> CtrlBus_OxSL_intl,

		WDOTime	=> WDOTime_intl,
		DIGTime => DIGTime_intl,
		Trigger => Trigger_intl,
		WDONbr => WDONBR_intl,
		
		FIFOresponse => FIFOresponse_sti
	);
	
	DUT3 : FifoManagerV4
	generic map(
		C_M_AXIS_TDATA_WIDTH	=> 32
	)
	port map(
		nRST=> rst,
		CLK=>clk,
		
		--DATA INCOMING
		PRECvalid	=> CtrlBus_OxSL_intl.SSVALID,
		FIFOresponse => FIFOresponse_sti,
		--Header Information
		WDOTime	=> WDOTime_intl,
		DIGTime => DIGTime_intl,
		Trigger => Trigger_intl,
		WDONbr => WDONBR_intl,
		
		--Channels
		CH0 => "100000000000",
		CH1 => "000000000001",
		CH2 => "000000000010",
		CH3 => "000000000011",
	
		CH4 => "000000000100",
		CH5 => "000000000101",
		CH6 => "000000000110",
		CH7 => "000000000111",
	
		CH8 => "000000001000",
		CH9 => "000000001001",
		CH10 => "000000001010",
		CH11 => "000000001011",
	
		CH12 => "000000001100",
		CH13 => "000000001101",
		CH14 => "000000001110",
		CH15 => "000000001111",
		
		-- DATA TO STREAM
		FIFOvalid	=> open,
		ready_i		=> ready_sti,
		DataOut	=> open
	);
	
	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);
    clock_generator(clk500MHz,simulation_end_s, CLK500_PERIOD);
	clock_generator(ClockBus_intl.SSTIN,simulation_end_s, SSTIN_PERIOD);
	clock_generator(ClockBus_intl.RDAD_CLK,simulation_end_s, CLK_RDAD_PERIOD);
	clock_generator(ClockBus_intl.WL_CLK,simulation_end_s, CLK_WL_PERIOD);
	clock_generator(ClockBus_intl.HSCLK,simulation_end_s, CLK_HSCLK_PERIOD);
	
	------------------------------------------------------------------------------------------
	-- TESTBENCH -----------------------------------------------------------------------------
	------------------------------------------------------------------------------------------

	tb : process
		
		procedure PROCWDO(
			signal En	:	out std_logic;
			signal Clk	:	in std_logic) is
		begin
			wait until rising_edge(Clk);
			wait for SSTIN_PERIOD;
			En <= '1';
			wait for SSTIN_PERIOD;
			En <= '0';
		end procedure;
		
		variable ssvalid_flg : integer;
	begin
		simulation_end_s <= '0';
		ready_sti <= '1';
		CtrlBus_IxSL_intl.SAMPLEMODE <= '1';
	
		CtrlBus_IxSL_intl.WindowStorage <= '0';
		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000030";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000004";
		
		rst <= '0';
		wait for 1 us;
		rst <= '1';		
		wait for 1 us;
		PROCWDO(CtrlBus_IxSL_intl.WindowStorage,ClockBus_intl.SSTIN);
		
		wait for 1 us;
		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000061";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000002";
		PROCWDO(CtrlBus_IxSL_intl.WindowStorage,ClockBus_intl.SSTIN);
		wait for 50 us;
		
				
		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000040";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000001";
		PROCWDO(CtrlBus_IxSL_intl.WindowStorage,ClockBus_intl.SSTIN);
		wait for 50 us;

		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000051";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000001";
		PROCWDO(CtrlBus_IxSL_intl.WindowStorage,ClockBus_intl.SSTIN);
		wait for 50 us;
		
		CtrlBus_IxSL_intl.FSTWINDOW <= x"0000002F";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000004";
		PROCWDO(CtrlBus_IxSL_intl.WindowStorage,ClockBus_intl.SSTIN);
		wait for 50 us;
			
		wait for 1 us;
		CtrlBus_IxSL_intl.FSTWINDOW <= x"00000010";
		CtrlBus_IxSL_intl.NBRWINDOW <= x"00000004";
		PROCWDO(CtrlBus_IxSL_intl.WindowStorage,ClockBus_intl.SSTIN);
	
		
		wait for 100 us; 
		 	
    	--simulation_end_s <= '1';
    	wait;
	end process;
	  
	  
	  
end implementation;
