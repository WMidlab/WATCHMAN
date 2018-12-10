library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.simulation_pkg.all;


entity TB_GRAYCODE is
end TB_GRAYCODE;

architecture implementation of TB_GRAYCODE is
	

	signal rst_sync :  std_logic;
	signal clk      : std_logic;

	component RisingEdge_DFlipFlop is 
	port(
		Q : out std_logic;    
		Clk :in std_logic;   
		D :in  std_logic;
		rst : in std_logic    
	);
	end component RisingEdge_DFlipFlop;
	
    -- Signals for simulation
    signal simulation_end_s : std_logic := '0';
	
	constant CLK_PERIOD : time := 10 ns;

	
	
	signal cnt:	std_logic_vector(10 downto 0) := (others => '0');
	signal graycnt : std_logic_vector(10 downto 0) := (others => '0');
	
	signal graydecode : std_logic_vector(11 downto 0) := (others => '0');
	signal graydecode_N : std_logic_vector(11 downto 0) := (others => '0');
	signal grayintl : std_logic_vector(11 downto 0) := (others => '0');

--	signal graydecode : std_logic_vector(10 downto 0) := (others => '0');
--	signal grayintl : std_logic_vector(10 downto 0) := (others => '0');

	signal rst : std_logic := '1';
	signal Dinter : std_logic_vector(10 downto 0);
	signal Q:	std_logic_vector(10 downto 0);
	
	signal arm:	std_logic_vector(10 downto 1);
	
begin

	
	-- Clock generation
    clock_generator(clk,simulation_end_s, CLK_PERIOD);

	DFF_D0 : RisingEdge_DFlipFlop
	port map(
		Q	=> Q(0),
		D	=> Dinter(0),
		CLK => clk,
		rst => rst
	);
	Dinter(0) <= not Q(0);
	
	GEN: for I in 1 to 10 generate
		DFF_DX : RisingEdge_DFlipFlop
		port map(
			Q	=> Q(I),
			D	=> Dinter(I),
			CLK => clk,
			rst => rst
		);
		Dinter(I) <= Q(I) xor arm(I);
	end generate GEN;

	arm(1) <= q(0);
	arm(2) <= q(0) and q(1);
	arm(3) <= q(0) and q(1) and q(2);
	arm(4) <= q(0) and q(1)  and q(2) and q(3);
	
	arm(5) <= q(0) and q(1)  and q(2) and q(3) and q(4);
	arm(6) <= q(0) and q(1)  and q(2) and q(3) and q(4) and q(5);
	arm(7) <= q(0) and q(1)  and q(2) and q(3) and q(4) and q(5) and q(6);
	arm(8) <= q(0) and q(1)  and q(2) and q(3) and q(4) and q(5) and q(6) and q(7);
	
	arm(9) <= q(0) and q(1)  and q(2) and q(3) and q(4) and q(5) and q(6) and q(7) and q(8);
	arm(10) <= q(0) and q(1)  and q(2) and q(3) and q(4) and q(5) and q(6) and q(7) and q(8) and q(9);
	

	------------------------------------------------------------------------------------------
	-- TESTBENCH -----------------------------------------------------------------------------
	------------------------------------------------------------------------------------------

	graycnt(0) <= cnt(0) xor cnt(1);
	graycnt(1) <= cnt(1) xor cnt(2);
	graycnt(2) <= cnt(2) xor cnt(3);
	graycnt(3) <= cnt(3) xor cnt(4);
	
	graycnt(4) <= cnt(4) xor cnt(5);
	graycnt(5) <= cnt(5) xor cnt(6);
	graycnt(6) <= cnt(6) xor cnt(7);
	graycnt(7) <= cnt(7) xor cnt(8);
	
	graycnt(8) <= cnt(8) xor cnt(9);
	graycnt(9) <= cnt(9) xor cnt(10);
	graycnt(10) <= cnt(10);

--	grayintl(10) <= graycnt(10);
--	grayintl(9) <= graycnt(9);
--	grayintl(8) <= graycnt(8);
--	grayintl(7) <= graycnt(7);
	
--	grayintl(6) <= graycnt(6);
--	grayintl(5) <= graycnt(5);
--	grayintl(4) <= graycnt(4);
--	grayintl(3) <= graycnt(3);
	
--	grayintl(2) <= graycnt(2);
--	grayintl(1) <= graycnt(1);
--	grayintl(0) <= graycnt(0);
	
	grayintl(11) <= graycnt(10);
	grayintl(10) <= graycnt(9);
	grayintl(9) <= graycnt(8);
	grayintl(8) <= graycnt(7);
	
	grayintl(7) <= graycnt(6);
	grayintl(6) <= graycnt(5);
	grayintl(5) <= graycnt(4);
	grayintl(4) <= graycnt(3);
	
	grayintl(3) <= graycnt(2);
	grayintl(2) <= graycnt(1);
	grayintl(1) <= graycnt(0);
	grayintl(0) <= clk;

	
	graydecode_N(11)	<= not grayintl(11);
	graydecode_N(10) <= (not grayintl(10)) xor graydecode_N(11);

--	graydecode_N(10) <= (not grayintl(10));

	graydecode_N(9) <= (not grayintl(9)) xor graydecode_N(10);
	graydecode_N(8) <= (not grayintl(8)) xor graydecode_N(9);
	
	graydecode_N(7) <= (not grayintl(7)) xor graydecode_N(8);
	graydecode_N(6) <= (not grayintl(6)) xor graydecode_N(7);
	graydecode_N(5) <= (not grayintl(5)) xor graydecode_N(6);
	graydecode_N(4) <= (not grayintl(4)) xor graydecode_N(5);
	
	graydecode_N(3) <= (not grayintl(3)) xor graydecode_N(4);
	graydecode_N(2) <= (not grayintl(2)) xor graydecode_N(3);
	graydecode_N(1) <= (not grayintl(1)) xor graydecode_N(2);
	graydecode_N(0) <= (not grayintl(0));
	
	graydecode(11)	<= grayintl(11);
	graydecode(10) <= (grayintl(10)) xor graydecode(11);

--	graydecode(10) <= (not grayintl(10));

	graydecode(9) <= (grayintl(9)) xor graydecode(10);
	graydecode(8) <= (grayintl(8)) xor graydecode(9);
	
	graydecode(7) <= (grayintl(7)) xor graydecode(8);
	graydecode(6) <= (grayintl(6)) xor graydecode(7);
	graydecode(5) <= (grayintl(5)) xor graydecode(6);
	graydecode(4) <= (grayintl(4)) xor graydecode(5);
	
	graydecode(3) <= (grayintl(3)) xor graydecode(4);
	graydecode(2) <= (grayintl(2)) xor graydecode(3);
	graydecode(1) <= (grayintl(1)) xor graydecode(2);
	graydecode(0) <= (grayintl(0));
	
	tb : process
		variable test : integer	:= 0;	
	begin
		rst <= '1';
		wait for 2* CLK_PERIOD;
		rst <= '0';
		wait for 100 * CLK_PERIOD;
		
		wait for 100 us;
		simulation_end_s <= '0';  
		
		for K in 0 to 2047 loop
		wait for CLK_PERIOD;
			test := test + 1;
			cnt <= std_logic_vector(to_unsigned(test,cnt'length));
			
		end loop;	
		wait for  us;
		simulation_end_s <= '1'; 
    	wait;
	end process;
	   
end implementation;
