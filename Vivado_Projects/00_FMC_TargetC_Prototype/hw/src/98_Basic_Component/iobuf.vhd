-- -----------------------------------------------------------
--!@FILE: 	iobuf.vhd
--!@AUTHOR: Jonathan Hendriks
--!@DATE: 	24th of January 2019
-- -----------------------------------------------------------
--!@DESCRIPTION:
--! Input/Ouptut Buffer using Tristate for I2C
-- -----------------------------------------------------------

-- Librairies
library ieee;
use ieee.std_logic_1164.all;
library unisim;
use unisim.vcomponents.all;

-- Entity
entity iobuf is
port (
    O   : out std_logic;    -- Output (from buffer)
    IO  : inout std_logic;  -- Port pin
    I   : in  std_logic;    -- Inuput (to buffer)
    T   : in  std_logic);   -- Tristate control
end iobuf;

-- Architecture
architecture behavioral of iobuf is
begin

-- Xilinx Primitive for Output Buffer
OBUFT_inst : OBUFT
    port map (
                O => IO, -- Buffer output (connect directly to top-level port)
                I => I, -- Buffer input
                T => T -- 3-state enable input
            );

-- Xilinx Primitive for Input Buffer
IBUF_inst : IBUF
    port map (
                O => O, -- Buffer output
                I => IO -- Buffer input (connect directly to top-level port)
            );

end architecture;
