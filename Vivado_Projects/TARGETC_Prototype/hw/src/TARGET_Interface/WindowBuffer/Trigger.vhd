
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity Trigger is
	generic(
		MIN_LE_TIME : integer := 2;	-- All times are x4 ns so 2 is equal to 8ns = 8 samples before rise of trigger
		MIN_TE_TIME : integer := 1; -- 4 ns after falling of trigger
		MAX_LONGPULSE : integer := 16		-- If pulse is longer than 64 ns
	);
	Port (
	nrst : 			in	std_Logic;

--	SSTIN:			in std_logic;
	CLK:			in 	std_logic;

	trigger :		in 	std_logic;
	samplecnt:		in 	std_logic_vector(3 downto 0);

	longpulse:		out std_logic;

	prevWdo :		out std_logic;
	currWdo : 		out std_logic;
	nextWdo :		out std_logic
	);

end Trigger;

architecture Behavioral of Trigger is


	component LEComparator is
		generic(
			MIN_LE_TIME : integer := 2	-- All times are x4 ns so 2 is equal to 8ns = 8 samples before rise of trigger
		);
		Port (
			nrst : 			in	std_Logic;
	
			trigger :		in 	std_logic;
			samplecnt:		in 	std_logic_vector(3 downto 0);
	
			state :			out	std_logic_vector(3 downto 0)
		);
	end component LEComparator;
	
		component TEComparator is
		generic(
			MIN_TE_TIME : integer := 2	-- All times are x4 ns so 2 is equal to 8ns = 8 samples before rise of trigger
		);
		Port (
			nrst : 			in	std_Logic;
	
			trigger :		in 	std_logic;
			samplecnt:		in 	std_logic_vector(3 downto 0);
	
			state :			out	std_logic_vector(3 downto 0)
		);
	end component TEComparator;
	
	signal NewWindow : std_logic;

	signal CntWdo256 : std_logic_vector(3 downto 0);
	signal CntWdo512 : std_logic_vector(3 downto 0);
	
	signal LEstate : std_logic_vector(3 downto 0);
	signal TEstate : std_logic_vector(3 downto 0);
	
	signal wr1_trig, wr2_trig : std_logic;
	signal prev_wr1_trig, prev_wr2_trig : std_logic;
	
	signal trigger_reg : std_logic_vector(1 downto 0);
	signal PulseLengthCnt : std_logic_vector(7 downto 0);
	
	signal valid : std_logic;
begin


	LE_Compare_inst : LEComparator
		generic map(
			MIN_LE_TIME => MIN_LE_TIME
		)
		Port map(
		nrst	=> nrst,

		trigger => trigger,
		samplecnt => samplecnt,

		state => LEstate
		);

	TE_Compare_inst : TEComparator
		generic map(
			MIN_TE_TIME => MIN_TE_TIME
		)
		Port map(
		nrst	=> nrst,

		trigger => trigger,
		samplecnt => samplecnt,

		state => TEstate
		);
		
	CntWdo256 <= samplecnt(3 downto 0);
	CntWdo512 <= '0' & samplecnt(2 downto 0);
	
	process(nRST,CLK)
	begin
		if nrst = '0' then
			prevWdo <= '0';
			nextWdo <= '0';
			trigger_reg <= (others => '0');
		else
			
			
			if rising_edge(clk) then
							
				trigger_reg <= trigger_reg(0) & trigger;
				
				nextWdo <= '0';
				currWdo <= '0';
				prevWdo <= '0';
								
				case trigger_reg is
					when "00" =>
						if Trigger = '1' then
							valid <= '1';
							case LEstate is
								when "0001" =>
									currWdo <= '0';
									prevWdo <= '1';
									wr1_trig <= '1';
									wr2_trig <= '0';
								when "0010" =>
									currWdo <= '1';
									prevWdo <= '0';
									wr1_trig <= '0';
									wr2_trig <= '1';
								when "0100" =>
									currWdo <= '1';
									prevWdo <= '0';
									wr1_trig <= '0';
									wr2_trig <= '1';
								when "1001" =>
									currWdo <= '1';
									prevWdo <= '0';
									wr1_trig <= '0';
									wr2_trig <= '0';
								when "1010" =>
									currWdo <= '1';
									prevWdo <= '0';
									wr1_trig <= '1';
									wr2_trig <= '0';
								when "1100" =>
									currWdo <= '1';
									prevWdo <= '0';
									wr1_trig <= '1';
									wr2_trig <= '0';
								when others =>
							end case;
						end if;
					when "01" => -- Trigger Rising Edge Delayed
						if Trigger = '0' then
							
							case TEstate is
								when "0001" =>
									currWdo <= '1';
									nextWdo <= '0';
									wr1_trig <= '0';
									wr2_trig <= '1'; 
								when "0010" =>
									currWdo <= '1';
									nextWdo <= '0';
									wr1_trig <= '0';
									wr2_trig <= '1';  
								when "0100" =>
									currWdo <= '1';
									nextWdo <= '0';
									wr1_trig <= '0';
									wr2_trig <= '0'; 
								when "1001" =>
									currWdo <= '1';
									nextWdo <= '0';
									wr1_trig <= '1';
									wr2_trig <= '0';
								when "1010" =>
									currWdo <= '1';
									nextWdo <= '0';
									wr1_trig <= '1';
									wr2_trig <= '0';
								when "1100" =>
									currWdo <= '0';
									nextWdo <= '1';
									wr1_trig <= '0';
									wr2_trig <= '1'; 
								when others =>
							end case;
						end if;
						
					when "11" =>				
						
					when "10" =>
						valid <= '0';
					when others =>
				end case;
				
--			else
				--trigger_reg <= trigger_reg(0) & trigger;
						
--				if (trigger = '1') and (trigger_reg = "10" or trigger_reg = "00") then
					-- Leading Edge Detection
--					if to_integer(unsigned(samplecnt)) <  MIN_LE_TIME then
--						prevWdo <= '1';
--					else
--						prevWdo <= '0';
--					end if;
--				else
--					prevWdo <= '0';
--				end if;
			
--				if (trigger = '0') and (trigger_reg = "01" or trigger_reg = "11") then
				-- Trailing Edge Detection
--					if to_integer(unsigned(samplecnt)) >  (15 - MIN_TE_TIME) then
--						nextWdo <= '1';
--					else
--						nextWdo <= '0';
--					end if;
--				else
--					nextWdo <= '0';
--				end if;
			end if;
			

		end if;
	end process;
	
	-- Counter
	process (CLK,trigger) begin
		if (trigger = '0') then
			PulseLengthCnt <= x"01";
		elsif (rising_edge(CLK)) then
			if trigger = '1' then
				PulseLengthCnt <= std_logic_vector(unsigned(PulseLengthCnt) + 1);
			end if;
		end if;
	end process;

end Behavioral;
