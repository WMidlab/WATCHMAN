library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.UtilityPkg.all;
use work.Version.all;
use work.P1Pkg.all;
-- For Xilinx primitives
library UNISIM;
use UNISIM.VComponents.all;

entity RegMap is
   generic (
      CLOCK_RATE_G   : integer := 80000000;
      DAC_SPI_RATE_G : integer := 10000000
   );
   port (
      clk           : in  sl;
      sRst          : in  sl;
      -- Pin connections to external devices
      I2C_SCL       : inout sl;
      I2C_SDA       : inout sl;
      adcSclk       : out slv(1 downto 0);
      adcSen        : out slv(1 downto 0);
      adcSdata      : out slv(1 downto 0);
      adcSdout      : in  slv(1 downto 0);
      henrySpiClk   : out sl;
      henrySpiData  : out sl;
      henrySpiLoad  : out sl;
      henrySpiRdBit : in  sl;
      -- Register interfaces to UART controller
      regAddr       : in  slv(31 downto 0);
      regWrData     : in  slv(31 downto 0);
      regRdData     : out slv(31 downto 0);
      regReq        : in  sl;
      regOp         : in  sl;
      regAck        : out sl;
      -- Inband telemetry data (flattened for ease of passing around)
      telemetryData : out slv(32*INBAND_TELEMETRY_REGISTERS_C-1 downto 0);
      telemetryAddr : out slv(32*INBAND_TELEMETRY_REGISTERS_C-1 downto 0);
      -- Current time in clock ticks
      currentTime   : out slv(63 downto 0);
      -- Status and configuration connections to rest of the firmware
      P1Status      : in  StatusType;
      P1Config      : out ConfigType
   );
end RegMap;

architecture Behavioral of RegMap is
   signal p1ConfigReg : ConfigType := (CONFIG_TYPE_INIT_C);

   signal i2cReq      : slv(1 downto 0);
   signal i2cAck      : slv(1 downto 0);
   signal i2cReadData : Word16Array(1 downto 0);
   signal i2cFail     : slv(1 downto 0);
   signal i2cSda      : slv(1 downto 0) := (others => '1');
   signal i2cScl      : slv(1 downto 0) := (others => '1');
   signal i2cSdaMux   : sl := '1';
   signal i2cSclMux   : sl := '1';

   signal adcReq        : slv(1 downto 0);
   signal adcAck        : slv(1 downto 0);
   signal adcReadData   : Word16Array(1 downto 0);
   type AdcShadowDualArray is array (1 downto 0) of Word16Array(67 downto 0);
   signal adcShadowData : AdcShadowDualArray;

   signal henryReq        : sl;
   signal henryAck        : sl;
   signal henryReadData   : slv(13 downto 0);
   signal henryShadowData : Word14Array(38 downto 0);

   signal timeReq     : sl := '0';
   signal timeAck     : sl := '0';
   signal timeRdData  : slv(31 downto 0) := (others => '0');

   signal i2cSclT     : sl := '0';
   signal i2cSdaT     : sl := '0';
   signal i2cSdaRead  : sl := '0';
   signal i2cSclRead  : sl := '0';

   signal efuseVal    : slv(31 downto 0);
   signal deviceDna   : slv(63 downto 0);

   constant BITS_ADDR_C : integer := 32;
   constant BITS_DATA_C : integer := 32;

   attribute dont_touch : string;
   attribute dont_touch of i2cSclT : signal is "true";
   attribute dont_touch of i2cSdaT : signal is "true";

