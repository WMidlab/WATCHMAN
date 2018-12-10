library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;


entity TB_FIFO_AXIS is
end TB_FIFO_AXIS;

architecture implementation of TB_FIFO_AXIS is
	

	signal rst :  std_logic;
	signal clk      : std_logic;

	component FifoManager is
	generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
		NBRWINDOW_MAX :				integer := 8
	);
	port (
		nRST:		in	std_logic;
		CLK:		in	std_logic;
		
		--DATA INCOMING
		PRECvalid:	in	std_logic;
		FIFOresponse:	out std_logic;
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
		
		-- NBRWINDOW
		NBRWINDOW:		in std_logic_vector(31 downto 0);
		
		-- DATA TO STREAM
		FIFOvalid:	out	std_logic;
		ready_i:		in 	std_logic;
		DataOut:	out	std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0)
	);
	end component FifoManager;
	
	component axistream is
		generic (
			C_M_AXIS_TDATA_WIDTH	: integer	:= 32;
			NBRWINDOW_MAX :				integer := 8
		);
		port (
			-- Users to add ports here
			TestStream:			in std_logic;
		
			FIFOvalid:			in std_logic;
			FIFOdata:			in std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
			StreamReady:		out	std_logic;
			-- User ports ends
			-- NBRWINDOW
			NBRWINDOW:		in std_logic_vector(31 downto 0);

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
	-- Procedures
	procedure DO_STI_PROC
	(	TestPattern : in std_logic_vector(11 downto 0);
		signal DO : out eDO_BUS_TYPE	
	) is 
	begin
		DO.CH0 <= std_logic_vector(unsigned(TestPattern) + 32*0);
		DO.CH1 <= std_logic_vector(unsigned(TestPattern) + 32*1);
		DO.CH2 <= std_logic_vector(unsigned(TestPattern) + 32*2);
		DO.CH3 <= std_logic_vector(unsigned(TestPattern) + 32*3);

		DO.CH4 <= std_logic_vector(unsigned(TestPattern) + 32*4);
		DO.CH5 <= std_logic_vector(unsigned(TestPattern) + 32*5);
		DO.CH6 <= std_logic_vector(unsigned(TestPattern) + 32*6);
		DO.CH7 <= std_logic_vector(unsigned(TestPattern) + 32*7);

		DO.CH8 <= std_logic_vector(unsigned(TestPattern) + 32*8);
		DO.CH9 <= std_logic_vector(unsigned(TestPattern) + 32*9);
		DO.CH10 <= std_logic_vector(unsigned(TestPattern) + 32*10);
		DO.CH11 <= std_logic_vector(unsigned(TestPattern) + 32*11);
		
		DO.CH12 <= std_logic_vector(unsigned(TestPattern) + 32*12);
		DO.CH13 <= std_logic_vector(unsigned(TestPattern) + 32*13);
		DO.CH14 <= std_logic_vector(unsigned(TestPattern) + 32*14);
		DO.CH15 <= std_logic_vector(unsigned(TestPattern) + 32*15);

	end DO_STI_PROC;
	
	
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';
	
	constant CLK_PERIOD : time := 10 ns;

	signal precvalid_sti : std_logic := '0';
	signal ready_sti :		std_logic := '0';
	signal DO_sti : eDO_BUS_TYPE;
	signal FIFOresponse_obs : std_logic;
	signal FIFOData_sti:	std_logic_vector(31 downto 0) := (others => '0');
	
	signal TestStream_sti: 	std_logic := '0';
	signal M_AXIS_TREADY_sti:	std_logic := '0';
	signal FIFOValid_sti:	std_logic := '0';
	signal NBRWINDOW_sti :	std_logic_vector(31 downto 0) := x"00000004";
begin

	DUT_AXIS : axistream
		generic map(
			C_M_AXIS_TDATA_WIDTH	=> 32,
			NBRWINDOW_MAX => 8
		)
		port map(
			-- Users to add ports here
			TestStream	=> TestStream_sti,
		
			FIFOvalid	=> FIFOvalid_sti,
			FIFOdata	=> FIFOData_sti,
			StreamReady	=> ready_sti,
			-- User ports ends
			-- Do not modify the ports beyond this line
			NBRWINDOW => NBRWINDOW_sti,
			-- Global ports
			M_AXIS_ACLK		=> clk,
			M_AXIS_ARESETN	=> rst,
			M_AXIS_TVALID	=> open,
			M_AXIS_TDATA	=> open,
			M_AXIS_TSTRB	=> open,
			M_AXIS_TLAST	=> open,
			M_AXIS_TREADY	=> M_AXIS_TREADY_sti
		);
	
	
	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);

	DUT_FIFO : FifoManager
	generic map(
		C_M_AXIS_TDATA_WIDTH	=> 32,
		NBRWINDOW_MAX => 8
	)
	port map(
		nRST	=> rst,
		CLK		=> clk,
		
		PRECvalid	=> precvalid_sti,
		FIFOresponse	=> FIFOresponse_obs,
		
		
		CH0 			=> DO_sti.CH0,
		CH1 			=> DO_sti.CH1,
		CH2 			=> DO_sti.CH2,
		CH3 			=> DO_sti.CH3,
		
		CH4 			=> DO_sti.CH4,
		CH5 			=> DO_sti.CH5,
		CH6 			=> DO_sti.CH6,
		CH7 			=> DO_sti.CH7,
		
		CH8 			=> DO_sti.CH8,
		CH9 			=> DO_sti.CH9,
		CH10 			=> DO_sti.CH10,
		CH11 			=> DO_sti.CH11,
		
		CH12 			=> DO_sti.CH12,
		CH13 			=> DO_sti.CH13,
		CH14 			=> DO_sti.CH14,
		CH15 			=> DO_sti.CH15,
		
		NBRWINDOW => NBRWINDOW_sti,
		
		FIFOvalid	=> FIFOvalid_sti,
		ready_i		=> ready_sti,
		DataOut		=> FIFOData_sti
	);


	-- TB
	
	tb : process
		variable test : integer	:= 0;	
	begin
		simulation_end_s <= '0';  
		rst <= '0';
		M_AXIS_TREADY_sti <= '0';
		
		precvalid_sti <= '0';
		
		wait for 2* CLK_PERIOD;
		
		rst <= '1';
		
		for K in 0 to 3 loop
			for I in 0 to 31 loop
				precvalid_sti <= '1';
				DO_STI_PROC(std_logic_vector(to_unsigned(I+32*K,12)),DO_sti);
				wait until FIFOresponse_obs = '1';
				precvalid_sti <= '0';
				wait for CLK_PERIOD*2;
				M_AXIS_TREADY_sti <= '1';
				wait for 5 ns;
			end loop;
			-- USER DEFINE
		
			wait for 1 us;
			M_AXIS_TREADY_sti <= '1';
			wait for 10*CLK_PERIOD;
			M_AXIS_TREADY_sti <= '0';
			wait for 10*CLK_PERIOD;
			M_AXIS_TREADY_sti <= '1';
			wait for 10*CLK_PERIOD;
			M_AXIS_TREADY_sti <= '0';
			wait for 1*CLK_PERIOD;
			M_AXIS_TREADY_sti <= '1';
			wait for 10*CLK_PERIOD;
		
			wait for 10 us;
		end loop;
		
		wait for 10 us;
		NBRWINDOW_sti <= x"00000001";
		TestStream_sti <= '1';
			wait for CLK_PERIOD;
		TestStream_sti <= '0';	
		wait for 5 ns;
		
		wait for 10 us;
		wait for 1 us;
		-- 2nd transfert
		for I in 0 to 31 loop
			precvalid_sti <= '1';
			DO_STI_PROC(std_logic_vector(to_unsigned(I+1000,12)),DO_sti);
			wait until FIFOresponse_obs = '1';
			precvalid_sti <= '0';
			wait for CLK_PERIOD*2;
			--M_AXIS_TREADY_sti <= '1';
			wait for 5 ns;
			
		end loop;
		wait for 1 us;
		
		wait until rising_edge(clk);
		M_AXIS_TREADY_sti <= '1';
		wait for 10*CLK_PERIOD;
		M_AXIS_TREADY_sti <= '0';
		wait for 10*CLK_PERIOD;
		M_AXIS_TREADY_sti <= '1';
		wait for 10*CLK_PERIOD;
		M_AXIS_TREADY_sti <= '0';
		wait for 1*CLK_PERIOD;
		M_AXIS_TREADY_sti <= '1';
		wait for 10*CLK_PERIOD;
		
		wait for 100 us;
		simulation_end_s <= '1'; 
    	wait;
	end process;
	   
end implementation;
