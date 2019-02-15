library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.WindowCPU_pkg.all;
use work.TARGETC_pkg.all;

entity SingleTrigger is
	generic(
		LONG_TRIGGER : integer := 32
	);
	Port (
	nrst : 			in	STD_Logic;

	clk:		in std_logic;

	trigger : 		in std_logic;
	TrigInfo_OUT:	out t_triggerinformationSingle

	);

end SingleTrigger;

architecture Behavioral of SingleTrigger is

	component Counter_En is
		generic(
			NBITS : integer := 8
		);
		port(
			CLK : in  std_logic;
			RST : in  std_logic;
			EN : in std_logic;
			Q : out std_logic_vector(NBITS-1 downto 0)
		);

	end component Counter_En;

	type t_trigger_state is (
		TRIG_IDLE,
		TRIG_ENABLED
	);
	signal trigger_stm : t_trigger_state;

	signal prevtrigger : std_logic;

	signal TrigInfo_intl : t_triggerinformationSingle;

	signal trigcnt : std_logic_vector(7 downto 0);
	signal toolong, cnt_flg : std_logic;

begin

	Cnt : Counter_En
	generic map(
		NBITS => 8
	)
	port map(
		CLK => clk,
		RST	=> nRST,
		EN 	=> trigger,
		Q 	=> trigcnt
	);

	-- Minimal State Machine For Windows select
	process(clk, nRST)	-- Every 64 ns
	begin
		if nRST = '0' then
			TrigInfo_OUT.long <= '0';
			TrigInfo_OUT.last <= '0';
			TrigInfo_OUT.trig <= '0';
			prevTrigger <= '0';

			toolong <= '0';
		else
			if rising_edge(clk) then
				prevTrigger <= trigger;
				if toolong = '0' then

					if prevTrigger = '0' and trigger = '0' then
						TrigInfo_OUT.trig <= '0';
					else
						TrigInfo_OUT.trig <= '1';
					end if;

					if prevTrigger = '1' and trigger = '0' then
						TrigInfo_OUT.last <= '1';
					else
						TrigInfo_OUT.last <= '0';
					end if;

					if (cnt_flg = '1') then
						toolong <= '1';
						TrigInfo_OUT.trig <= '1';
						TrigInfo_OUT.last <= '1';
						TrigInfo_OUT.long <= '1';
					else
						toolong <= '0';
						TrigInfo_OUT.long <= '0';
					end if;
				else
					if prevTrigger = '0' and trigger = '0' then
						toolong <= '0';
					else
						toolong <= '1';
					end if;

					TrigInfo_OUT.trig <= '0';
					TrigInfo_OUT.last <= '0';
					TrigInfo_OUT.long <= '0';
				end if;
			end if;
		end if;
	end process;

	cnt_flg <= '1' when (trigcnt >= std_logic_vector(to_unsigned(LONG_TRIGGER,8))) else '0';
end Behavioral;
