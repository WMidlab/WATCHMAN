----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    14:40:31 10/25/2013
-- Design Name:
-- Module Name:    TARGETX_DAC_CONTROL - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Revision 0.02: -added a 'busy' pin such that calling process can wait until the work is over, 25/09/14- IM
-- Additional Comments:

----------------------------------------------------------------------------------
--! Use standard Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--! Custom Library for TARGETC
use work.TARGETC_pkg.all;

entity TARGETX_DAC_CONTROL is
    generic (
		constant REGISTER_WIDTH : integer := 19-- needs to change, change the name of the file to TargetX DAC control this is actually 19 now
	 );
    Port (
    		CLK : 				in  STD_LOGIC;
    		PCLK_LATCH_PERIOD:	in	STD_LOGIC_VECTOR(15 downto 0);
    		PCLK_TRANSITION_PERIOD:	in	STD_LOGIC_VECTOR(15 downto 0);

			LOAD_PERIOD : 		in  STD_LOGIC_VECTOR(15 downto 0);
			LATCH_PERIOD : 		in  STD_LOGIC_VECTOR(15 downto 0);
			-- UPDATE : 			in  STD_LOGIC;
			-- REG_DATA_IN : 		in  STD_LOGIC_VECTOR(18 downto 0);
			-- REG_DATA_OUT : 		out std_logic_vector(18 downto 0);
           	-- busy		: 		out std_logic;

            CtrlBus_IxSL:		in 	T_CtrlBus_IxSL; --Outputs from Control Master
    		--CtrlBus_OxSL:		out	T_CtrlBus_OxSL; --Outputs from Control Master
            TC_BUS: 		out std_logic_vector(18 downto 0);
            BUSY:			out std_logic;

			SIN : out  STD_LOGIC;
           	SCLK : out  STD_LOGIC;
           	PCLK : out  STD_LOGIC;
           	SHOUT: in	STD_LOGIC);
end TARGETX_DAC_CONTROL;

architecture Behavioral of TARGETX_DAC_CONTROL is

   --STATES
   type state_type is (
			IDLE,
			LOAD_DAC_LOW_SET0,
			LOAD_DAC_LOW_WAIT0,
			LOAD_DAC_LOW_MID,
			LOAD_DAC_LOW_SET1,
			LOAD_DAC_LOW_WAIT1,
			LOAD_DAC_HIGH_SET0,
			LOAD_DAC_HIGH_WAIT0,
			LOAD_DAC_HIGH_MID,
			LOAD_DAC_HIGH_SET1,
			LOAD_DAC_HIGH_WAIT1,

			LD_BUS_0,
			LD_BUS_1,
			LD_BUS_2,

			LD_ADDR_0,
			LD_ADDR_1,
			LD_ADDR_2,
			LD_ADDR_3,
			LD_ADDR_4,

			LATCH_SET0,
			LATCH_WAIT0,
			LATCH_SET1,
			LATCH_WAIT1,
			LATCH_SET2,
			LATCH_WAIT2,
			LATCH_SET3,
			LATCH_WAIT3,
			LATCH_SET4,
			LATCH_WAIT4,
			LATCH_SET5,
			LATCH_WAIT5,
			LATCH_SET6,
			LATCH_WAIT6
			);
   signal STATE : state_type := IDLE;

   --Internal signals for all outputs of the state-machine
	signal SIN_i : std_logic := '0';
	signal SCLK_i : std_logic := '0';
	signal PCLK_i : std_logic := '0';
	signal SHOUT_i : std_logic := '0';
	signal busy_intl : std_logic :='0';

	--Nomal variables
	SIGNAL cnt  : integer := 0;
	signal ENABLE_COUNTER : std_logic := '0';
	signal INTERNAL_COUNTER	: UNSIGNED(15 downto 0) := x"0000";
	signal UPDATE_REG : std_logic_vector(1 downto 0 ) := "00";
	signal UPDATE_START : std_logic := '1';

	--constants
	--signal LOAD_PERIOD  	: UNSIGNED(15 downto 0) := x"0080";
	--signal LATCH_PERIOD  	: UNSIGNED(15 downto 0) := x"0140";

