library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;
use work.AXI_Lite_pkg.all;
use std.textio.all;

entity TB_TARGETC_SYSTEM_AXIS is
end TB_TARGETC_SYSTEM_AXIS;

architecture implementation of TB_TARGETC_SYSTEM_AXIS is


	component TARGET_C_TopLevel_System is
		port (
		-- TARGET C Ports for control and function
		SW_nRST:	out std_logic;
	--! @name Reference Clock
	RefCLK_i1 :		in std_logic;	--! Clock for the TARGETC PLL
	RefCLK_i2 :		in std_logic;	--! Clock for the TARGETC PLL

	--! @name Ports of Axi Slave Bus Interface TC_AXI
	tc_axi_aclk		: in std_logic;
	tc_axi_aresetn	: in std_logic;
	tc_axi_awaddr	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	tc_axi_awprot	: in std_logic_vector(2 downto 0);
	tc_axi_awvalid	: in std_logic;
	tc_axi_awready	: out std_logic;
	tc_axi_wdata	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	tc_axi_wstrb	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
	tc_axi_wvalid	: in std_logic;
	tc_axi_wready	: out std_logic;
	tc_axi_bresp	: out std_logic_vector(1 downto 0);
	tc_axi_bvalid	: out std_logic;
	tc_axi_bready	: in std_logic;
	tc_axi_araddr	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	tc_axi_arprot	: in std_logic_vector(2 downto 0);
	tc_axi_arvalid	: in std_logic;
	tc_axi_arready	: out std_logic;
	tc_axi_rdata	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	tc_axi_rresp	: out std_logic_vector(1 downto 0);
	tc_axi_rvalid	: out std_logic;
	tc_axi_rready	: in std_logic;

	-- TARGET C I/Os
	SIN : 			out	STD_LOGIC;		--! SIN, Serial Input, Pin#35
	SCLK :	 		out	STD_LOGIC;		--! Pin#36
	PCLK :	 		out	STD_LOGIC;		-- Pin#37
	SHOUT:			in 	std_logic;		-- Pin#38

	HSCLK_P:		out std_logic;		-- Pin#44
	HSCLK_N:		out std_logic;		-- Pin#43

	WR_RS_S0:		out	std_logic;		--Pin
	WR_RS_S1:		out	std_logic;

	WR_CS_S0:		out	std_logic;
	WR_CS_S1:		out	std_logic;
	WR_CS_S2:		out	std_logic;
	WR_CS_S3:		out	std_logic;
	WR_CS_S4:		out	std_logic;
	WR_CS_S5:		out	std_logic;

	GCC_RESET:		out	std_logic;		-- Pin#56

	WL_CLK_P:		out std_logic;		-- Pin#58
	WL_CLK_N:		out std_logic;		-- Pin#57

	RDAD_CLK:		out	std_logic;		-- Pin#61
	RDAD_SIN:		out	std_logic;		-- Pin#62
	RDAD_DIR:		out	std_logic;		-- Pin#63

	SAMPLESEL_ANY:	out	std_logic;		-- Pin#66

	DO: 			in 	std_logic_vector(15 downto 0);	--Pin#69-70-71-72-73-74-75-76-84-85-86-87-88-89-90-91

	SS_INCR:		out	std_logic;		-- Pin#79

	DOE:			out	std_logic;		-- Pin#80

	DONE:			in	std_logic;		-- Pin#94

	SS_RESET:		out	std_logic;		-- Pin#95

	REGCLR: 		out	std_logic;		-- Pin#99

	--mDOE:			in	std_logic;		-- Pin#100

	SS_LD_SIN:		out	std_logic;		-- Pin#103
	SS_LD_DIR:		out	std_logic;		-- Pin#104

	RAMP:			out	std_logic;		-- Pin#108

	SSTIN_P:		out std_logic;		-- Pin#125
	SSTIN_N:		out std_logic;		-- Pin#126

	MONTIMING_P:	in	std_logic;		-- Pin#118
	MONTIMING_N:	in	std_logic;		-- Pin#117

	Cnt_AXIS_DATA:	in	std_logic_vector(9 downto 0);
	CNT_CLR:		out std_logic;

	-- DATA TO STREAM
	FIFOvalid:			out std_logic;
	FIFOdata:			out std_logic_vector(31 downto 0);
	StreamReady:		in	std_logic;

	-- Trigger
	TrigA :			in std_logic;
	TrigB :			in std_logic;
	TrigC :			in std_logic;
	TrigD :			in std_logic;

	-- Interrupt SIGNALS
	SSVALID_INTR:	out	std_logic;

	-- DEBUG OUTPUTs
	BB1 :	out std_logic;
	BB2 :	out std_logic;
	BB3 :	out std_logic;
	BB4 :	out std_logic;
	BB5 :	out std_logic
		);
	end component TARGET_C_TopLevel_System;

	component axistream is
		generic (
			C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
			NBRWINDOW_MAX :				integer := 8;
			FIFO_NBR_MAX :		integer := 518
		);
		port (
			-- Users to add ports here
			TestStream:			in std_logic;
			SW_nRST:			in std_logic;

			FIFOvalid:			in std_logic;
			FIFOdata:			in std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
			StreamReady:		out	std_logic;
			Cnt_AXIS_DATA:		out std_logic_Vector(9 downto 0);
			CNT_CLR:			in std_logic;
			-- User ports ends
			-- NBRWINDOW
			--NBRWINDOW:		in std_logic_vector(31 downto 0);

			-- Global ports
			M_AXIS_ACLK	: in std_logic;
			M_AXIS_ARESETN	: in std_logic;
			M_AXIS_TVALID	: out std_logic;
			M_AXIS_TDATA	: out std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
			M_AXIS_TSTRB	: out std_logic_vector((C_M_AXIS_TDATA_WIDTH/8)-1 downto 0);
			M_AXIS_TLAST	: out std_logic;
			M_AXIS_TREADY	: in std_logic
		);
	end component axistream;

	signal s00_axi_ACLK                     :  std_logic;
    signal s00_axi_ARESETN                  :  std_logic;
    signal s00_axi_AWADDR                   :  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal s00_axi_AWVALID                  :  std_logic;
    signal s00_axi_WDATA                    :  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal s00_axi_WSTRB                    :  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    signal s00_axi_WVALID                   :  std_logic;
    signal s00_axi_BREADY                   :  std_logic;
    signal s00_axi_ARADDR                   :  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal s00_axi_ARVALID                  :  std_logic;
    signal s00_axi_RREADY                   :  std_logic;
    signal s00_axi_ARREADY                  : std_logic;
    signal s00_axi_RDATA                    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal s00_axi_RRESP                    : std_logic_vector(1 downto 0);
    signal s00_axi_RVALID                   : std_logic;
    signal s00_axi_WREADY                   : std_logic;
    signal s00_axi_BRESP                    : std_logic_vector(1 downto 0);
    signal s00_axi_BVALID                   : std_logic;
    signal s00_axi_AWREADY                  : std_logic;
    signal s00_axi_AWPROT                   : std_logic_vector(2 downto 0);
    signal s00_axi_ARPROT                   : std_logic_vector(2 downto 0);

	signal m00_axis_tready					: std_logic;

    signal sendIt : std_logic := '0';
    signal readIt : std_logic := '0';

    --Signals
	signal SCLK_obs:	std_logic;
	signal SHOUT_sti:	std_logic := '0';		-- Pin#38

	signal DO_sti: 		std_logic_vector(15 downto 0);	--Pin#69-70-71-72-73-74-75-76-84-85-86-87-88-89-90-91

	signal DONE_sti:	std_logic;		-- Pin#94

	signal TestFIFO_intl: std_logic;

    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';

	constant CLK_PERIOD : time := 10 ns;

	signal busy: std_logic := '0';
	signal valid: std_logic := '0';

	type state_stm is (IDLE,OK,CLEAR);
	signal stm2 : state_stm := IDLE;
	signal stm1 : state_stm := IDLE;

	signal DO_flg : std_logic := '0';
	signal hsclk_obs : std_logic;

	signal montiming_p: std_logic;
	signal montiming_n: std_logic;

	signal FIFOData_intl: eDO_BUS_TYPE;
	signal FIFOresponse_intl : std_logic;
	signal FIFObusy_intl : std_logic;
	signal SSValid_intl:	std_logic;
	signal NBRWINDOW_sti : std_logic_vector(31 downto 0);

	signal Cnt_AXIS_DATA_intl : std_logic_vector(9 downto 0);
	signal Cnt_CLR_intl : std_logic;

	signal M_AXIS_TREADY_sti:	std_logic := '0';
	signal M_AXIS_TLAST_obs : std_logic;
	signal FIFOValid_sti:	std_logic := '0';
	signal ready_sti :		std_logic := '0';
	signal PUBusy_sti:		std_logic;
	signal TestStream_sti : std_logic;
	signal fifodata_sti : std_logic_vector(31 downto 0);

	signal ReadEn_intl :	std_logic;
	signal Time_intl :		std_logic_vector(63 downto 0);
	signal WdoAddr_intl:			 std_logic_vector(8 downto 0);
	signal triginfo_intl:			 std_logic_vector(11 downto 0);
	signal Spare_intl:				 std_logic_vector(9 downto 0);
	signal Empty_intl:	std_logic;

	signal SW_nRST_intl: std_logic;
	--Variable for TB
	file fd : text open WRITE_MODE is "/home/jonathan/VivadoProjects/00_WATCHMANN/TARGETC_Prototype/hw/sim/00_Reports/TB_Timings_REPORT.txt";
