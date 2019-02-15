
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.TARGETC_pkg.all;
use work.Register_pkg.all;
use work.AXI_Lite_pkg.all;

entity TC_Control is
	port (
	-- TARGET C Ports for control and functi

		AxiBusIn:		in AXI_Lite_Inputs;
		AxiBusOut:		out AXI_Lite_Outputs;

		ClockBus:		in T_ClockBus;

		CtrlBus_OxMS:		out T_CtrlBus_OxMS;
		CtrlBus_IxMS:		in 	T_CtrlBus_IxMS
	);
end TC_Control;

architecture arch_imp of TC_Control is

	component clkcrossing_buf is
		generic(
			NBITS : integer := 32
		);
		port (
			nrst:	in	std_logic;
			DA: 	in	std_logic_vector(NBITS-1 downto 0);
			QB:		out	std_logic_vector(NBITS-1 downto 0);
			ClkA:	in	std_logic;
			ClkB:	in	std_logic
		);
	end component clkcrossing_buf;

	-- AXI4LITE signals
	signal axi_awaddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_awready	: std_logic;
	signal axi_wready	: std_logic;
	signal axi_bresp	: std_logic_vector(1 downto 0);
	signal axi_bvalid	: std_logic;
	signal axi_araddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_arready	: std_logic;
	signal axi_rdata	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal axi_rresp	: std_logic_vector(1 downto 0);
	signal axi_rvalid	: std_logic;

	-- Example-specific design signals
	-- local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	-- ADDR_LSB is used for addressing 32/64 bit registers/memories
	-- ADDR_LSB = 2 for 32 bits (n downto 2)
	-- ADDR_LSB = 3 for 64 bits (n downto 3)
	constant ADDR_LSB  : integer := (C_S_AXI_DATA_WIDTH/32)+ 1;
	--constant OPT_MEM_ADDR_BITS : integer := 3;
	constant OPT_MEM_ADDR_BITS : integer := 7; -- For a hundred regsiters

	------------------------------------------------
	---- Signals for user logic register space example


	signal slv_reg_rden	: std_logic;
	signal slv_reg_wren	: std_logic;
	signal reg_data_out	:std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal byte_index	: integer;
	signal aw_en	: std_logic;

 	signal start_write_stm : 	Pulse_State_Type := IDLE;
    signal ss_incr_stm : 		Pulse_State_Type := IDLE;
    signal rdad_stm : 			Pulse_State_Type := IDLE;
    signal startstorage_stm : 	Pulse_State_Type := IDLE;
    signal SSack_stm : 			Pulse_State_Type := IDLE;
    signal TestStream_stm : 	Pulse_State_Type := IDLE;
    signal PSBusy_stm : 		Pulse_State_Type := IDLE;
    signal testfifo_stm:		Pulse_State_Type := IDLE;

    signal TC_ADDR_s :	std_logic_vector(6 downto 0);
    signal TC_DATA_s:	std_logic_vector(11 downto 0);

    -- Signal intl
    signal STATUS_intl: std_logic_vector(31 downto 0);

	signal TCReg: slv_array(0 to TC_REGISTER_NUMBER);
	signal Cnt_AXIS_intl: std_logic_vector(9 downto 0);
	signal WindowStorage_intl : std_logic;