begin

    -- --------------------------------------------------------------------------------
    -- Unused signals from Bus

    -- CtrlBus_OxSL.DO_BUS <= (others => (others => 'Z'));
    -- CtrlBus_OxSL.BUSY	<= 'Z';
    -- CtrlBus_OxSL.PLL_LOCKED <= 'Z';
    --
    -- CtrlBus_OxSL.SSvalid <= 'Z';
    -- CtrlBus_OxSL.RAMP_CNT <= 'Z';
    -- CtrlBus_OxSL.Cnt_AXIS <= (others => 'Z');
    --
    -- CtrlBus_OxSL.FIFOBusy <= 'Z';
    -- CtrlBus_OxSL.WindowBusy <= 'Z';
    -- CtrlBus_OxSL.RBNbrOfPackets <= (others => 'Z');
    -- --------------------------------------------------------------------------------


   --counter process
	process (CLK,ENABLE_COUNTER) begin
		if (ENABLE_COUNTER = '0') then
			INTERNAL_COUNTER <= (others => '0');
		elsif (rising_edge(CLK)) then
			if ENABLE_COUNTER = '1' then
				INTERNAL_COUNTER <= INTERNAL_COUNTER + 1;
			end if;
		end if;
	end process;

	--LATCH OUTGOING SIGNALS
   SYNC_PROC: process (CLK)
   begin-- good practice to send internals to outputs not change outputs directly and define a sync process to spit them out
      if (CLK'event and CLK = '1') then
			SIN <= SIN_i;
			SCLK <= SCLK_i;
			PCLK <= PCLK_i;
			SHOUT_i <= SHOUT;
            busy <= busy_intl;
			--CtrlBus_OxSL.busy <= busy_intl;
      end if;
   end process;

	--Edge detector for key internal signals
	process (CLK) begin
		if (falling_edge(CLK)) then
			UPDATE_REG(1) <= UPDATE_REG(0);
			--UPDATE_REG(0) <= UPDATE;
            UPDATE_REG(0) <= CtrlBus_IxSL.WRITEREG;
        end if;
	end process;
	UPDATE_START <= '1' when (UPDATE_REG = "01") else
	                    '0';

   --process to load DACs to ASIC
	DAC_REGISTER_UPDATE_TARGETX : PROCESS(CLK)
	BEGIN
		------------------------------------------------------------
		IF RISING_EDGE(CLK) THEN
			CASE STATE IS
				--------------------------------
				WHEN IDLE =>
				   SIN_i <= '0';
					SCLK_i <= '0';
					PCLK_i <= '0';
					cnt 		<= 0;
					busy_intl<='0';
					ENABLE_COUNTER <= '0';
					if UPDATE_START = '1' then
						STATE <= LOAD_DAC_LOW_SET0;
					else
						STATE <= IDLE;
					end if;
				--------------------------------

				WHEN LOAD_DAC_LOW_SET0 =>
					SCLK_i <= '0';
					ENABLE_COUNTER <= '0';
					STATE <= LOAD_DAC_LOW_WAIT0;
					busy_intl<='1';

				WHEN LOAD_DAC_LOW_WAIT0 =>
					SCLK_i <= '0';
					ENABLE_COUNTER <= '1';
					STATE <= LOAD_DAC_LOW_WAIT0;
					if INTERNAL_COUNTER > UNSIGNED(LOAD_PERIOD) then
						ENABLE_COUNTER <= '0';
						state <= LOAD_DAC_LOW_MID;
					end if;

				WHEN LOAD_DAC_LOW_MID =>
					SCLK_i <= '0';
					ENABLE_COUNTER <= '0';
					if cnt < REGISTER_WIDTH then
						STATE <= LOAD_DAC_LOW_SET1;
						SIN_i <= CtrlBus_IxSL.TC_BUS(18 - cnt);	--SLB is sent first as "cnt" increasing.
						--SHOUT
--CtrlBus_OxSL.TC_BUS(18 - cnt) <= SHOUT_i;
                        TC_BUS(18 - cnt) <= SHOUT_i;
					else
						--STATE <= LATCH_SET0; --DONE LOADING REGISTER
						STATE <= LD_BUS_0; --DONE LOADING REGISTER

						cnt <= 0;
					end if;

				WHEN LOAD_DAC_LOW_SET1 =>
					SCLK_i <= '0';
					ENABLE_COUNTER <= '0';
					STATE <= LOAD_DAC_LOW_WAIT1;

				WHEN LOAD_DAC_LOW_WAIT1 =>
					SCLK_i <= '0';
					ENABLE_COUNTER <= '1';
					STATE <= LOAD_DAC_LOW_WAIT1;
					if INTERNAL_COUNTER > UNSIGNED(LOAD_PERIOD) then
						ENABLE_COUNTER <= '0';
						STATE <= LOAD_DAC_HIGH_SET0;
					end if;

				WHEN LOAD_DAC_HIGH_SET0 =>
					SCLK_i <= '1';
					ENABLE_COUNTER <= '0';
					STATE <= LOAD_DAC_HIGH_WAIT0;

				WHEN LOAD_DAC_HIGH_WAIT0 =>
					SCLK_i <= '1';
					ENABLE_COUNTER <= '1';
					STATE <= LOAD_DAC_HIGH_WAIT0;
					if INTERNAL_COUNTER > UNSIGNED(LOAD_PERIOD) then
						ENABLE_COUNTER <= '0';
						state <= LOAD_DAC_HIGH_MID;
					end if;

				WHEN LOAD_DAC_HIGH_MID =>
					SCLK_i <= '1';
					ENABLE_COUNTER <= '0';
					STATE <= LOAD_DAC_HIGH_SET1;
					--SHOUT
					--REG_DATA_OUT(18 - cnt) <= SHOUT_i;	-- The data is sample after
					cnt <= cnt + 1;

				WHEN LOAD_DAC_HIGH_SET1 =>
					SCLK_i <= '1';
					ENABLE_COUNTER <= '0';
					STATE <= LOAD_DAC_HIGH_WAIT1;

				WHEN LOAD_DAC_HIGH_WAIT1 =>
					SCLK_i <= '1';
					ENABLE_COUNTER <= '1';
					STATE <= LOAD_DAC_HIGH_WAIT1;
					if INTERNAL_COUNTER > UNSIGNED(LOAD_PERIOD) then
						ENABLE_COUNTER <= '0';
						STATE <= LOAD_DAC_LOW_SET0;
					end if;

				WHEN LATCH_SET0 =>
				   SIN_i <= '0';
					SCLK_i <= '0';
					PCLK_i <= '0';
					ENABLE_COUNTER <= '0';
					STATE <= LATCH_WAIT0;

				WHEN LATCH_WAIT0 =>
				   SIN_i <= '0';
					SCLK_i <= '0';
					PCLK_i <= '0';
					ENABLE_COUNTER <= '1';
					STATE <= LATCH_WAIT0;
					if INTERNAL_COUNTER > UNSIGNED(LATCH_PERIOD) then
						ENABLE_COUNTER <= '0';
						STATE <= LATCH_SET1;
					end if;

				-- HEJ Modification for PCLK_PERIOD Monitor
				when LD_BUS_0 =>
					SIN_i <= '0';
					SCLK_i <= '0';
					PCLK_i <= '0';
					ENABLE_COUNTER <= '1';
					STATE <= LD_BUS_0;
					if INTERNAL_COUNTER >= UNSIGNED(PCLK_TRANSITION_PERIOD) then
						ENABLE_COUNTER <= '0';
						STATE <= LD_BUS_1;
					end if;

				when LD_BUS_1 =>
					SIN_i <= '0';
					SCLK_i <= '0';
					PCLK_i <= '1';
					ENABLE_COUNTER <= '1';
					STATE <= LD_BUS_1;
					if INTERNAL_COUNTER >= UNSIGNED(PCLK_LATCH_PERIOD) then
						ENABLE_COUNTER <= '0';
						STATE <= LD_BUS_2;
					end if;
				when LD_BUS_2 =>
					SIN_i <= '0';
					SCLK_i <= '0';
					PCLK_i <= '0';
					ENABLE_COUNTER <= '1';
					STATE <= LD_BUS_2;
					if INTERNAL_COUNTER >= UNSIGNED(PCLK_TRANSITION_PERIOD) then
						ENABLE_COUNTER <= '0';
						STATE <= LD_ADDR_0;
					end if;

				when LD_ADDR_0 =>
					SIN_i <= '1';
					SCLK_i <= '0';
					PCLK_i <= '0';
					ENABLE_COUNTER <= '1';
					STATE <= LD_ADDR_0;
					if INTERNAL_COUNTER >= UNSIGNED(PCLK_TRANSITION_PERIOD) then
						ENABLE_COUNTER <= '0';
						STATE <= LD_ADDR_1;
					end if;

				when LD_ADDR_1 =>
					SIN_i <= '1';
					SCLK_i <= '0';
					PCLK_i <= '1';
					ENABLE_COUNTER <= '1';
					STATE <= LD_ADDR_1;
					if INTERNAL_COUNTER >= UNSIGNED(PCLK_LATCH_PERIOD) then
						ENABLE_COUNTER <= '0';
						STATE <= LD_ADDR_2;
					end if;

				when LD_ADDR_2 =>
					SIN_i <= '1';
					SCLK_i <= '0';
					PCLK_i <= '0';
					ENABLE_COUNTER <= '1';
					STATE <= LD_ADDR_2;
					if INTERNAL_COUNTER >= UNSIGNED(PCLK_TRANSITION_PERIOD) then
						ENABLE_COUNTER <= '0';
						STATE <= LD_ADDR_3;
					end if;
				when LD_ADDR_3 =>
					SIN_i <= '0';
					SCLK_i <= '0';
					PCLK_i <= '0';
					STATE <= LD_ADDR_4;

				when LD_ADDR_4 =>
					SIN_i <= '0';
					SCLK_i <= '0';
					PCLK_i <= '0';
					STATE <= IDLE;

				-- FIRST PULSE FOR PCLK
				WHEN LATCH_SET1 =>
				   SIN_i <= '0';
					SCLK_i <= '0';
					PCLK_i <= '1';
					ENABLE_COUNTER <= '0';
					STATE <= LATCH_WAIT1;

				WHEN LATCH_WAIT1 =>
				   SIN_i <= '0';
					SCLK_i <= '0';
					PCLK_i <= '1';
					ENABLE_COUNTER <= '1';
					STATE <= LATCH_WAIT1;
					if INTERNAL_COUNTER > UNSIGNED(LATCH_PERIOD) then
						ENABLE_COUNTER <= '0';
						STATE <= LATCH_SET2;
					end if;

				WHEN LATCH_SET2 =>
				   SIN_i <= '0';
					SCLK_i <= '0';
					PCLK_i <= '0';
					ENABLE_COUNTER <= '0';
					STATE <= LATCH_WAIT2;

				WHEN LATCH_WAIT2 =>
				   SIN_i <= '0';
					SCLK_i <= '0';
					PCLK_i <= '0';
					ENABLE_COUNTER <= '1';
					STATE <= LATCH_WAIT2;
					if INTERNAL_COUNTER > UNSIGNED(LATCH_PERIOD) then
						ENABLE_COUNTER <= '0';
						STATE <= LATCH_SET3;
					end if;

				WHEN LATCH_SET3 =>
				   SIN_i <= '1';
					SCLK_i <= '0';
					PCLK_i <= '0';
					ENABLE_COUNTER <= '0';
					STATE <= LATCH_WAIT3;

				WHEN LATCH_WAIT3 =>
				   SIN_i <= '1';
					SCLK_i <= '0';
					PCLK_i <= '0';
					ENABLE_COUNTER <= '1';
					STATE <= LATCH_WAIT3;
					if INTERNAL_COUNTER > UNSIGNED(LATCH_PERIOD) then
						ENABLE_COUNTER <= '0';
						STATE <= LATCH_SET4;
					end if;

				WHEN LATCH_SET4 =>
				   SIN_i <= '1';
					SCLK_i <= '0';
					PCLK_i <= '1';
					ENABLE_COUNTER <= '0';
					STATE <= LATCH_WAIT4;

				WHEN LATCH_WAIT4 =>
				   SIN_i <= '1';
					SCLK_i <= '0';
					PCLK_i <= '1';
					ENABLE_COUNTER <= '1';
					STATE <= LATCH_WAIT4;
					if INTERNAL_COUNTER > UNSIGNED(LATCH_PERIOD) then
						ENABLE_COUNTER <= '0';
						STATE <= LATCH_SET5;
					end if;

				WHEN LATCH_SET5 =>
				   SIN_i <= '1';
					SCLK_i <= '0';
					PCLK_i <= '0';
					ENABLE_COUNTER <= '0';
					STATE <= LATCH_WAIT5;

			   WHEN LATCH_WAIT5 =>
				   SIN_i <= '1';
					SCLK_i <= '0';
					PCLK_i <= '0';
					ENABLE_COUNTER <= '1';
					STATE <= LATCH_WAIT5;
					if INTERNAL_COUNTER > UNSIGNED(LATCH_PERIOD) then
						ENABLE_COUNTER <= '0';
						STATE <= LATCH_SET6;
					end if;

				WHEN LATCH_SET6 =>
				   SIN_i <= '0';
					SCLK_i <= '0';
					PCLK_i <= '0';
					ENABLE_COUNTER <= '0';
					STATE <= LATCH_WAIT6;

				WHEN LATCH_WAIT6 =>
				   SIN_i <= '0';
					SCLK_i <= '0';
					PCLK_i <= '0';
					ENABLE_COUNTER <= '1';
					STATE <= LATCH_WAIT6;
					if INTERNAL_COUNTER > UNSIGNED(LATCH_PERIOD) then
						ENABLE_COUNTER <= '0';
						STATE <= IDLE;
					end if;

				--------------------------------
				WHEN OTHERS =>
					STATE <= IDLE;
			END CASE;
			------------------------------------------------------------
		END IF;
		------------------------------------------------------------
	END PROCESS DAC_REGISTER_UPDATE_TARGETX;

end Behavioral;
