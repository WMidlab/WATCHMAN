
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;

entity TARGETC_SERIAL_DATA_OUT is
	Port ( 
	CLK : 			in  STD_LOGIC;
	
	-- Control/Command inputs
	start :			in std_logic;
	--eTPG :			in std_logic;
	
	eDO_BUS :		out eDO_BUS_TYPE;
	
	-- Data Readout
	eDO : 			in std_logic_vector(15 downto 0);
	eHSclk :		out std_logic;
	--eSmplSl_Any:	out std_logic;
	eSS_Incr:		out std_logic;
	eSS_Reset:		out std_logic);
	
end TARGETC_SERIAL_DATA_OUT;

architecture Behavioral of TARGETC_SERIAL_DATA_OUT is

	--State
	type state_type is (
		IDLE,
		LOW_SET0,
		LOW_SET1,
		HIGH_SET1,
		HIGH_SET0
	);
	signal state : state_type := IDLE;
	
--	component clk_wiz_0
--	port
--	 (-- Clock in ports
--	  -- Clock out ports
--	  clk_out1          : out    std_logic;
	  -- Status and control signals
--	  reset             : in     std_logic;
--	  locked            : out    std_logic;
--	  clk_in1           : in     std_logic
--	 );
--	end component;
  
  	signal HSclk :	std_logic := '0';
  	signal locked_Hsclk:	std_logic := '0';
  	
  	signal internal_cnt :	integer := 0;
  	--signal TPG_flg : std_logic := '0';
begin

--	CLK_WIZ_inst : clk_wiz_0
--	port map(
--		clk_out1 => HSclk,
--		reset	=> '0',
--		locked	=> locked_clk,
--		clk_in1	=> CLK
--	);
	
	-- Process for 
	process(CLK)
	begin
		if rising_edge(CLK) then
			case state is
				when IDLE =>
					HSclk <= '0';
					eSS_Incr <= '0';
					if(start = '1') then
						state <= LOW_SET0;
						--if(eTPG = '1') then
						--	TPG_flg <= '1';
						--else
						--	TPG_flg <= '0';
						--end if;
					else
						state <= IDLE;
					end if;
				when LOW_SET0 =>
					HSclk <= '0';
					if internal_cnt = 0  then
						eSS_Incr <= '1';
					else
						eSS_Incr <= '0';
					end if;
					state <= LOW_SET1;
				when LOW_SET1 =>
					HSclk <= '1';
					state <= HIGH_SET1;
				when HIGH_SET1 =>
					eSS_Incr <= '0';
					HSclk <= '1';
					state <= HIGH_SET0;
				when HIGH_SET0 =>
					-- SAmple the output of TARGETC
					if internal_cnt > 1 then
						--eDO_BUS.CH0(12-internal_cnt) <= eDO(0);
						--eDO_BUS.CH1(12-internal_cnt) <= eDO(1);
						--eDO_BUS.CH2(12-internal_cnt) <= eDO(2);
						--eDO_BUS.CH3(12-internal_cnt) <= eDO(3);
					
						--eDO_BUS.CH4(12-internal_cnt) <= eDO(4);
						--eDO_BUS.CH5(12-internal_cnt) <= eDO(5);
						--eDO_BUS.CH6(12-internal_cnt) <= eDO(6);
						--eDO_BUS.CH7(12-internal_cnt) <= eDO(7);
					
						--eDO_BUS.CH8(12-internal_cnt) <= eDO(8);
						--eDO_BUS.CH9(12-internal_cnt) <= eDO(9);
						--eDO_BUS.CH10(12-internal_cnt) <= eDO(10);
						--eDO_BUS.CH11(12-internal_cnt) <= eDO(11);
					
						--eDO_BUS.CH12(12-internal_cnt) <= eDO(12);
						--eDO_BUS.CH13(12-internal_cnt) <= eDO(13);
						--eDO_BUS.CH14(12-internal_cnt) <= eDO(14);
						--eDO_BUS.CH15(12-internal_cnt) <= eDO(15);
						
						-- LSB First 
						eDO_BUS.CH0(internal_cnt-2) <= eDO(0);
						eDO_BUS.CH1(internal_cnt-2) <= eDO(1);
						eDO_BUS.CH2(internal_cnt-2) <= eDO(2);
						eDO_BUS.CH3(internal_cnt-2) <= eDO(3);
					
						eDO_BUS.CH4(internal_cnt-2) <= eDO(4);
						eDO_BUS.CH5(internal_cnt-2) <= eDO(5);
						eDO_BUS.CH6(internal_cnt-2) <= eDO(6);
						eDO_BUS.CH7(internal_cnt-2) <= eDO(7);
					
						eDO_BUS.CH8(internal_cnt-2) <= eDO(8);
						eDO_BUS.CH9(internal_cnt-2) <= eDO(9);
						eDO_BUS.CH10(internal_cnt-2) <= eDO(10);
						eDO_BUS.CH11(internal_cnt-2) <= eDO(11);
					
						eDO_BUS.CH12(internal_cnt-2) <= eDO(12);
						eDO_BUS.CH13(internal_cnt-2) <= eDO(13);
						eDO_BUS.CH14(internal_cnt-2) <= eDO(14);
						eDO_BUS.CH15(internal_cnt-2) <= eDO(15);
					end if;
					--for I in 0 to 15 loop
					--	eDO_BUS(I) (11-internal_cnt) <= eDO(I); 	
					--end loop;
					
					
					HSclk <= '0';
					
					--if internal_cnt = 12 then
					if internal_cnt = 13 then
						state <= IDLE;
						internal_cnt <= 0;
						--TPG_flg <= '0';
					else
						state <= LOW_SET0;
						internal_cnt <= internal_cnt + 1;
					end if;
				when others =>
					-- nop
			end case;
		end if;
		
		
	end process;


	-- Input/Output Refresh
	eHSclk <= HSclk;
	--eSmplSl_Any	<= TPG_flg;
	
end Behavioral;