begin
	-- I/O Connections assignments

	AxiBusOut.AWREADY	<= axi_awready;
	AxiBusOut.WREADY	<= axi_wready;
	AxiBusOut.BRESP	<= axi_bresp;
	AxiBusOut.BVALID	<= axi_bvalid;
	AxiBusOut.ARREADY	<= axi_arready;
	AxiBusOut.RDATA	<= axi_rdata;
	AxiBusOut.RRESP	<= axi_rresp;
	AxiBusOut.RVALID	<= axi_rvalid;
	AxiBusOut.INTR		<= '0';	-- Interrupt not used

	process (AxiBusIn.ACLK)
	begin
	  if rising_edge(AxiBusIn.ACLK) then
	    if AxiBusIn.ARESETN = '0' then
	      axi_awready <= '0';
	      aw_en <= '1';
	    else
	      if (axi_awready = '0' and AxiBusIn.AWVALID = '1' and AxiBusIn.WVALID = '1' and aw_en = '1') then
	        -- slave is ready to accept write address when
	        -- there is a valid write address and write data
	        -- on the write address and data bus. This design
	        -- expects no outstanding transactions.
	        axi_awready <= '1';
	        elsif (AxiBusIn.BREADY = '1' and axi_bvalid = '1') then
	            aw_en <= '1';
	        	axi_awready <= '0';
	      else
	        axi_awready <= '0';
	      end if;
	    end if;
	  end if;
	end process;

	-- Implement axi_awaddr latching
	-- This process is used to latch the address when both
	-- S_AXI_AWVALID and S_AXI_WVALID are valid.

	process (AxiBusIn.ACLK)
	begin
	  if rising_edge(AxiBusIn.ACLK) then
	    if AxiBusIn.ARESETN = '0' then
	      axi_awaddr <= (others => '0');
	    else
	      if (axi_awready = '0' and AxiBusIn.AWVALID = '1' and AxiBusIn.WVALID = '1' and aw_en = '1') then
	        -- Write Address latching
	        axi_awaddr <= AxiBusIn.AWADDR;
	      end if;
	    end if;
	  end if;
	end process;

	-- Implement axi_wready generation
	-- axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is
	-- de-asserted when reset is low.

	process (AxiBusIn.ACLK)
	begin
	  if rising_edge(AxiBusIn.ACLK) then
	    if AxiBusIn.ARESETN = '0' then
	      axi_wready <= '0';
	    else
	      if (axi_wready = '0' and AxiBusIn.WVALID = '1' and AxiBusIn.AWVALID = '1' and aw_en = '1') then
	          -- slave is ready to accept write data when
	          -- there is a valid write address and write data
	          -- on the write address and data bus. This design
	          -- expects no outstanding transactions.
	          axi_wready <= '1';
	      else
	        axi_wready <= '0';
	      end if;
	    end if;
	  end if;
	end process;

	-- Implement memory mapped register select and write logic generation
	-- The write data is accepted and written to memory mapped registers when
	-- axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	-- select byte enables of slave registers while writing.
	-- These registers are cleared when reset (active low) is applied.
	-- Slave register write enable is asserted when valid address and data are available
	-- and the slave is ready to accept the write address and write data.
	slv_reg_wren <= axi_wready and AxiBusIn.WVALID and axi_awready and AxiBusIn.AWVALID ;

	process (AxiBusIn.ACLK)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
	begin
	  if rising_edge(AxiBusIn.ACLK) then
	    if AxiBusIn.ARESETN = '0' then

	    	for index in 0 to TC_REGISTER_NUMBER loop
	       		case index is
	       		    when TC_STATUS_REG =>

	       		    when TC_DATA_OUT_REG =>
	     				-- Read Only
					when TC_eDO_CH0_REG =>
						-- Read Only
					when TC_eDO_CH1_REG =>
						-- Read Only
					when TC_eDO_CH2_REG =>
						-- Read Only
					when TC_eDO_CH3_REG =>
						-- Read Only

					when TC_eDO_CH4_REG =>
						-- Read Only
					when TC_eDO_CH5_REG =>
						-- Read Only
					when TC_eDO_CH6_REG =>
						-- Read Only
					when TC_eDO_CH7_REG =>
						-- Read Only

					when TC_eDO_CH8_REG =>
						-- Read Only
					when TC_eDO_CH9_REG =>
						-- Read Only
					when TC_eDO_CH10_REG =>
						-- Read Only
					when TC_eDO_CH11_REG =>
						-- Read Only

					when TC_eDO_CH12_REG =>
						-- Read Only
					when TC_eDO_CH13_REG =>
						-- Read Only
					when TC_eDO_CH14_REG =>
						-- Read Only
					when TC_eDO_CH15_REG =>
						-- Read Only
					when TC_CNT_RB_AXIS =>
					when others =>
						-- Respective byte enables are asserted as per write strobes
						TCReg(index) <= (others => '0');
				end case;
	       end loop;

	    else
	      loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);

	      if (slv_reg_wren = '1') then
