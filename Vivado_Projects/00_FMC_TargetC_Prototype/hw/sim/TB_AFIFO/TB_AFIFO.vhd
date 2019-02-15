library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;
use std.textio.all;

entity TB_AFIFO is
end TB_AFIFO;

architecture implementation of TB_AFIFO is
	
	component aFifoV2 is
    generic (
        DATA_WIDTH :integer := 8;
        ADDR_WIDTH :integer := 4
    );
    port (
    	rst :		in std_logic;
        -- Reading port.
        Data_out    :out std_logic_vector (DATA_WIDTH-1 downto 0);
        Empty_out   :out std_logic;
        ReadEn_in   :in  std_logic;
        RClk        :in  std_logic;
        -- Writing port.
        Data_in     :in  std_logic_vector (DATA_WIDTH-1 downto 0);
        Full_out    :out std_logic;
        WriteEn_in  :in  std_logic;
        WClk        :in  std_logic
    );
	end component;

	signal nrst :  std_logic;
	signal Rclk      : std_logic;
	signal Wclk		: std_logic;

	
	signal ReadEn_sti, WriteEn_sti, full_obs, empty_obs : std_logic;
	signal Data_obs : std_logic_vector(7 downto 0);
	signal data_in_sti : std_logic_vector(7 downto 0);
	
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';
	
	constant WCLK_PERIOD : time := 4 ns;
	constant RCLK_PERIOD : time := 10 ns;
	
	constant NBRTEST : integer := 256;

--Variable for TB
	file fd : text open WRITE_MODE is "/home/jonathan/VivadoProjects/00_WATCHMANN/TARGETC_Prototype/hw/sim/00_Reports/TB_AFIFO_REPORT.txt";

	
begin

	DUT : aFifoV2
    generic map(
        DATA_WIDTH => 8,
        ADDR_WIDTH => 4
    )
    port map(
    	rst 		=> nrst,
        -- Reading port.
        Data_out    => data_obs,
        Empty_out   => empty_obs,
        ReadEn_in   => ReadEn_sti,
        RClk        => RClk,
        -- Writing port.
        Data_in     => data_in_sti,
        Full_out    => full_obs,
        WriteEn_in  => WriteEn_sti,
        WClk        => Wclk
    );
	
	-- Clock generation
    clock_generator(Wclk,simulation_end_s, WCLK_PERIOD);
    clock_generator(Rclk,simulation_end_s, RCLK_PERIOD);
	
	-- Writing Process
	tb_WCLK : process
	begin
		nrst <= '0';
		simulation_end_s <= '0';  
		nrst <= '0';
		WriteEn_sti <= '0';
		data_in_sti <= x"00";
		wait for 1 us;
		nrst <= '1';
		wait for 1 us;
		
		for I in 0 to NBRTEST-1 loop
			
			while full_obs = '1' loop
				wait until rising_edge(WCLK);
			end loop;
			
			data_in_sti <= std_logic_vector(to_unsigned(I+1,8));
			wait until falling_edge(WClk);
			WriteEn_sti <= '1';
			wait until falling_edge(WClk);
			WriteEn_sti <= '0';	
			
		end loop;
		
		wait;
	end process;
	
	-- Reading Process
	tb_RCLK : process
		variable err : integer := 0;
		variable suc : integer := 0;
		variable L : Line;
	begin
		ReadEn_sti <= '0';
		wait for 1 us;
		
		WRITE(L,string'("AFIFO TestBench:" & CR));
		WRITELINE(fd,L);
		
		for I in 0 to NBRTEST-1 loop
			
			while empty_obs = '1' loop
				wait until rising_edge(RCLK);
			end loop;
			
			wait until falling_edge(Rclk);
			ReadEn_sti <= '1';
			wait until falling_edge(RClk);
			ReadEn_sti <= '0';
			
			wait until rising_edge(Rclk);
			if data_obs = std_logic_vector(to_unsigned(I+1,8)) then
				WRITE(L,string'("OK: Data ="& integer'image(to_integer(unsigned(Data_obs))) & " I : " & integer'image(I) & CR));
				suc := suc + 1;
			else
				WRITE(L,string'("** ERROR: Data ="& integer'image(to_integer(unsigned(Data_obs))) & " I : " & integer'image(I+1) & CR));
				err := err + 1;
			end if;
			WRITELINE(fd,L);
		end loop;
		
		WRITE(L,string'("AFIFO TestBench Simulation End" & CR));
		WRITE(L,string'("Success : " &integer'image(suc) & "/" & integer'image(NBRTEST) & " = " & integer'image(suc*100/NBRTEST) &" %" & CR));
		WRITE(L,string'("Error : " &integer'image(err) & "/" & integer'image(NBRTEST) &  " = " & integer'image(err*100/NBRTEST)&" %" & CR));
		WRITELINE(fd,L);
		wait;
	end process;
	
	
	   
end implementation;
