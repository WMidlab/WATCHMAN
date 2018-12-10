library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use work.TARGETC_pkg.all;

entity TB_aFIFO is
end TB_aFIFO;

architecture implementation of TB_aFIFO is
	
	component aFifo is
    generic (
        DATA_WIDTH :integer := 8;
        ADDR_WIDTH :integer := 4
    );
    port (
    	rst : in std_logic;
        -- Reading port.
        Data_out    :out std_logic_vector (DATA_WIDTH-1 downto 0);
        Empty_out   :out std_logic;
        ReadEn_in   :in  std_logic;
        RClk        :in  std_logic;
        -- Writing port.
        Data_in     :in  std_logic_vector (DATA_WIDTH-1 downto 0);
        Full_out    :out std_logic;
        WriteEn_in  :in  std_logic;
        WClk        :in  std_logic;
	 
        Clear_in:in  std_logic
    );
	end component;
	
	signal rst :  std_logic;
	signal clk      : std_logic;
	 
	
	signal ClockBus_intl   :  T_ClockBus;
	
	signal CtrlBus_IxSL_intl : T_CtrlBus_OxMS_Intl;
	
	signal rd_en: std_logic;
	signal wr_en: std_logic;
	signal data_sti: std_logic_vector(11 downto 0);
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';
	
	constant CLK_PERIOD : time := 10 ns;
	constant SSTIN_PERIOD : time := 64 ns;
	
begin

	DUT : 	aFifo
    generic map(
        DATA_WIDTH => 12,
        ADDR_WIDTH => 4
    )
    port map(
    	rst			=> rst,
        -- Reading port.
        Data_out    => open,
        Empty_out   => open,
        ReadEn_in   => rd_en,
        RClk        => clk,
        -- Writing port.
        Data_in     => data_sti,
        Full_out    => open,
        WriteEn_in  => wr_en,
        WClk        => ClockBus_intl.SSTIN,
	 
        Clear_in	=> rst
    );
	
	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);
	clock_generator(ClockBus_intl.SSTIN,simulation_end_s, SSTIN_PERIOD);
	------------------------------------------------------------------------------------------
	-- TESTBENCH -----------------------------------------------------------------------------
	------------------------------------------------------------------------------------------

	tb : process
		
	begin
		simulation_end_s <= '0';
	
		wr_en <= '0';
		rd_en <= '0';
		data_sti <= x"001";
		
		rst <= '0';
		wait for 1 us;
		rst <= '1';
		
		wait until rising_edge(ClockBus_intl.SSTIN);		wait for SSTIN_PERIOD;
		wr_en <= '1';
		wait for SSTIN_PERIOD;
		data_sti <= x"002";
		wait for SSTIN_PERIOD;
		data_sti <= x"003";
		wait for SSTIN_PERIOD;
		data_sti <= x"004";
		wait for SSTIN_PERIOD;
		data_sti <= x"005";
		wait for SSTIN_PERIOD;
		data_sti <= x"006";
		wait for SSTIN_PERIOD;
		data_sti <= x"007";
		wait for SSTIN_PERIOD;
		data_sti <= x"008";
		wait for SSTIN_PERIOD;
		data_sti <= x"009";
		wait for SSTIN_PERIOD;
		data_sti <= x"010";
		wait for SSTIN_PERIOD;
		data_sti <= x"011";
		wait for SSTIN_PERIOD;
		data_sti <= x"012";
		wait for SSTIN_PERIOD;
		data_sti <= x"013";
		wait for SSTIN_PERIOD;
		data_sti <= x"014";
		wait for SSTIN_PERIOD;
		data_sti <= x"015";
		wait for SSTIN_PERIOD;
		data_sti <= x"016";
		wait for SSTIN_PERIOD;
		wr_en <= '0';
		
		wait for 1 us;
		data_sti <= x"022";
		wait until rising_edge(ClockBus_intl.SSTIN);		wait for SSTIN_PERIOD;
		wr_en <= '1';
		wait for SSTIN_PERIOD;
		wr_en <= '0';
		
		wait for 1 us;
		wait until rising_edge(clk);		wait for CLK_PERIOD;
		rd_en <= '1';
		wait for 4*CLK_PERIOD;
		rd_en <= '0';
		
	
		wait for 1 us;
		data_sti <= x"017";
		wait until rising_edge(ClockBus_intl.SSTIN);		wait for SSTIN_PERIOD;
		wr_en <= '1';
		wait for SSTIN_PERIOD;
		data_sti <= x"018";
		wait for SSTIN_PERIOD;
		data_sti <= x"019";
		wait for SSTIN_PERIOD;
		data_sti <= x"020";
		wait for SSTIN_PERIOD;
		wr_en <= '0';
		
		wait for 1 us;
		wait until rising_edge(clk);		wait for CLK_PERIOD;
		rd_en <= '1';
		wait for 16*CLK_PERIOD;
		rd_en <= '0';
		wait for 1 us;
		
		wait until rising_edge(ClockBus_intl.SSTIN);		wait for SSTIN_PERIOD;
		wait for SSTIN_PERIOD;
		data_sti <= x"010";
		wr_en <= '1';
		wait for SSTIN_PERIOD;
		data_sti <= x"020";
		wait for SSTIN_PERIOD;
		data_sti <= x"030";
		wait for SSTIN_PERIOD;
		data_sti <= x"040";
		wait for SSTIN_PERIOD;
		data_sti <= x"050";
		wait for SSTIN_PERIOD;
		data_sti <= x"060";
		wait for SSTIN_PERIOD;
		data_sti <= x"070";
		wait for SSTIN_PERIOD;
		data_sti <= x"080";
		wait for SSTIN_PERIOD;
		data_sti <= x"090";
		wait for SSTIN_PERIOD;
		data_sti <= x"100";
		wait for SSTIN_PERIOD;
		data_sti <= x"110";
		wait for SSTIN_PERIOD;
		data_sti <= x"120";
		wait for SSTIN_PERIOD;
		data_sti <= x"130";
		wait for SSTIN_PERIOD;
		data_sti <= x"140";
		wait for SSTIN_PERIOD;
		data_sti <= x"150";
		wait for SSTIN_PERIOD;
		data_sti <= x"160";
		wait for SSTIN_PERIOD;
		wr_en <= '0';
		
		wait for 100 us;  	
    	--simulation_end_s <= '1';
    	wait;
	end process;
	  
	  
	  
end implementation;