begin

   P1Config <= p1ConfigReg;

   process (clk)
      variable adcAddr : integer range 0 to 3 := 0;
   begin
      if rising_edge(clk) then
         if sRst = '1' then
            p1ConfigReg <= CONFIG_TYPE_INIT_C;
         else
            -- Default for all registers write and read in one cycle.
            -- This can be overridden below for specific registers.
            regAck    <= regReq;
            i2cReq    <= (others => '0');
            i2cSdaMux <= '1';
            i2cSclMux <= '1';
            adcReq    <= (others => '0');
            p1ConfigReg.adcTxTrig  <= '0';
            p1ConfigReg.adcReset   <= '0';
            p1ConfigReg.rawAdcSync <= '0';

            -- 0x00XX: Core registers
            if regAddr(15 downto 8) = x"00" then
               case regAddr(7 downto 0) is
                  when x"00" => regRdData <= FW_STRING_C;
                  when x"04" => regRdData <= FW_VERSION_C;
                  when x"08" => regRdData <= deviceDna(31 downto 0);
                  when x"0C" => regRdData <= deviceDna(63 downto 32);
                  when x"10" => regRdData <= efuseVal;
                  when x"14" => regRdData <= p1ConfigReg.scratchPad;
                     if regOp = '1' and regReq = '1' then
                        p1ConfigReg.scratchPad <= regWrData;
                     end if;
                  when x"20" => regRdData <= CORE_CLK_FREQ_C;
                  when x"24" => regRdData <= timeRdData;
                                regAck    <= timeAck;
                                timeReq   <= regReq;
                  when x"28" => regRdData <= timeRdData;
                                regAck    <= timeAck;
                                timeReq   <= regReq;
                  when x"2C" => regRdData <= P1Status.frameSeqId(31 downto 0);
                  when x"30" => regRdData <= P1Status.frameSeqId(63 downto 32);
                  when x"34" => regRdData <= (others => '0');
                     if regOp = '1' then
                        p1ConfigReg.adcTxTrig <= regWrData(0) and regReq;
                        p1ConfigReg.adcReset  <= regWrData(1) and regReq;
                     end if;
                  when others => regRdData <= x"BAD0BEEF";
               end case;
            -- 0x01XX: Frame flow control registers
            elsif regAddr(15 downto 8) = x"01" then
               case regAddr(7 downto 0) is
                  when x"00"  => regRdData <= p1ConfigReg.framePeriod;
                     if regOp = '1' and regReq = '1' then
                        p1ConfigReg.framePeriod <= regWrData;
                     end if;
                  when x"04"  => regRdData <= (0 => p1ConfigReg.frameFlowOn, 1 => p1ConfigReg.frameFlowFull, 2 => p1ConfigReg.frameTestMode, 3 => p1ConfigReg.rawAdcMode, others => '0');
                     if regOp = '1' and regReq = '1' then
                        p1ConfigReg.frameFlowOn   <= regWrData(0);
                        p1ConfigReg.frameFlowFull <= regWrData(1);
                        p1ConfigReg.frameTestMode <= regWrData(2);
                        p1ConfigReg.rawAdcMode    <= regWrData(3);
                     end if;
                  when x"08"  => regRdData <= p1ConfigReg.laneAdcDisable(3) & "00" & p1ConfigReg.laneAdcSel(3) &
                                              p1ConfigReg.laneAdcDisable(2) & "00" & p1ConfigReg.laneAdcSel(2) &
                                              p1ConfigReg.laneAdcDisable(1) & "00" & p1ConfigReg.laneAdcSel(1) &
                                              p1ConfigReg.laneAdcDisable(0) & "00" & p1ConfigReg.laneAdcSel(0);
                     if regOp = '1' then
                        p1ConfigReg.rawAdcSync <= '1';
                     end if;
                     if regOp = '1' and regReq = '1' then
                        p1ConfigReg.laneAdcSel(3) <= regWrData(28 downto 24);
                        p1ConfigReg.laneAdcSel(2) <= regWrData(20 downto 16);
                        p1ConfigReg.laneAdcSel(1) <= regWrData(12 downto  8);
                        p1ConfigReg.laneAdcSel(0) <= regWrData( 4 downto  0);
                        p1ConfigReg.laneAdcDisable(3) <= regWrData(31);
                        p1ConfigReg.laneAdcDisable(2) <= regWrData(23);
                        p1ConfigReg.laneAdcDisable(1) <= regWrData(15);
                        p1ConfigReg.laneAdcDisable(0) <= regWrData(7);
                     end if;
                  when x"0C" => regRdData <= p1ConfigReg.adcPipeDelay;
                     if regOp = '1' and regReq = '1' then
                        p1ConfigReg.adcPipeDelay <= regWrData;
                     end if;
                  when x"10" => regRdData <= x"0000" & x"00" & "00" & P1Status.pGoodBits & "00" & p1ConfigReg.pShdnBits;
                     if regOp = '1' and regReq = '1' then
                        p1ConfigReg.pShdnBits <= regWrData(1 downto 0);
                     end if;
                  when others => regRdData <= x"BAD1BEEF";
               end case;
            -- 0x02XX: Reserved for ADC spy ports
            elsif regAddr(15 downto 8) = x"02" then
               regRdData(31 downto 12) <= (others => '0');
               regRdData(11 downto  0) <= P1Status.adcData(to_integer(unsigned(regAddr(7 downto 2))));
            -- 0x03XX: MAC address registers for various lanes
            elsif regAddr(15 downto 8) = x"03" then
               case regAddr(7 downto 0) is
                  when x"00" =>
                     regRdData <= p1ConfigReg.destMac(0)(47 downto 16);
                     if regOp = '1' and regReq ='1' then
                        p1ConfigReg.destMac(0)(47 downto 16) <= regWrData;
                     end if;
                  when x"04" =>
                     regRdData <= x"0000" & p1ConfigReg.destMac(0)(15 downto 0);
                     if regOp = '1' and regReq ='1' then
                        p1ConfigReg.destMac(0)(15 downto 0) <= regWrData(15 downto 0);
                     end if;
                  when x"08" =>
                        regRdData <= p1ConfigReg.destMac(1)(47 downto 16);
                        if regOp = '1' and regReq ='1' then
                           p1ConfigReg.destMac(1)(47 downto 16) <= regWrData;
                        end if;
                  when x"0C" =>
                     regRdData <= x"0000" & p1ConfigReg.destMac(1)(15 downto 0);
                     if regOp = '1' and regReq ='1' then
                        p1ConfigReg.destMac(1)(15 downto 0) <= regWrData(15 downto 0);
                     end if;
                  when x"10" =>
                        regRdData <= p1ConfigReg.destMac(2)(47 downto 16);
                        if regOp = '1' and regReq ='1' then
                           p1ConfigReg.destMac(2)(47 downto 16) <= regWrData;
                        end if;
                  when x"14" =>
                     regRdData <= x"0000" & p1ConfigReg.destMac(2)(15 downto 0);
                     if regOp = '1' and regReq ='1' then
                        p1ConfigReg.destMac(2)(15 downto 0) <= regWrData(15 downto 0);
                     end if;
                  when x"18" =>
                        regRdData <= p1ConfigReg.destMac(3)(47 downto 16);
                        if regOp = '1' and regReq ='1' then
                           p1ConfigReg.destMac(3)(47 downto 16) <= regWrData;
                        end if;
                  when x"1C" =>
                     regRdData <= x"0000" & p1ConfigReg.destMac(3)(15 downto 0);
                     if regOp = '1' and regReq ='1' then
                        p1ConfigReg.destMac(3)(15 downto 0) <= regWrData(15 downto 0);
                     end if;
                  when others => regRdData <= x"BAD3BEEF";
               end case;
            -- 0x20XX: Galvanically isolated output control
            elsif regAddr(15 downto 8) = x"20" then
               case regAddr(7 downto 0) is
                  when x"00" =>
                     regRdData <= x"000000" & p1ConfigReg.gPort(1) & p1ConfigReg.gPort(0);
                     if regOp = '1' and regReq = '1' then
                        p1ConfigReg.gPort(1) <= regWrData(7 downto 4);
                        p1ConfigReg.gPort(0) <= regWrData(3 downto 0);
                     end if;
                  when others => regRdData <= x"BADBBEEF";
               end case;
            -- SPI Interface to ADC A
            elsif "00" & regAddr(15 downto 10) = x"14" then
               adcReq(0) <= regReq;
               regAck    <= adcAck(0);
               regRdData <= x"0000" & adcReadData(0);
            -- SPI Interface to ADC B
            elsif "00" & regAddr(15 downto 10) = x"15" then
               adcReq(1) <= regReq;
               regAck    <= adcAck(1);
               regRdData <= x"0000" & adcReadData(1);
            -- SPI Interface to HENRY
            elsif "00" & regAddr(15 downto 10) = x"16" then
               henryReq  <= regReq;
               regAck    <= henryAck;
               regRdData <= x"0000" & "00" & henryReadData;
            -- I2C temperature sensor A (0x6000 base + internal reg addr << 2)
            elsif "00" & regAddr(15 downto 10) = x"18" then
