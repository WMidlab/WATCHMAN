-------------------------------------------------------------------------------
-- Title      : 
-------------------------------------------------------------------------------
-- File       : AxiCommonReg.vhd
-- Author     : Larry Ruckman  <ruckman@slac.stanford.edu>
-- Company    : SLAC National Accelerator Laboratory
-- Created    : 2014-04-17
-- Last update: 2017-06-24
-- Platform   : Vivado 2013.3
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2014 SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.StdRtlPkg.all;
use work.AxiLitePkg.all;
use work.SsiCmdMasterPkg.all;
use work.CommonPkg.all;

entity AxiCommonReg is
   generic (
      TPD_G              : time                  := 1 ns;
      STATUS_CNT_WIDTH_G : natural range 1 to 32 := 32;
      AXI_ERROR_RESP_G   : slv(1 downto 0)       := AXI_RESP_SLVERR_C);
   port (
      -- AXI-Lite Register Interface (axiClk domain)
      axiReadMaster  : in  AxiLiteReadMasterType;
      axiReadSlave   : out AxiLiteReadSlaveType;
      axiWriteMaster : in  AxiLiteWriteMasterType;
      axiWriteSlave  : out AxiLiteWriteSlaveType;
      -- VC command  (axiClk domain)
      --ssiCmd         : in  SsiCmdMasterType;
      -- Register Inputs/Outputs (axiClk domain)
      status         : in  CommonStatusType;
      config         : out CommonConfigType;
      -- Global Signals
      axiClk         : in  sl;
      axiRst         : out sl;
      softTrig       : out sl;
      sysRst         : in  sl);      
end AxiCommonReg;

architecture rtl of AxiCommonReg is

   constant STATUS_SIZE_C     : positive := 2;

   type RegType is record
      cntRst        : sl;
      rollOverEn    : slv(STATUS_SIZE_C-1 downto 0);
      regOut        : CommonConfigType;
      axiReadSlave  : AxiLiteReadSlaveType;
      axiWriteSlave : AxiLiteWriteSlaveType;
      setUsrRst     : sl;
      setSoftTrgCmd : sl;
   end record RegType;
   
   constant REG_INIT_C : RegType := (
      '1',
      (others => '0'),
      COMMON_CONFIG_INIT_C,
      AXI_LITE_READ_SLAVE_INIT_C,
      AXI_LITE_WRITE_SLAVE_INIT_C,
      '0',
      '0');

   signal r   : RegType := REG_INIT_C;
   signal rin : RegType;

   signal regIn  : CommonStatusType := COMMON_STATUS_INIT_C;
   signal regOut : CommonConfigType := COMMON_CONFIG_INIT_C;

   signal cntRst,
      setUsrRst,
      usrRst,
      reset,
      axiReset : sl;
   signal rollOverEn : slv(STATUS_SIZE_C-1 downto 0);
   signal cntOut  : SlVectorArray(STATUS_SIZE_C-1 downto 0, STATUS_CNT_WIDTH_G-1 downto 0);

   signal txReadyCnt,
      rxReadyCnt : slv(STATUS_CNT_WIDTH_G-1 downto 0);

   signal softTrigCmd,
      setSoftTrgCmd : sl;
   
