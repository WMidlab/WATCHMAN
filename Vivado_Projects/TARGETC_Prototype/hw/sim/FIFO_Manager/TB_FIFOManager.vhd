library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;


entity TB_FIFOManager is
end TB_FIFOManager;

architecture implementation of TB_FIFOManager is
	

	signal rst :  std_logic;
	signal clk      : std_logic;

	component FifoManager is
	generic (
		C_M_AXIS_TDATA_WIDTH	: integer	:= 32

	);
	port (
		nRST:		in	std_logic;
		CLK:		in	std_logic;
		
		-- Users to add ports here
		PRECvalid:	in	std_logic;
		FIFOresponse:	out std_logic;
		
		ready_i:		in 	std_logic;
		DO : 		in	eDO_BUS_TYPE;
		
		DataOut:	out	std_logic_vector(C_M_AXIS_TDATA_WIDTH-1 downto 0)
	);
	end component FifoManager;
	
	-- Procedures
	procedure DO_STI_PROC
	(	TestPattern : in std_logic_vector(11 downto 0);
		signal DO : out eDO_BUS_TYPE	
	) is 
	begin
		DO.CH0 <= TestPattern;
		DO.CH1 <= TestPattern;
		DO.CH2 <= TestPattern;
		DO.CH3 <= TestPattern;

		DO.CH4 <= TestPattern;
		DO.CH5 <= TestPattern;
		DO.CH6 <= TestPattern;
		DO.CH7 <= TestPattern;

		DO.CH8 <= TestPattern;
		DO.CH9 <= TestPattern;
		DO.CH10 <= TestPattern;
		DO.CH11 <= TestPattern;
		
		DO.CH12 <= TestPattern;
		DO.CH13 <= TestPattern;
		DO.CH14 <= TestPattern;
		DO.CH15 <= TestPattern;

	end DO_STI_PROC;
	
	
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';
	
	constant CLK_PERIOD : time := 10 ns;

	signal precvalid_sti : std_logic := '0';
	signal ready_sti :		std_logic := '0';
	signal DO_sti : eDO_BUS_TYPE;
	signal FIFOresponse_obs : std_logic;

begin

	
	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);

	DUT : FifoManager
	generic map(
		C_M_AXIS_TDATA_WIDTH	=> 32
	)
	port map(
		nRST	=> rst,
		CLK		=> clk,
		
		PRECvalid	=> precvalid_sti,
		FIFOresponse	=> FIFOresponse_obs,
		
		ready_i		=> ready_sti,
		DO 			=> DO_sti,
		
		DataOut		=> open
	);


	-- TB
	
	tb : process
		variable test : integer	:= 0;	
	begin
		simulation_end_s <= '0';  
		rst <= '0';
		
		
		ready_sti <= '0';
		precvalid_sti <= '0';
		
		wait for 2* CLK_PERIOD;
		rst <= '1';
		
		for I in 0 to 31 loop
			DO_STI_PROC(std_logic_vector(to_unsigned(I,12)),DO_sti);
			precvalid_sti <= '1';
			wait until FIFOresponse_obs = '1';
			precvalid_sti <= '0';
			wait for CLK_PERIOD*2;
			wait for 5 ns;
		end loop;
		-- USER DEFINE
		
		wait for 2 us;
		ready_sti <= '1';
		
		wait for 100 us;
		simulation_end_s <= '1'; 
    	wait;
	end process;
	   
end implementation;