--               I2C_SCL   <= i2cScl(0);
--               I2C_SDA   <= i2cSda(0);
               i2cSdaMux <= i2cSda(0);
               i2cSclMux <= i2cScl(0);
               i2cReq(0) <= regReq;
               regAck    <= i2cAck(0);
               regRdData <= i2cFail(0) & "000" & x"000" & i2cReadData(0);
            -- I2C temperature sensor B (0x6400 base + internal reg addr << 2)
            elsif "00" & regAddr(15 downto 10) = x"19" then
--               I2C_SCL   <= i2cScl(1);
--               I2C_SDA   <= i2cSda(1);
               i2cSdaMux <= i2cSda(1);
               i2cSclMux <= i2cScl(1);
               i2cReq(1) <= regReq;
               regAck    <= i2cAck(1);
               regRdData <= i2cFail(1) & "000" & x"000" & i2cReadData(1);
            else
               regRdData <= x"BADBEBAD";
            end if;
         end if;
      end if;
   end process;

   ------------------------
   -- Local Time Counter --
   ------------------------
   U_SystemTime : entity work.SystemTime
      port map (
         clk       => clk,         --: in  sl;
         rst       => sRst,        --: in  sl;
         -- Parallel interface for current ticks value
         ticksOut  => currentTime, --: out slv(63 downto 0);
         -- 32-bit interface to match up with the reg controller
         regHiWord => regAddr(3),  --: in  sl; -- 1-bit high if you're reading 63:32, low for 31:0
         regReq    => timeReq,     --: in  sl; -- Standard register handshake signals
         regAck    => timeAck,     --: out sl; -- No need for op since we're read only
         regRdData => timeRdData   --: out slv(31 downto 0)
      );

   -----------------------------------------------------
   -- Xilinx primitives or simple derivatives thereof --
   -----------------------------------------------------
   -- One-time burnable eFUSE (32-bit)
   U_Efuse : EFUSE_USR
      generic map (
         SIM_EFUSE_VALUE => X"00000000" -- Value of the 32-bit non-volatile value used in simulation
      )
      port map (
         EFUSEUSR => efuseVal -- 32-bit output: User eFUSE register value output
      );
   -- Device DNA (64-bit)
   U_DeviceDna : entity work.DeviceDna
      port map (
         clk       => clk,
         rst       => sRst,
         -- Parallel interface for current ticks value
         dnaOut    => deviceDna
      );

   -----------------
   -- SPI Devices --
   -----------------
   -- Modules for serial communication with the ADCs
   G_SpiAdc : for i in 1 downto 0 generate
      U_SpiAds52j90 : entity work.SpiAds52j90
         generic map (
            SCLK_HALF_PERIOD_G => 50
         )
         port map (
            -- Clock and reset
            sysClk  => clk,
            sysRst  => sRst,
            -- ADC serial IO
            adcSclk => adcSclk(i),
            adcCsb  => adcSen(i),
            adcSin  => adcSdata(i),
            adcSout => adcSdout(i),
            -- Register mapping into this module
            adcOp     => regOp,
            adcReq    => adcReq(i),
            adcAck    => adcAck(i),
            adcAddr   => regAddr(9 downto 2),
            adcRdData => adcReadData(i),
            adcWrData => regWrData(15 downto 0),
            -- ADC shadow registers
            adcShadow => adcShadowData(i)
         );
   end generate;
   -- Modules for serial communication with HENRY
   U_SpiHenry : entity work.SpiHenryV1
   generic map (
      SCLK_HALF_PERIOD_G => 50
   )
   port map (
      -- Clock and reset
      sysClk  => clk,
      sysRst  => sRst,
      -- ADC serial IO
      spiClk  => henrySpiClk,
      spiLoad => henrySpiLoad,
      spiData => henrySpiData,
      bitBack => henrySpiRdBit,
      -- Register mapping into this module
      henryOp     => regOp,
      henryReq    => henryReq,
      henryAck    => henryAck,
      henryAddr   => regAddr(6 downto 2),
      henryRdData => henryReadData,
      henryWrData => regWrData(13 downto 0),
      -- Shadow register output
      henryShadow => henryShadowData
   );

   -----------------
   -- I2C Devices --
   -----------------
