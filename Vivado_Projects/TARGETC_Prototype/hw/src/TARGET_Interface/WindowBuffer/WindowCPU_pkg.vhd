library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Package for the use
package WindowCPU_pkg is

    constant CMD_WR1_EN : 	std_logic_vector(2 downto 0) := "000";
	constant CMD_WR2_EN : 	std_logic_vector(2 downto 0) := "001";
	constant CMD_BOTH_EN : 	std_logic_vector(2 downto 0) := "010";
	constant CMD_WR1_EN_DIS : 	std_logic_vector(2 downto 0) := "011";
	constant CMD_WR2_EN_DIS : 	std_logic_vector(2 downto 0) := "100";
	constant CMD_WR1_MARKED : 	std_logic_vector(2 downto 0) := "101";
	constant CMD_WR2_MARKED : 	std_logic_vector(2 downto 0) := "110";
	constant CMD_BOTH_MARKED : 	std_logic_vector(2 downto 0) := "111";

	type Bus_t is array (0 to 15) of std_logic_vector(7 downto 0);
	type TrigInfoBus_t is array (integer range <>) of std_logic_vector(11 downto 0);

    type MODE_t is (EVEN, ODD);

    type t_triggerinformation is record
        trig :  std_logic_vector(3 downto 0);
        last :  std_logic_vector(3 downto 0);
        long :  std_logic_vector(3 downto 0);
    end record;
end WindowCPU_pkg;

package body WindowCPU_pkg is

end WindowCPU_pkg;
