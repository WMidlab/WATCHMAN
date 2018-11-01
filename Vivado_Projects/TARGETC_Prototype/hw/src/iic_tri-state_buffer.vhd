library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity IIC_TriStateBuffer is

	port (

		SCL_i:			out	std_logic;
		SCL_o:			in 	std_logic;
		SCL_T:			in 	std_logic; 

		SDA_i:			out	std_logic;
		SDA_o:			in 	std_logic;
		SDA_T:			in 	std_logic; 
		
		SDA:			inout 	std_logic;
		SCL:			inout	std_logic;
		
		LDAC:			out std_logic
		
	);
end IIC_TriStateBuffer;

architecture arch_imp of IIC_TriStateBuffer is

	-- --------------------------------------------------------------------------------
	-- Component Declaration
	component iobuf is
	port (
		O	: out std_logic;                                -- Output (from buffer)
		IO	: inout std_logic;                              -- Port pin
		I	: in  std_logic;                                -- Inuput (to buffer)
		T	: in  std_logic);                               -- Tristate control
	end component iobuf;
	
begin
	
	IOBUF_SCL : iobuf
	port map(
		O	=> SCL_i,
		IO	=> SCL,
		I	=> SCL_o,
		T	=> SCL_T
	);
	
	IOBUF_SDA : iobuf
	port map(
		O	=> SDA_i,
		IO	=> SDA,
		I	=> SDA_o,
		T	=> SDA_T
	);
	
	LDAC <= '1';
	
end arch_imp;