begin


	DUT : TARGET_C_TopLevel_System
	port map (
		SW_nRST => SW_nRST_intl,

		RefCLK_i1 => s00_axi_aclk,
		RefCLK_i2 => s00_axi_aclk,

		tc_axi_ACLK	=> s00_axi_aclk,
		tc_axi_ARESETN	=> s00_axi_aresetn,
		tc_axi_AWADDR	=> s00_axi_awaddr,
		tc_axi_AWPROT	=> s00_axi_awprot,
		tc_axi_AWVALID	=> s00_axi_awvalid,
		tc_axi_AWREADY	=> s00_axi_awready,
		tc_axi_WDATA	=> s00_axi_wdata,
		tc_axi_WSTRB	=> s00_axi_wstrb,
		tc_axi_WVALID	=> s00_axi_wvalid,
		tc_axi_WREADY	=> s00_axi_wready,
		tc_axi_BRESP	=> s00_axi_bresp,
		tc_axi_BVALID	=> s00_axi_bvalid,
		tc_axi_BREADY	=> s00_axi_bready,
		tc_axi_ARADDR	=> s00_axi_araddr,
		tc_axi_ARPROT	=> s00_axi_arprot,
		tc_axi_ARVALID	=> s00_axi_arvalid,
		tc_axi_ARREADY	=> s00_axi_arready,
		tc_axi_RDATA	=> s00_axi_rdata,
		tc_axi_RRESP	=> s00_axi_rresp,
		tc_axi_RVALID	=> s00_axi_rvalid,
		tc_axi_RREADY	=> s00_axi_rready,

		SIN			=> open,		-- Pin#35
		SCLK			=> SCLK_obs,	-- Pin#36
		PCLK			=> open,	-- Pin#37
		SHOUT			=> SHOUT_sti,	-- Pin#38

		HSCLK_P			=> hsclk_obs,		-- Pin#43
		HSCLK_N			=> open,		-- Pin#44

		WR_RS_S0		=> open,	-- Pin#46 to Pin#47
		WR_RS_S1		=> open,	-- Pin#46 to Pin#47
		WR_CS_S0		=> open,	-- Pin#48-49-50-51-54-55
		WR_CS_S1		=> open,	-- Pin#48-49-50-51-54-55
		WR_CS_S2		=> open,	-- Pin#48-49-50-51-54-55
		WR_CS_S3		=> open,	-- Pin#48-49-50-51-54-55
		WR_CS_S4		=> open,	-- Pin#48-49-50-51-54-55
		WR_CS_S5		=> open,	-- Pin#48-49-50-51-54-55

		GCC_RESET		=> open,	-- Pin#56

		WL_CLK_P			=> open,	-- Pin#57
		WL_CLK_N			=> open,		-- Pin#58

		RDAD_CLK			=> open,		-- Pin#61
		RDAD_SIN			=> open,		-- Pin#62
		RDAD_DIR			=> open,		-- Pin#63

		SAMPLESEL_ANY		=> open,	-- Pin#66

		DO			=> DO_sti,	--Pin#69-70-71-72-73-74-75-76-84-85-86-87-88-89-90-91

		SS_INCR			=> open,		-- Pin#79

		DOE				=> open,		-- Pin#80

		DONE			=> DONE_sti,		-- Pin#94

		SS_RESET		=> open ,	-- Pin#95

		REGCLR			=> open,		-- Pin#99

		--mDOE:			in	std_logic;		-- Pin#100

		SS_LD_SIN		=> open,		-- Pin#103
		SS_LD_DIR		=> open,		-- Pin#104

		RAMP			=> open,		-- Pin#108

		SSTIN_P			=> open,		-- Pin#125
		SSTIN_N			=> open,		-- Pin#126

		MONTIMING_P		=> montiming_p,
		MONTIMING_N		=> montiming_n,		-- Pin#117

	-- FIFO
		Cnt_AXIS_DATA	=> Cnt_AXIS_DATA_intl,
		CNT_CLR			=> Cnt_clr_intl,
		--NbrWindow => NBRWINDOW_sti,

			-- Trigger
		TrigA => '0',
		TrigB => '0',
		TrigC => '0',
		TrigD => '0',

		FIFOvalid	=> FIFOvalid_sti,
		FIFOdata	=> FIFOData_sti,
		StreamReady	=> ready_sti,
	-- DEBUG SIGNALS
		SSVALID_INTR	=> open,
	--	HSCLK			=> open,
		BB1			=> open,
		BB2		=> open,
		BB3		=> open,
		BB4		=> open,
		BB5		=> open
	);

	DUT_AXIS : axistream
		generic map(
			C_M_AXIS_TDATA_WIDTH	=> 32,
			NBRWINDOW_MAX => 8,
			FIFO_NBR_MAX => 518
		)
		port map(
			-- Users to add ports here
			TestStream	=> TestStream_sti,
			SW_nRST	=> SW_nRST_intl,

			FIFOvalid	=> FIFOvalid_sti,
			FIFOdata	=> FIFOData_sti,
			StreamReady	=> ready_sti,
			Cnt_AXIS_DATA	=> Cnt_AXIS_DATA_intl,
			CNT_CLR			=> Cnt_clr_intl,
			-- User ports ends
			-- Do not modify the ports beyond this line
			--NBRWINDOW => NBRWINDOW_sti,
			-- Global ports
			M_AXIS_ACLK		=> s00_axi_aclk,
			M_AXIS_ARESETN	=> s00_axi_aresetn,
			M_AXIS_TVALID	=> open,
			M_AXIS_TDATA	=> open,
			M_AXIS_TSTRB	=> open,
			M_AXIS_TLAST	=> M_AXIS_TLAST_obs,
			M_AXIS_TREADY	=> M_AXIS_TREADY_sti
		);


	-- Clock generation
    clock_generator(s00_axi_ACLK,simulation_end_s, CLK_PERIOD);

	process(SCLK_obs)
	begin
		if rising_edge(SCLK_obs)then
			SHOUT_sti <= not SHOUT_sti;
		end if;
	end process;
	-- Send AXI
	send : PROCESS
	 BEGIN
		s00_axi_AWVALID<='0';
		s00_axi_WVALID<='0';
		s00_axi_BREADY<='0';
		--m00_axis_tready<= '1';

		loop
		    wait until sendIt = '1';
		    wait until s00_axi_ACLK= '0';
		        s00_axi_AWVALID<='1';
		        s00_axi_WVALID<='1';
		    wait until (s00_axi_AWREADY and s00_axi_WREADY) = '1';  --Client ready to read address/data
		        s00_axi_BREADY<='1';
		    wait until s00_axi_BVALID = '1';  -- Write result valid
		        assert s00_axi_BRESP = "00" report "AXI data not written" severity failure;
		        s00_axi_AWVALID<='0';
		        s00_axi_WVALID<='0';
		        s00_axi_BREADY<='1';
		    wait until s00_axi_BVALID = '0';  -- All finished
		        s00_axi_BREADY<='0';
		end loop;
	 END PROCESS send;

	-- Read AXI
	read : PROCESS
	  BEGIN
		s00_axi_ARVALID<='0';
		s00_axi_RREADY<='0';
		 loop
		     wait until readIt = '1';
		     wait until s00_axi_ACLK= '0';
		         s00_axi_ARVALID<='1';
		         s00_axi_RREADY<='1';
		     wait until (s00_axi_RVALID and s00_axi_ARREADY) = '1';  --Client provided data
		        assert s00_axi_RRESP = "00" report "AXI data not written" severity failure;
		         s00_axi_ARVALID<='0';
		        s00_axi_RREADY<='0';
		 end loop;
	  END PROCESS read;


	 process(hsclk_obs)
	 begin
	 	if rising_edge(hsclk_obs) then
	 		if DO_flg ='0' then
	 			DO_sti <= x"0001";
	 		DO_flg <= '1';
	 		else
	 			DO_sti <= DO_sti(14 downto 0) & DO_sti(15);
	 		end if;
	 	end if;
	 end process;
	------------------------------------------------------------------------------------------
	-- TESTBENCH -----------------------------------------------------------------------------
	------------------------------------------------------------------------------------------
	process(s00_axi_ACLK)
	begin
		if rising_edge(s00_axi_ACLK)then
			case stm1 is
				when IDLE =>
					if valid = '1' then
						busy <= '1';
						stm1 <= OK;
					end if;
				when OK =>
						stm1 <= CLEAR;
				when CLEAR =>
					busy <= '0';
					--if valid = '0' then
						stm1 <= IDLE;
					--end if;
				when others =>
			end case;
		end if;
	end process;

	tb : process
		variable busy_flg : integer;
		variable locked_flg : integer;
		variable storage_flg : integer;
		variable ssvalid : integer;
		variable fifobusy_flg : integer;

		variable window : integer;
		variable nbrwindow : integer;
		variable L : Line;
		variable v_time : time := 0 ns;
	begin
		simulation_end_s <= '0';


		s00_axi_aresetn <= '0';
		wait for 1 us;
		s00_axi_aresetn <= '1';
		wait for 100 ns;

		sendIt <= '0';
		readIt <= '0';

		m00_axis_tready <= '1';

		report "REGCLR ENABLE!";
    	s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_REGCLR_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		wait for 1 us;

		wait for 100 ns;

		report "SWRESET DISABLE!";
    	s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		wait for 1 us;



		-- Wait on Busy
		locked_flg := 0;
		while (locked_flg = 0) loop
			wait for 300 ns;
			S00_AXI_ARADDR<=std_logic_vector(to_unsigned(TC_STATUS_REG*4, S00_AXI_ARADDR'length));
		    readIt<='1';                --Start AXI Read from Slave
		    wait for 1 ns; readIt<='0'; --Clear "Start Read" Flag
	   		wait until S00_AXI_RVALID = '1';
			wait until S00_AXI_RVALID = '0';

			if (s00_axi_rdata and C_LOCKED_MASK) = C_LOCKED_MASK then
				locked_flg := 1;
			else
				locked_flg := 0;
			end if;
		end loop;

    	report "DLL LOCKED!";

    	wait for 1 us;
    	report "SWRESET DISABLE!";
    	s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		wait for 1 us;
    	report "SWRESET ENABLE!";
    	s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		wait for 1 us;
    	report "SWRESET DISABLE!";
    	s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		wait for 1 us;

		M_AXIS_TREADY_sti <= '1';

		wait for 10 us;
		report "FIFO TEST!";
		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SMODE_MASK or C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		wait for 1 us;

		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SWRESET_MASK or C_TESTFIFO_MASK or  C_SMODE_MASK ;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished

		while (M_AXIS_TLAST_obs = '0') loop
			wait for 1 ns;
		end loop;
		--FIFOresponse_intl <= '1';

		while (M_AXIS_TLAST_obs = '1') loop
			wait for 1 ns;
		end loop;

		report "Last Data";
		--Check is FIFOBusy
		fifobusy_flg := 0;
		while (fifobusy_flg = 0) loop
			wait for 300 ns;
			S00_AXI_ARADDR<=std_logic_vector(to_unsigned(TC_STATUS_REG*4, S00_AXI_ARADDR'length));
			readIt<='1';                --Start AXI Read from Slave
			wait for 1 ns; readIt<='0'; --Clear "Start Read" Flag
			wait until S00_AXI_RVALID = '1';
			wait until S00_AXI_RVALID = '0';

			if (s00_axi_rdata and C_FIFOBUSY_MASK) = C_FIFOBUSY_MASK then
				fifobusy_flg := 1;
			else
				fifobusy_flg := 0;
			end if;
		end loop;
		report "FIFO Busy";

		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SMODE_MASK or C_SWRESET_MASK or C_PS_BUSY_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished
		wait for 20 us;

		WRITE(L,string'("Timings for simulation (From Order AXI to AXIS TLast):" & CR & LF));

		for J in 0 to 511 loop
			window := J;
			--for K in 1 to 16 loop
				nbrwindow := 2;

				WRITE(L,string'("WDO : " & HT & integer'image(window) &" "&  integer'image(nbrwindow)));
				report "Window :" & integer'image(window)& " "& integer'image(nbrwindow);
				v_TIME := now;

				--for I in 0 to 9 loop

				s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_FSTWINDOW_REG*4, s00_axi_AWADDR'length));
				s00_axi_WDATA<= std_logic_vector(to_unsigned(window,32));
				s00_axi_WSTRB<=b"1111";
				sendIt<='1';                --Start AXI Write to Slave
				wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
				wait until s00_axi_BVALID = '1';
				wait until s00_axi_BVALID = '0';  --AXI Write finished

				s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_NBRWINDOW_REG*4, s00_axi_AWADDR'length));
				s00_axi_WDATA<= std_logic_vector(to_unsigned(nbrwindow,32));
				s00_axi_WSTRB<=b"1111";
				sendIt<='1';                --Start AXI Write to Slave
				wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
				wait until s00_axi_BVALID = '1';
				wait until s00_axi_BVALID = '0';  --AXI Write finished


				s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
				s00_axi_WDATA<= C_WINDOW_MASK or C_SMODE_MASK or C_SWRESET_MASK;
				s00_axi_WSTRB<=b"1111";
				sendIt<='1';                --Start AXI Write to Slave
				wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
				wait until s00_axi_BVALID = '1';
				wait until s00_axi_BVALID = '0';  --AXI Write finished

				wait for 1 us;

				for N in 1 to nbrwindow loop

					s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
					s00_axi_WDATA<= C_SMODE_MASK or C_SWRESET_MASK;
					s00_axi_WSTRB<=b"1111";
					sendIt<='1';                --Start AXI Write to Slave
					wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
					wait until s00_axi_BVALID = '1';
					wait until s00_axi_BVALID = '0';  --AXI Write finished
					-- for I in 0 to 31 loop
					--
					-- 	while (ssvalid_intl = '0') loop
					-- 		wait for 1 ns;
					-- 	end loop;
					-- 	--FIFOresponse_intl <= '1';
					--
					-- 	while (ssvalid_intl = '1') loop
					-- 		wait for 1 ns;
					-- 	end loop;
					-- 	--FIFOresponse_intl <= '0';
					--
					-- end loop;
					while (M_AXIS_TLAST_obs = '0') loop
						wait for 1 ns;
					end loop;
					--FIFOresponse_intl <= '1';

					while (M_AXIS_TLAST_obs = '1') loop
						wait for 1 ns;
					end loop;

					--Check is FIFOBusy
					fifobusy_flg := 0;
					while (fifobusy_flg = 0) loop
						wait for 300 ns;
						S00_AXI_ARADDR<=std_logic_vector(to_unsigned(TC_STATUS_REG*4, S00_AXI_ARADDR'length));
					    readIt<='1';                --Start AXI Read from Slave
					    wait for 1 ns; readIt<='0'; --Clear "Start Read" Flag
				   		wait until S00_AXI_RVALID = '1';
						wait until S00_AXI_RVALID = '0';

						if (s00_axi_rdata and C_FIFOBUSY_MASK) = C_FIFOBUSY_MASK then
							fifobusy_flg := 1;
						else
							fifobusy_flg := 0;
						end if;
					end loop;
					report "FIFO Busy";

					s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
					s00_axi_WDATA<= C_SMODE_MASK or C_SWRESET_MASK or C_PS_BUSY_MASK;
					s00_axi_WSTRB<=b"1111";
					sendIt<='1';                --Start AXI Write to Slave
					wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
					wait until s00_axi_BVALID = '1';
					wait until s00_axi_BVALID = '0';  --AXI Write finished
				end loop;



				v_TIME := now - V_TIME;
				WRITE(L,string'(HT & time'image(v_Time) & CR & LF));
				WRITELINE(fd,L);

			--end loop;
		end loop;

		-- --------------------------------------

		s00_axi_AWADDR<=std_logic_vector(to_unsigned(TC_CONTROL_REG*4, s00_axi_AWADDR'length));
		s00_axi_WDATA<= C_SWRESET_MASK;
		s00_axi_WSTRB<=b"1111";
		sendIt<='1';                --Start AXI Write to Slave
		wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
		wait until s00_axi_BVALID = '1';
		wait until s00_axi_BVALID = '0';  --AXI Write finished

		wait for 500 us;

    	--simulation_end_s <= '1';
    	wait;
	end process;

	process
	BEGIN
		while (M_AXIS_TLAST_obs = '0') loop
			wait for 1 ns;
		end loop;
		--FIFOresponse_intl <= '1';

		while (M_AXIS_TLAST_obs = '1') loop
			wait for 1 ns;
		end loop;

		PUBusy_sti <= '1';
		wait for 100 us;
		PUBusy_sti <= '0';


	end process;


end implementation;
