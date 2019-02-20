library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FullAdder is

	port
	(
		-- Input ports
		A	: in  std_logic;
		B	: in  std_logic;
		Cin	: in  std_logic;

		-- Output ports
		Cout	: out std_logic;
		M	: out std_logic

	);

end FullAdder;


architecture behavioral of FullAdder is

signal x1, x2, x3 : std_logic; 

begin

	x1 <= A XOR B;
	x2 <= A AND B;
	x3 <= x1 AND Cin;
	M  <= x1 XOR Cin;
	Cout <= x2 OR X3;
	

end behavioral;