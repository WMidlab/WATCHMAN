library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;


entity TB_FIFO is
end TB_FIFO;

architecture implementation of TB_FIFO is
	

	component module_fifo_regs_no_flags is
	  generic (
		g_WIDTH : natural := 32;
		g_DEPTH : integer := 32
		);
	  port (
		i_rst_sync : in std_logic;
		i_clk      : in std_logic;
	 
		-- FIFO Write Interface
		i_wr_en   : in  std_logic;
		i_wr_data : in  std_logic_vector(g_WIDTH-1 downto 0);
		o_full    : out std_logic;
	 
		-- FIFO Read Interface
		i_rd_en   : in  std_logic;
		o_rd_data : out std_logic_vector(g_WIDTH-1 downto 0);
		o_empty   : out std_logic
		);
	end component module_fifo_regs_no_flags;

	signal rst_sync :  std_logic;
	signal clk      : std_logic;
	 
		-- FIFO Write Interface
	signal wr_en   :   std_logic;
	signal wr_data :   std_logic_vector(32-1 downto 0);
	signal full    :  std_logic;
	 
		-- FIFO Read Interface
	signal rd_en   :   std_logic;
	signal rd_data :  std_logic_vector(32-1 downto 0);
	signal empty   :  std_logic;
	
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';
	
	constant CLK_PERIOD : time := 10 ns;
	
	
begin


	DUT :module_fifo_regs_no_flags
	generic map (
			g_WIDTH => 32,
		g_DEPTH => 32
		)
	  port map (
		i_rst_sync=> rst_sync,
		i_clk  		=> clk,
	 
		-- FIFO Write Interface
		i_wr_en   => wr_en,
		i_wr_data	=> wr_data,
		o_full    => full,
	 
		-- FIFO Read Interface
		i_rd_en   => rd_en,
		o_rd_data => rd_data,
		o_empty  => empty
		);
	
	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);
	
	------------------------------------------------------------------------------------------
	-- TESTBENCH -----------------------------------------------------------------------------
	------------------------------------------------------------------------------------------

	tb : process
		variable cnt : integer	:= 0;	
	begin
		simulation_end_s <= '0';
	
		rd_en <= '0';
		wr_en <= '0';
		rst_sync <= '1';
		wait for 1 us;
		rst_sync <= '0';		
		wait for 1 us;
		  
		
		for K in 0 to 31 loop
		wait for CLK_PERIOD;
			wr_data <= std_logic_vector(to_unsigned(cnt,wr_data'length));
			wr_en <= '1';
			cnt := cnt + 1;	
			wait for CLK_PERIOD; wr_en <= '0';
		end loop;	
		
		rd_en <= '1';
		wait for CLK_PERIOD; rd_en <= '0';	

		wr_data <= std_logic_vector(to_unsigned(cnt,wr_data'length));
		wr_en <= '1';
		cnt := cnt + 1;	
		wait for CLK_PERIOD; wr_en <= '0';
			  
		wait for 100 us;  	
    	simulation_end_s <= '1';
    	wait;
	end process;
	  
	  
	  
end implementation;
