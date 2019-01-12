library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BRAM_TriplelPort is
    generic(
		ADDRESS : integer := 0
	);
    port(
        nrst : in std_logic;
        clk: in std_logic; --clock
        wr_en : in std_logic;   --write enable for port 0
        data_in : in std_logic_vector(15 downto 0);  --Input data to port 0.

        addr_in_0 : in std_logic_vector(7 downto 0);    --address for port 0
    --    addr_in_1 : in std_logic_vector(7 downto 0);    --address for port 1
        data_out_0 : out std_logic_vector(15 downto 0)  --output data from port 0.
    --    data_out_1 : out std_logic_vector(15 downto 0)   --output data from port 1.
    );
end BRAM_TriplelPort;

architecture Behavioral of BRAM_TriplelPort is

    --type and signal declaration for RAM.
    signal ram : std_logic_vector(15 downto 0) := (others => '0');

    attribute ram_style : string;
    attribute ram_style of ram : signal is "block";
begin

    process(clk)
    begin
            if(rising_edge(clk)) then
                --For port 0. Writing.
                if(wr_en = '1') then    --see if write enable is ON.
                    ram <= data_in;
                end if;

                if(addr_in_0 = std_logic_vector(to_unsigned(ADDRESS,addr_in_0'length))) then
                    data_out_0 <= ram;
                else
                    data_out_0 <= (others => 'Z');
                end if;
            end if;
    end process;

    --always read when port is enabled.
    -- data_out_0 <= ram when (addr_in_0 = std_logic_vector(to_unsigned(ADDRESS,addr_in_0'length))) else
    --             (others => 'Z');
    -- data_out_1 <= ram when (addr_in_1 = std_logic_vector(to_unsigned(ADDRESS,addr_in_1'length))) else
    --             (others => 'Z');

end Behavioral;