begin

   -------------------------------
   -- Configuration Register
   -------------------------------  
   comb : process (axiReadMaster, axiReset, axiWriteMaster,
                   r, rxReadyCnt, txReadyCnt, status, regIn) is
      variable v            : RegType;
      variable axiStatus    : AxiLiteStatusType;
      variable axiWriteResp : slv(1 downto 0);
      variable axiReadResp  : slv(1 downto 0);
   begin
      -- Latch the current value
      v := r;

      -- Determine the transaction type
      axiSlaveWaitTxn(axiWriteMaster, axiReadMaster, v.axiWriteSlave, v.axiReadSlave, axiStatus);

      -- Reset strobe signals
      v.cntRst                := '0';
      v.regOut.eventTrigger   := '0';
      v.regOut.fanoutResetL   := '1';
      v.regOut.eventCountReset := '0';
      v.regOut.runRstCountReset := '0';
      v.regOut.feeRstCountReset := '0';
      v.regOut.b2lRstCountReset := '0';
      v.regOut.gtxRstCountReset := '0';
      v.regOut.pllLockCountReset := '0';
      v.regOut.manualRunReset    := '0';
      
      --added by EYC
      v.setUsrRst             := '0';
      v.setSoftTrgCmd         := '0';
      
      -----------------------------------
      -- REGISTER WRITES
      -----------------------------------
      if (axiStatus.writeEnable = '1') then
         -- Check for an out of 32 bit aligned address
         axiWriteResp := ite(axiWriteMaster.awaddr(1 downto 0) = "00", AXI_RESP_OK_C, AXI_ERROR_RESP_G);
         -- Decode address and perform write
         case (axiWriteMaster.awaddr(9 downto 2)) is
            --added by EYC
            when x"10" =>
               v.setUsrRst := '1';
            when x"11" =>
               v.setSoftTrgCmd := '1';
            ----EYC------   
            when x"82" => v.regOut.carrierDataSelect := axiWriteMaster.wdata(2 downto 0);
            when x"AA" => v.regOut.eventTrigger := '1';
            when x"AB" => v.regOut.trigMask    := axiWriteMaster.wdata(3 downto 0);
            when x"B0" => v.regOut.fanoutResetL := '0';
            when x"B1" => v.regOut.eventCountReset := axiWriteMaster.wdata(0);
            when x"C0" => v.regOut.runRstCountReset := axiWriteMaster.wdata(0);
            when x"C1" => v.regOut.feeRstCountReset := axiWriteMaster.wdata(0);
            when x"C2" => v.regOut.b2lRstCountReset := axiWriteMaster.wdata(0);
            when x"C3" => v.regOut.gtxRstCountReset := axiWriteMaster.wdata(0);
            when x"C4" => v.regOut.pllLockCountReset := axiWriteMaster.wdata(0);
            when x"D0" => v.regOut.asicMask := axiWriteMaster.wdata(15 downto 0);
            when x"D1" => v.regOut.manualRunReset := '1';
            when x"D2" => v.regOut.filteringTimeout := axiWriteMaster.wdata(31 downto 0);
            when x"F0" => v.rolloverEn := axiWriteMaster.wdata(STATUS_SIZE_C-1 downto 0);
            when x"FF" => v.cntRst := '1';
            when others =>
               axiWriteResp := AXI_ERROR_RESP_G;
         end case;
         -- Send AXI response
         axiSlaveWriteResponse(v.axiWriteSlave, axiWriteResp);
      end if;

      -----------------------------------
      -- REGISTER READS
      -----------------------------------      
      if (axiStatus.readEnable = '1') then
         -- Check for an out of 32 bit aligned address
         axiReadResp          := ite(axiReadMaster.araddr(1 downto 0) = "00", AXI_RESP_OK_C, AXI_ERROR_RESP_G);
         -- Decode address and assign read data
         v.axiReadSlave.rdata := (others => '0');
         case (axiReadMaster.araddr(9 downto 2)) is
            when x"13" => v.axiReadSlave.rdata(STATUS_CNT_WIDTH_G-1 downto 0) := rxReadyCnt;
            when x"14" => v.axiReadSlave.rdata(STATUS_CNT_WIDTH_G-1 downto 0) := txReadyCnt;
            when x"70" => v.axiReadSlave.rdata(0)           := regIn.txReady;
                          v.axiReadSlave.rdata(1)           := regIn.rxReady; 
            when x"81" => v.axiReadSlave.rdata(31 downto 0) := status.eventCount;
            when x"82" => v.axiReadSlave.rdata(2 downto 0)  := r.regOut.carrierDataSelect;
            when x"90" => v.axiReadSlave.rdata(31 downto 0) := status.runRstCount;
            when x"91" => v.axiReadSlave.rdata(31 downto 0) := status.feeRstCount;
            when x"92" => v.axiReadSlave.rdata(31 downto 0) := status.b2lRstCount;
            when x"93" => v.axiReadSlave.rdata(31 downto 0) := status.gtxRstCount;
            when x"94" => v.axiReadSlave.rdata(31 downto 0) := status.pllLockCount;
            when x"95" => v.axiReadSlave.rdata(31 downto 0) := status.noAckCount(3) & status.noAckCount(2) & status.noAckCount(1) & status.noAckCount(0);
            when x"96" => v.axiReadSlave.rdata(31 downto 0) := status.stuckCount(3) & status.stuckCount(2) & status.stuckCount(1) & status.stuckCount(0);
            when x"97" => v.axiReadSlave.rdata(3 downto 0)  := status.trigLinksAligned;
            when x"AB" => v.axiReadSlave.rdata(3 downto 0)  := r.regOut.trigMask;
            when x"D0" => v.axiReadSlave.rdata(15 downto 0) := r.regOut.asicMask;
            when x"D1" => v.axiReadSlave.rdata(0)           := r.regOut.manualRunReset;
            when x"D2" => v.axiReadSlave.rdata(31 downto 0) := r.regOut.filteringTimeout;
            when x"E0" => v.axiReadSlave.rdata(7 downto 0)  := status.pendingEventCount;
            when x"E1" => v.axiReadSlave.rdata(7 downto 0)  := status.maxPendingEventCount;
            when x"E2" => v.axiReadSlave.rdata(15 downto 0) := status.asicTimeoutMask;
            when x"F0" => v.axiReadSlave.rdata(STATUS_SIZE_C-1 downto 0) := r.rollOverEn;
            when others =>
               axiReadResp := AXI_ERROR_RESP_G;
         end case;
         -- Send Axi Response
         axiSlaveReadResponse(v.axiReadSlave, axiReadResp);
      end if;

      -- Synchronous Reset
      if axiReset = '1' then
         v := REG_INIT_C;
      end if;

      -- Register the variable for next clock cycle
      rin <= v;

      -- Outputs
      axiReadSlave  <= r.axiReadSlave;
      axiWriteSlave <= r.axiWriteSlave;

      regOut <= r.regOut;

      cntRst     <= r.cntRst;
      rollOverEn <= r.rollOverEn;
      
      setUsrRst  <= r.setUsrRst;
      setSoftTrgCmd <= r.setSoftTrgCmd;
      
   end process comb;

   seq : process (axiClk) is
   begin
      if rising_edge(axiClk) then
         r <= rin after TPD_G;
      end if;
   end process seq;

   -------------------------------            
   -- Synchronization: Outputs
   -------------------------------
   config <= regOut;
   