--   I2C_SCL <= 'Z' when i2cScl = "11" else '0';
--   I2C_SDA <= 'Z' when i2cSda = "11" else '0';
--   i2cSclT <= '0' when (i2cScl(0) = '0' or i2cScl(1) = '0') else '1';
--   i2cSdaT <= '0' when (i2cSda(0) = '0' or i2cSda(1) = '0') else '1';
   --
   U_I2C_SCL_BUF : IOBUF
      port map (
         I  => '0',
         O  => i2cSclRead,
         IO => I2C_SCL,
         T  => i2cSclMux
      );
   U_I2C_SDA_BUF : IOBUF
      port map (
         I  => '0',
         O  => i2cSdaRead,
         IO => I2C_SDA,
         T  => i2cSdaMux
      );
   -----------
   U_I2C_TMP468_A : entity work.I2C_TMP468
      generic map (
         I2C_ADDR_G => "1001001",
         SCL_HALF_PERIOD_G => 200
      )
      port map (
         -- Pins to device
         I2C_SCL    => i2cScl(0),             --: inout sl;
         I2C_SDA    => i2cSda(0),             --: inout sl;
         I2C_SDAI   => i2cSdaRead,
         -- Clock and reset
         sysClk     => clk,                   --: in    sl;
         sysRst     => sRst,                  --: in    sl;
         -- Interface to register controller
         i2cReq     => i2cReq(0),             --: in    sl;
         i2cOp      => regOp,                 --: in    sl;
         i2cAck     => i2cAck(0),             --: out   sl;
         i2cRegAddr => regAddr(9 downto 2),   --: in    slv(7 downto 0);
         i2cRdData  => i2cReadData(0),        --: out   slv(15 downto 0);
         i2cWrData  => regWrData(15 downto 0),--: in    slv(15 downto 0)
         i2cFail    => i2cFail(0)
      );
   -----------
   U_I2C_TMP468_B : entity work.I2C_TMP468
      generic map (
         I2C_ADDR_G => "1001000",
         SCL_HALF_PERIOD_G => 200
      )
      port map (
         -- Pins to device
         I2C_SCL    => i2cScl(1),             --: inout sl;
         I2C_SDA    => i2cSda(1),             --: inout sl;
         I2C_SDAI   => i2cSdaRead,
         -- Clock and reset
         sysClk     => clk,                   --: in    sl;
         sysRst     => sRst,                  --: in    sl;
         -- Interface to register controller
         i2cReq     => i2cReq(1),             --: in    sl;
         i2cOp      => regOp,                 --: in    sl;
         i2cAck     => i2cAck(1),             --: out   sl;
         i2cRegAddr => regAddr(9 downto 2),   --: in    slv(7 downto 0);
         i2cRdData  => i2cReadData(1),        --: out   slv(15 downto 0);
         i2cWrData  => regWrData(15 downto 0),--: in    slv(15 downto 0)
         i2cFail    => i2cFail(1)
      );

   -- Map out the flattened telemetry data going to inband telemetry
   -- GROUP 0, ADDR 0x100 to 0x108
   telemetryAddr( 1*BITS_ADDR_C-1 downto  0*BITS_ADDR_C) <= x"00000100";
   telemetryData( 1*BITS_DATA_C-1 downto  0*BITS_DATA_C) <= p1ConfigReg.framePeriod;
   telemetryAddr( 2*BITS_ADDR_C-1 downto  1*BITS_ADDR_C) <= x"00000104";
   telemetryData( 2*BITS_DATA_C-1 downto  1*BITS_DATA_C) <= x"0000000" & p1ConfigReg.rawAdcMode & p1ConfigReg.frameTestMode & p1ConfigReg.frameFlowFull & p1ConfigReg.frameFlowOn;
   telemetryAddr( 3*BITS_ADDR_C-1 downto  2*BITS_ADDR_C) <= x"00000108";
   telemetryData( 3*BITS_DATA_C-1 downto  2*BITS_DATA_C) <= p1ConfigReg.laneAdcDisable(3) & "00" & p1ConfigReg.laneAdcSel(3) & p1ConfigReg.laneAdcDisable(2) & "00" & p1ConfigReg.laneAdcSel(2) & p1ConfigReg.laneAdcDisable(1) & "00" & p1ConfigReg.laneAdcSel(1) & p1ConfigReg.laneAdcDisable(0) & "00" & p1ConfigReg.laneAdcSel(0);
   -- GROUP 1, ADC A shadow registers + pad word
   G_ADC_A_TELEMETRY : for i in 0 to 67 generate
      telemetryAddr( (4+i)*BITS_ADDR_C-1 downto  (3+i)*BITS_ADDR_C ) <= x"00" & "00" & x"014" & slv(to_unsigned(i,8)) & "00";
      telemetryData( (4+i)*BITS_DATA_C-1 downto  (3+i)*BITS_DATA_C ) <= x"0000" & adcShadowData(0)(i);
   end generate;
   telemetryAddr(72*BITS_ADDR_C-1 downto  71*BITS_ADDR_C) <= (others => '0');
   telemetryData(72*BITS_DATA_C-1 downto  71*BITS_DATA_C) <= (others => '0');
   -- GROUP 2, ADC B shadow registers + pad word
   G_ADC_B_TELEMETRY : for i in 0 to 67 generate
      telemetryAddr( (73+i)*BITS_ADDR_C-1 downto  (72+i)*BITS_ADDR_C) <= x"00" & "00" & x"015" & slv(to_unsigned(i,8)) & "00";
      telemetryData( (73+i)*BITS_DATA_C-1 downto  (72+i)*BITS_DATA_C) <= x"0000" & adcShadowData(1)(i);
   end generate;
   telemetryAddr(141*BITS_ADDR_C-1 downto 140*BITS_ADDR_C) <= (others => '0');
   telemetryData(141*BITS_DATA_C-1 downto 140*BITS_DATA_C) <= (others => '0');
   -- GROUP 3, ROIC shadow registers
   G_ROIC_TELEMETRY : for i in 0 to 38 generate
      telemetryAddr( (142+i)*BITS_ADDR_C-1 downto  (141+i)*BITS_ADDR_C) <= x"00" & "00" & x"016" & slv(to_unsigned(i,8)) & "00";
      telemetryData( (142+i)*BITS_DATA_C-1 downto  (141+i)*BITS_DATA_C) <= x"0000" & "00" & henryShadowData(i);
   end generate;
   -- GROUP 4, Galvanically isolated port
   telemetryAddr(181*BITS_ADDR_C-1 downto 180*BITS_ADDR_C) <= x"00002000";
   telemetryData(181*BITS_DATA_C-1 downto 180*BITS_DATA_C) <= x"000000" & p1ConfigReg.gPort(1) & p1ConfigReg.gPort(0);
   -- Last one is 3+69+69+39+1 = 181, 4 bytes per word

end Behavioral;