--	      		for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
--                	if ( S_AXI_WSTRB(byte_index) = '1' ) then
--                  -- Respective byte enables are asserted as per write strobes
--                  		if(to_integer(unsigned(loc_addr)) < 100) then
--
--                  		reg(to_integer(unsigned(loc_addr))) (byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
--                  		end if;
--                  	end if;
--                 end loop;
--           end if;
			if(to_integer(unsigned(loc_addr)) < (TC_REGISTER_NUMBER+1)) then
				case to_integer(unsigned(loc_addr)) is
	     			when TC_STATUS_REG =>

	     			when TC_DATA_OUT_REG =>

					when TC_eDO_CH0_REG =>
						-- Read Only
					when TC_eDO_CH1_REG =>
						-- Read Only
					when TC_eDO_CH2_REG =>
						-- Read Only
					when TC_eDO_CH3_REG =>
						-- Read Only

					when TC_eDO_CH4_REG =>
						-- Read Only
					when TC_eDO_CH5_REG =>
						-- Read Only
					when TC_eDO_CH6_REG =>
						-- Read Only
					when TC_eDO_CH7_REG =>
						-- Read Only

					when TC_eDO_CH8_REG =>
						-- Read Only
					when TC_eDO_CH9_REG =>
						-- Read Only
					when TC_eDO_CH10_REG =>
						-- Read Only
					when TC_eDO_CH11_REG =>
						-- Read Only

					when TC_eDO_CH12_REG =>
						-- Read Only
					when TC_eDO_CH13_REG =>
						-- Read Only
					when TC_eDO_CH14_REG =>
						-- Read Only
					when TC_eDO_CH15_REG =>
						-- Read Only
					when TC_CNT_RB_AXIS =>
					when others =>
						for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
							if ( AxiBusIn.WSTRB(byte_index) = '1' ) then
								-- Respective byte enables are asserted as per write strobes
								TCReg(to_integer(unsigned(loc_addr))) (byte_index*8+7 downto byte_index*8) <= AxiBusIn.WDATA(byte_index*8+7 downto byte_index*8);
							end if;
						end loop;
				end case;
			end if;
			end if;
	    end if;
	  end if;
	end process;

	-- Implement write response logic generation
	-- The write response and response valid signals are asserted by the slave
	-- when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.
	-- This marks the acceptance of address and indicates the status of
	-- write transaction.

	process (AxiBusIn.ACLK)
	begin
	  if rising_edge(AxiBusIn.ACLK) then
	    if AxiBusIn.ARESETN = '0' then
	      axi_bvalid  <= '0';
	      axi_bresp   <= "00"; --need to work more on the responses
	    else
	      if (axi_awready = '1' and AxiBusIn.AWVALID = '1' and axi_wready = '1' and AxiBusIn.WVALID = '1' and axi_bvalid = '0'  ) then
	        axi_bvalid <= '1';
	        axi_bresp  <= "00";
	      elsif (AxiBusIn.BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
	        axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
	      end if;
	    end if;
	  end if;
	end process;

	-- Implement axi_arready generation
	-- axi_arready is asserted for one S_AXI_ACLK clock cycle when
	-- S_AXI_ARVALID is asserted. axi_awready is
	-- de-asserted when reset (active low) is asserted.
	-- The read address is also latched when S_AXI_ARVALID is
	-- asserted. axi_araddr is reset to zero on reset assertion.

	process (AxiBusIn.ACLK)
	begin
	  if rising_edge(AxiBusIn.ACLK) then
	    if AxiBusIn.ARESETN = '0' then
	      axi_arready <= '0';
	      axi_araddr  <= (others => '1');
	    else
	      if (axi_arready = '0' and AxiBusIn.ARVALID = '1') then
	        -- indicates that the slave has acceped the valid read address
	        axi_arready <= '1';
	        -- Read Address latching
	        axi_araddr  <= AxiBusIn.ARADDR;
	      else
	        axi_arready <= '0';
	      end if;
	    end if;
	  end if;
	end process;

	-- Implement axi_arvalid generation
	-- axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both
	-- S_AXI_ARVALID and axi_arready are asserted. The slave registers
	-- data are available on the axi_rdata bus at this instance. The
	-- assertion of axi_rvalid marks the validity of read data on the
	-- bus and axi_rresp indicates the status of read transaction.axi_rvalid
	-- is deasserted on reset (active low). axi_rresp and axi_rdata are
	-- cleared to zero on reset (active low).
	process (AxiBusIn.ACLK)
	begin
	  if rising_edge(AxiBusIn.ACLK) then
	    if AxiBusIn.ARESETN = '0' then
	      axi_rvalid <= '0';
	      axi_rresp  <= "00";
	    else
	      if (axi_arready = '1' and AxiBusIn.ARVALID = '1' and axi_rvalid = '0') then
	        -- Valid read data is available at the read data bus
	        axi_rvalid <= '1';
	        axi_rresp  <= "00"; -- 'OKAY' response
	      elsif (axi_rvalid = '1' and AxiBusIn.RREADY = '1') then
	        -- Read data is accepted by the master
	        axi_rvalid <= '0';
	      end if;
	    end if;
	  end if;
	end process;

	-- Implement memory mapped register select and read logic generation
	-- Slave register read enable is asserted when valid address is available
	-- and the slave is ready to accept the read address.
	slv_reg_rden <= axi_arready and AxiBusIn.ARVALID and (not axi_rvalid) ;

	process (axi_araddr, AxiBusIn.ARESETN, slv_reg_rden)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
	begin
	    -- Address decoding for reading registers
	    loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	    if(to_integer(unsigned(loc_addr)) < (TC_REGISTER_NUMBER+1))then
	    	case to_integer(unsigned(loc_addr)) is
	    		when TC_STATUS_REG =>
	        		reg_data_out <= status_intl;
	        	when TC_DATA_OUT_REG =>
	        		reg_data_out <= "0000000000000" & CtrlBus_IxMS.TC_BUS(18 downto 0);
	        	when TC_eDO_CH0_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH0;
	        	when TC_eDO_CH1_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH1;
	        	when TC_eDO_CH2_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH2;
	        	when TC_eDO_CH3_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH3;
	        	when TC_eDO_CH4_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH4;
	        	when TC_eDO_CH5_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH5;
	        	when TC_eDO_CH6_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH6;
	        	when TC_eDO_CH7_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH7;
	        	when TC_eDO_CH8_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH8;
	        	when TC_eDO_CH9_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH9;
	        	when TC_eDO_CH10_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH10;
	        	when TC_eDO_CH11_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH11;
	        	when TC_eDO_CH12_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH12;
	        	when TC_eDO_CH13_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH13;
	        	when TC_eDO_CH14_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH14;
	        	when TC_eDO_CH15_REG =>
	        		reg_data_out <= x"00000" & CtrlBus_IxMS.DO_BUS.CH15;
				when TC_ADDR_READOUT =>
					--reg_data_out <= x"0" & CtrlBus_IxMS.SS_read & CtrlBus_IxMS.WL_read & CtrlBus_IxMS.RDAD_read;
				when TC_CNT_RB_AXIS =>
					reg_data_out <= "000000" & CtrlBus_IxMS.Cnt_AXIS & x"00" & CtrlBus_IxMS.RBNbrOfPackets;
	    		when others =>
	    			reg_data_out <= TCReg(to_integer(unsigned(loc_addr)));
	    	end case;

	    else
	    	reg_data_out <= (others => '0');
	    end if;
	end process;

	-- Output register or memory read data
	process(AxiBusIn.ACLK,AxiBusIn.ARESETN) is
	begin
		if (AxiBusIn.ARESETN = '0') then
			 axi_rdata  <= (others => '0');
		else

			if (rising_edge (AxiBusIn.ACLK)) then
				if (slv_reg_rden = '1') then
				-- When there is a valid read address (S_AXI_ARVALID) with
				-- acceptance of read address by the slave (axi_arready),
				-- output the read dada
				-- Read address mux
					axi_rdata <= reg_data_out;     -- register read data
				end if;
			end if;
		end if;
	end process;

    	-- --------------------------------------------------------------------------------
	-- Start Write Register to TARGETC
    process(AxiBusIn.ARESETN,ClockBus.HSCLK) is
    begin
    	if (AxiBusIn.ARESETN = '0') then
			start_write_stm <= IDLE;
        else
        	if (rising_edge(ClockBus.HSCLK)) then
                case start_write_stm is
                    when IDLE =>
                        if ((TCReg(TC_CONTROL_REG) and C_WRITE_MASK) = C_WRITE_MASK) then
                            start_write_stm <= PULSE;
                        else
                            start_write_stm <= IDLE;
                        end if;
                    when PULSE =>
                        start_write_stm <= RESET;
                    when RESET =>	-- Wait for user PS clear register
                        if ((TCReg(TC_CONTROL_REG) and C_WRITE_MASK) = C_WRITE_MASK)then
                            start_write_stm <= RESET;
                        else
                            start_write_stm <= IDLE;
                        end if;
                   end case;
             end if;
        end if;
    end process;

    CtrlBus_OxMS.WRITEREG 	<= '1' when start_write_stm = PULSE else '0';

	-- --------------------------------------------------------------------------------
	-- Start Increment Sample Select
    --process(AxiBusIn.ARESETN,AxiBusIn.ACLK) is
   	--WARNING CLOCK must like SSACK
    process(AxiBusIn.ARESETN,ClockBus.HSCLK) is
    begin
    	if (AxiBusIn.ARESETN = '0') then
			ss_incr_stm <= IDLE;
        else
        	--if (rising_edge(AxiBusIn.ACLK)) then
            if (rising_edge(ClockBus.HSCLK)) then
                case ss_incr_stm is
                    when IDLE =>
                        if ((TCReg(TC_CONTROL_REG) and C_SS_INCR_MASK) = C_SS_INCR_MASK) then
                            ss_incr_stm <= PULSE;
                        else
                            ss_incr_stm <= IDLE;
                        end if;
                    when PULSE =>
                        ss_incr_stm <= RESET;
                    when RESET =>	-- Wait for user PS clear register
                        if ((TCReg(TC_CONTROL_REG) and C_SS_INCR_MASK) = C_SS_INCR_MASK)then
                            ss_incr_stm <= RESET;
                        else
                            ss_incr_stm <= IDLE;
                        end if;
                   end case;
             end if;
        end if;
    end process;

    CtrlBus_OxMS.SS_INCR 		<= '1' when ss_incr_stm = PULSE else '0';

	-- --------------------------------------------------------------------------------
	-- Start RDAD Start
    process(AxiBusIn.ARESETN,ClockBus.RDAD_CLK) is
    begin
    	if (AxiBusIn.ARESETN = '0') then
			rdad_stm <= IDLE;
        else
        	if (rising_edge(ClockBus.RDAD_CLK)) then
                case rdad_stm is
                    when IDLE =>
                        if ((TCReg(TC_CONTROL_REG) and C_RDAD_MASK) = C_RDAD_MASK) then
                            rdad_stm <= PULSE;
                        else
                            rdad_stm <= IDLE;
                        end if;
                    when PULSE =>
                        rdad_stm <= RESET;
                    when RESET =>	-- Wait for user PS clear register
                        if ((TCReg(TC_CONTROL_REG) and C_RDAD_MASK) = C_RDAD_MASK)then
                            rdad_stm <= RESET;
                        else
                            rdad_stm <= IDLE;
                        end if;
                   end case;
             end if;
        end if;
    end process;

    CtrlBus_OxMS.RDAD 		<= '1' when rdad_stm = PULSE else '0';

    -- --------------------------------------------------------------------------------
	-- Start Storage Command Start
    process(AxiBusIn.ARESETN,ClockBus.SSTIN) is
    begin
    	if (AxiBusIn.ARESETN = '0') then
        	startstorage_stm <= IDLE;
        else
            if (rising_edge(ClockBus.SSTIN)) then
                case startstorage_stm is
                    when IDLE =>
                        if ((TCReg(TC_CONTROL_REG) and C_WINDOW_MASK) = C_WINDOW_MASK) then
                            startstorage_stm <= PULSE;
                        else
                            startstorage_stm <= IDLE;
                        end if;
                    when PULSE =>
                        startstorage_stm <= RESET;
                    when RESET =>	-- Wait for user PS clear register
                        if ((TCReg(TC_CONTROL_REG) and C_WINDOW_MASK) = C_WINDOW_MASK)then
                            startstorage_stm <= RESET;
                        else
                            startstorage_stm <= IDLE;
                        end if;
                   end case;
             end if;
        end if;
    end process;


    --CtrlBus_OxMS.WindowStorage		<= '1' when startstorage_stm = PULSE else '0';
	--CtrlBus_OxMS.WindowStorage		<= '0' when startstorage_stm = IDLE else '1';
	WindowStorage_intl		<= '0' when startstorage_stm = IDLE else '1';

	-- --------------------------------------------------------------------------------
	-- Acknowledge the read of sample
    process(AxiBusIn.ARESETN,ClockBus.HSCLK) is
    begin
    	if (AxiBusIn.ARESETN = '0') then
    		SSack_stm <= IDLE;
        else
        	if (rising_edge(ClockBus.HSCLK)) then
                case SSack_stm is
                    when IDLE =>
                        if ((TCReg(TC_CONTROL_REG) and C_SSACK_MASK) = C_SSACK_MASK) then
                            SSack_stm <= PULSE;
                        else
                            SSack_stm <= IDLE;
                        end if;
                    when PULSE =>
                        SSack_stm <= RESET;
                    when RESET =>	-- Wait for user PS clear register
                        if ((TCReg(TC_CONTROL_REG) and C_SSACK_MASK) = C_SSACK_MASK) then
                            SSack_stm <= RESET;
                        else
                            SSack_stm <= IDLE;
                        end if;
                   end case;
             end if;
        end if;
    end process;

	--CtrlBus_OxMS.SSAck		<= '1' when SSack_stm = PULSE else '0';
	CtrlBus_OxMS.SSAck		<= '0' when SSack_stm = IDLE else '1';   --

	-- --------------------------------------------------------------------------------
	-- Acknowledge the read of sample
    process(AxiBusIn.ARESETN,AxiBusIn.ACLK) is
    begin
    	if (AxiBusIn.ARESETN = '0') then
    		TestStream_stm <= IDLE;
        else
        	if (rising_edge(AxiBusIn.ACLK)) then
                case TestStream_stm is
                    when IDLE =>
                        if ((TCReg(TC_CONTROL_REG) and C_TESTSTREAM_MASK) = C_TESTSTREAM_MASK) then
                            TestStream_stm <= PULSE;
                        else
                            TestStream_stm <= IDLE;
                        end if;
                    when PULSE =>
                        TestStream_stm <= RESET;
                    when RESET =>	-- Wait for user PS clear register
                        if ((TCReg(TC_CONTROL_REG) and C_TESTSTREAM_MASK) = C_TESTSTREAM_MASK) then
                            TestStream_stm <= RESET;
                        else
                            TestStream_stm <= IDLE;
                        end if;
                   end case;
             end if;
        end if;
    end process;

	--CtrlBus_OxMS.SSAck		<= '1' when SSack_stm = PULSE else '0';
	CtrlBus_OxMS.TestStream		<= '0' when TestStream_stm = IDLE else '1';

	-- --------------------------------------------------------------------------------

    process(AxiBusIn.ARESETN,ClockBus.HSCLK) is
    begin
    	if (AxiBusIn.ARESETN = '0') then
			testfifo_stm <= IDLE;
        else
        	--if (rising_edge(AxiBusIn.ACLK)) then
            if (rising_edge(ClockBus.HSCLK)) then
                case testfifo_stm is
                    when IDLE =>
                        if ((TCReg(TC_CONTROL_REG) and C_TESTFIFO_MASK) = C_TESTFIFO_MASK) then
                            testfifo_stm <= PULSE;
                        else
                            testfifo_stm <= IDLE;
                        end if;
                    when PULSE =>
                        testfifo_stm <= RESET;
                    when RESET =>	-- Wait for user PS clear register
                        if ((TCReg(TC_CONTROL_REG) and C_TESTFIFO_MASK) = C_TESTFIFO_MASK)then
                            testfifo_stm <= RESET;
                        else
                            testfifo_stm <= IDLE;
                        end if;
                   end case;
             end if;
        end if;
    end process;

    CtrlBus_OxMS.TestFIFO 		<= '1' when testfifo_stm = PULSE else '0';

	-- --------------------------------------------------------------------------------
	-- PS Busy for new frame
    process(AxiBusIn.ARESETN,AxiBusIn.ACLK) is
    begin
    	if (AxiBusIn.ARESETN = '0') then
    		PSBusy_stm <= IDLE;
        else
        	if (rising_edge(AxiBusIn.ACLK)) then
                case PSBusy_stm is
                    when IDLE =>
                        if ((TCReg(TC_CONTROL_REG) and C_PS_BUSY_MASK) = C_PS_BUSY_MASK) then
                            PSBusy_stm <= PULSE;
                        else
                            PSBusy_stm <= IDLE;
                        end if;
                    when PULSE =>
                        PSBusy_stm <= RESET;
                    when RESET =>	-- Wait for user PS clear register
                        if ((TCReg(TC_CONTROL_REG) and C_PS_BUSY_MASK) = C_PS_BUSY_MASK) then
                            PSBusy_stm <= RESET;
                        else
                            PSBusy_stm <= IDLE;
                        end if;
                   end case;
             end if;
        end if;
    end process;

	CtrlBus_OxMS.PSBusy		<= '0' when PSBusy_stm = IDLE else '1';


	-- ADDR and DATA to TARGETC Register
	CtrlBus_OxMS.TC_BUS <= TC_ADDR_s & TC_DATA_s;
	TC_ADDR_s <= std_logic_vector(to_unsigned(to_integer(unsigned(TCReg(TC_ADDR_REG))) - 1, TC_ADDR_s'length));
	TC_DATA_s <= TCReg(to_integer(unsigned(TCReg(TC_ADDR_REG))))(11 downto 0);

    CtrlBus_OxMS.WL_CLK_DIV <=  TCReg(TC_WL_DIV_REG);

    CtrlBus_OxMS.RAMP 		<= 	TCReg(TC_CONTROL_REG)(C_eRAMP_BIT);
    CtrlBus_OxMS.RegCLR 		<= 	TCReg(TC_CONTROL_REG)(C_eRegCLR_BIT);
    CtrlBus_OxMS.SmplSl_Any 	<= 	TCReg(TC_CONTROL_REG)(C_TPG_BIT);
   	CtrlBus_OxMS.SS_RESET		<= 	TCReg(TC_CONTROL_REG)(C_SS_RESET_BIT);
   	CtrlBus_OxMS.SW_nRST		<= 	TCReg(TC_CONTROL_REG)(C_SWRESET_BIT);

	-- CtrlBus_OxMS.FSTWINDOW		<= TCReg(TC_FSTWINDOW_REG);
	-- CtrlBus_OxMS.NBRWINDOW		<= TCReg(TC_NBRWINDOW_REG);
	--
	-- CtrlBus_OxMS.SAMPLEMODE		<= TCReg(TC_CONTROL_REG)(C_SMODE_BIT);
	-- CtrlBus_OxMS.CPUMODE		<= TCReg(TC_CONTROL_REG)(C_CPUMODE_BIT);
	BUF_WINDOWMODE : clkcrossing_buf
		generic map(
			NBITS => 1
		)
		port map(
			nrst	=>	AxiBusIn.ARESETN,
			DA(0)	=>	 WindowStorage_intl,
			QB(0)	=> 	CtrlBus_OxMS.WindowStorage,
			ClkA	=> 	AxiBusIn.ACLK,
			ClkB	=> ClockBus.CLK250MHz
		);

	BUF_CPUMODE : clkcrossing_buf
		generic map(
			NBITS => 1
		)
		port map(
			nrst	=>	AxiBusIn.ARESETN,
			DA(0)		=>	 TCReg(TC_CONTROL_REG)(C_CPUMODE_BIT),
			QB(0)		=> 	CtrlBus_OxMS.CPUMODE,
			ClkA	=> 	AxiBusIn.ACLK,
			ClkB	=> ClockBus.CLK250MHz
		);

	BUF_SAMPLEMODE : clkcrossing_buf
		generic map(
			NBITS => 1
		)
		port map(
			nrst	=>	AxiBusIn.ARESETN,
			DA(0)		=>	 TCReg(TC_CONTROL_REG)(C_SMODE_BIT),
			QB(0)		=> 	CtrlBus_OxMS.SAMPLEMODE	,
			ClkA	=> 	AxiBusIn.ACLK,
			ClkB	=> ClockBus.HSCLK
		);

	BUF_NBRWINDOWS : clkcrossing_buf
		generic map(
			NBITS => 32
		)
		port map(
			nrst	=>	AxiBusIn.ARESETN,
			DA		=>	TCReg(TC_NBRWINDOW_REG),
			QB		=> 	CtrlBus_OxMS.NBRWINDOW,
			ClkA	=> 	AxiBusIn.ACLK,
			ClkB	=> ClockBus.CLK250MHz
		);

	BUF_FSTWINDOWS : clkcrossing_buf
		generic map(
			NBITS => 32
		)
		port map(
			nrst	=>	AxiBusIn.ARESETN,
			DA		=>	TCReg(TC_FSTWINDOW_REG),
			QB		=> 	CtrlBus_OxMS.FSTWINDOW,
			ClkA	=> 	AxiBusIn.ACLK,
			ClkB	=> ClockBus.CLK250MHz
		);

	-- STATUS Register Update
    process(AxiBusIn.ACLK)
    variable tmp : std_logic_vector(31 downto 0) := (others => '0');
    begin
    	if (CtrlBus_IxMS.Busy = '1') then
    		tmp :=	tmp or C_BUSY_MASK;
    	else
    		tmp :=	tmp and (not C_BUSY_MASK);
    	end if;

    	if (CtrlBus_IxMS.PLL_Locked = '1') then
    		tmp :=	tmp or C_LOCKED_MASK;
    	else
    		tmp :=	tmp and (not C_LOCKED_MASK);
    	end if;


    	if (CtrlBus_IxMS.SSvalid = '1') then
    		tmp :=	tmp  or C_SSVALID_MASK;
    	else
    		tmp :=	tmp and (not C_SSVALID_MASK);
    	end if;

    	if (CtrlBus_IxMS.WindowBusy = '1') then
    		tmp :=	tmp  or C_WINDOWBUSY_MASK;
    	else
    		tmp :=	tmp and (not C_WINDOWBUSY_MASK);
    	end if;

		if startstorage_stm /= IDLE  then
			tmp :=	tmp  or C_STORAGE_MASK;
		else
			tmp :=	tmp and (not C_STORAGE_MASK);
		end if;

		if CtrlBus_IxMS.FIFOBusy = '1'  then
			tmp :=	tmp  or C_FIFOBusy_MASK;
		else
			tmp :=	tmp and (not C_FIFOBusy_MASK);
		end if;

    	STATUS_intl <= tmp;

    end process;


end arch_imp;