--   U_SsiCmdSlavePulserRst : entity work.SsiCmdMasterPulser
--      generic map (
--         TPD_G          => TPD_G,
--         OUT_POLARITY_G => '1',
--         PULSE_WIDTH_G  => 1)   
--      port map (
--         -- Local command signal
--         cmdSlaveOut => ssiCmd,
--         --addressed cmdOpCode
--         opCode      => x"FF",
--         -- output pulse to sync module
--         syncPulse   => usrRst,
--         -- Local clock and reset
--         locClk      => axiClk,
--         locRst      => axiReset); 

   U_PulserRst : entity work.MasterPulser
      generic map (
         TPD_G          => TPD_G,
         OUT_POLARITY_G => '1',
         PULSE_WIDTH_G  => 1)
      port map (   
         setPulse       => setUsrRst,
         -- output pulse to sync module
         syncPulse      => usrRst,
         -- Local clock and reset
         locClk         => axiClk,
         locRst         => axiReset);

   reset <= usrRst or sysRst;

   SyncOut_Reset : entity work.RstSync
      generic map (
         TPD_G => TPD_G)   
      port map (
         clk      => axiClk,
         asyncRst => reset,
         syncRst  => axiReset); 

   axiRst <= axiReset;

--   U_SsiCmdSlavePulserTrig : entity work.SsiCmdMasterPulser
--      generic map (
--         TPD_G          => TPD_G,
--         OUT_POLARITY_G => '1',
--         PULSE_WIDTH_G  => 1)   
--      port map (
--         -- Local command signal
--         cmdSlaveOut => ssiCmd,
--         --addressed cmdOpCode
--         opCode      => x"00",
--         -- output pulse to sync module
--         syncPulse   => softTrigCmd,
--         -- Local clock and reset
--         locClk      => axiClk,
--         locRst      => axiReset); 

   U_PulserTrig : entity work.MasterPulser
      generic map (
         TPD_G          => TPD_G,
         OUT_POLARITY_G => '1',
         PULSE_WIDTH_G  => 1)
      port map (   
         setPulse       => setSoftTrgCmd,
         -- output pulse to sync module
         syncPulse      => softTrigCmd,
         -- Local clock and reset
         locClk         => axiClk,
         locRst         => axiReset);

   softTrig <= softTrigCmd or regOut.eventTrigger;
   
   -------------------------------
   -- Synchronization: Inputs
   ------------------------------- 
   SyncStatusVec_Inst : entity work.SyncStatusVector
      generic map (
         TPD_G          => TPD_G,
         OUT_POLARITY_G => '1',
         CNT_RST_EDGE_G => true,
         COMMON_CLK_G   => true,
         CNT_WIDTH_G    => STATUS_CNT_WIDTH_G,
         WIDTH_G        => STATUS_SIZE_C)     
      port map (
         -- Input Status bit Signals (wrClk domain)
         statusIn(1)             => status.rxReady,  
         statusIn(0)             => status.txReady,
         -- Output Status bit Signals (rdClk domain)
         statusOut(1)            => regIn.txReady,
         statusOut(0)            => regIn.rxReady, 
         -- Status Bit Counters Signals (rdClk domain) 
         cntRstIn              => cntRst,
         rollOverEnIn          => rollOverEn,
         cntOut                => cntOut,
         -- Clocks and Reset Ports
         wrClk                 => axiClk,
         rdClk                 => axiClk);

   rxReadyCnt           <= muxSlVectorArray(cntOut, 1);
   txReadyCnt           <= muxSlVectorArray(cntOut, 0);
   
end rtl;
