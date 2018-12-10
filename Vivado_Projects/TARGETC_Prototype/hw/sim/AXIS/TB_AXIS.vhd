library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;


entity TB_AXIS is
end TB_AXIS;

architecture implementation of TB_AXIS is
	


	component axistream is
		generic (
			C_M_AXIS_TDATA_WIDTH	: integer	:= 32
		);
		port (
			-- Users to add ports here
			TestStream:			in std_logic;
		
			FIFOvalid:			in std_logic;
			FIFOdata:			in std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0);
			StreamReady:		out	std_logic;
			-- User ports ends
			-- Do not modify the ports beyond this line

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

	signal rst :  std_logic;
	signal clk      : std_logic;

	
	-- Signals DUT
	signal TestStream_sti: 	std_logic := '0';
	signal FIFOValid_sti:	std_logic := '0';
	signal FIFOData_sti:	std_logic_vector(31 downto 0) := (others => '0');
	
	signal M_AXIS_TREADY_sti:	std_logic := '0';
	
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';
	
	constant CLK_PERIOD : time := 10 ns;

	
begin

	DUT : axistream
		generic map(
			C_M_AXIS_TDATA_WIDTH	=> 32
		)
		port map(
			-- Users to add ports here
			TestStream	=> TestStream_sti,
		
			FIFOvalid	=> FIFOvalid_sti,
			FIFOdata	=> FIFOData_sti,
			StreamReady	=> open,
			-- User ports ends
			-- Do not modify the ports beyond this line

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

	process(clk)
	begin
		if rising_Edge(clk) then
		FIFOData_sti <= std_logic_vector(unsigned(FIFOData_sti) + 1);
		end if;
	end process;
	
	tb : process
		variable test : integer	:= 0;	
	begin
		simulation_end_s <= '0';  
		rst <= '0';
		wait for 2* CLK_PERIOD;
		rst <= '1';
		wait for 10*CLK_PERIOD;
		
		-- Test Data transfert
		TestStream_sti <= '1';
		wait for CLK_PERIOD;
		TestStream_sti <= '0';
		M_AXIS_TREADY_sti <= '1';
		wait for 10*CLK_PERIOD;
		M_AXIS_TREADY_sti <= '0';
		wait for 2*CLK_PERIOD;
		M_AXIS_TREADY_sti <= '1';
		wait for 10 us;
		
		FIFOvalid_sti <= '1';
		wait for CLK_PERIOD;
		FIFOvalid_sti <= '0';
		M_AXIS_TREADY_sti <= '1';
		wait for 10*CLK_PERIOD;
		M_AXIS_TREADY_sti <= '0';
		wait for 2*CLK_PERIOD;
		M_AXIS_TREADY_sti <= '1';
		wait for 10 us;		
		-- USER DEFINE
		
		
		
		wait for 1 us;
		simulation_end_s <= '1'; 
    	wait;
	end process;
	   
end implementation;
