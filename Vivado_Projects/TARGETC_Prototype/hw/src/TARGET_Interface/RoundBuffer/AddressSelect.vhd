
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.TARGETC_pkg.all;
use work.WindowCPU_pkg.all;

entity AddressSelect is
	Port (
	nrst : in std_logic;
	clk:			in std_logic;
	CurAddr :		in std_logic_vector(7 downto 0);

	NextBus_In:		in Bus_t(255 downto 0);
	PrevBus_In:		in Bus_t(255 downto 0);

	NextAddr:		out std_logic_vector(7 downto 0);
	PrevAddr:		out std_logic_vector(7 downto 0)
	);

end AddressSelect;

architecture Behavioral of AddressSelect is
	component BRAM_TriplelPort is
	    generic(
			ADDRESS : integer := 0
		);
	    port(
			nrst : in std_logic;
	        clk: in std_logic; --clock
	        wr_en : in std_logic;   --write enable for port 0
	        data_in : in std_logic_vector(15 downto 0);  --Input data to port 0.

	        addr_in_0 : in std_logic_vector(7 downto 0);    --address for port 0
	     --   addr_in_1 : in std_logic_vector(7 downto 0);    --address for port 1
	        data_out_0 : out std_logic_vector(15 downto 0)  --output data from port 0.
	   --     data_out_1 : out std_logic_vector(15 downto 0)   --output data from port 1.
	    );
	end component BRAM_TriplelPort;


	signal data_intl : Bus16bit_t(255 downto 0);
	signal CurAddrNextPrev : std_logic_vector(15 downto 0);


begin

	GEN_BRAM : for I in 0 to 255 generate
		BRAM : BRAM_TriplelPort
		    generic map(
				ADDRESS => I
			)
		    port map(
				nrst => nrst,
		        clk		=> clk,
		        wr_en 	=> '1',  --write enable for port 0
		        data_in => data_intl(I),

		        addr_in_0 => CurAddr,
		   --     addr_in_1 => (others => '0'),
		        data_out_0 => CurAddrNextPrev  --output data from port 0.
		    --    data_out_1 => open
		    );

		data_intl(I) <=  NextBus_In(I) & PREVBus_In(I);
	end generate;

	NextAddr 	<= CurAddrNextPrev(15 downto 8);
	PrevAddr	<= CurAddrNextPrev(7 downto 0);

end Behavioral;
