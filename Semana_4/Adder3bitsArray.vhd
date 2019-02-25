library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Adder3BitsArray is

	port
	(
		-- Input ports
		A	: in  std_logic_vector(2 downto 0);
		B	: in  std_logic_vector(2 downto 0);
		-- Output ports
		resultado	: out std_logic_vector(3 downto 0)
	);

end Adder3BitsArray;


architecture behavioral of Adder3BitsArray is

component FullAdder is
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
end component;

signal x1, x2: std_logic; 

begin
	
	sum_0: FullAdder port map (
		A => A(0),
		B => B(0),
		Cin => '0',
		Cout => x1,
		M => resultado(0)
	);
	
	sum_1: FullAdder port map (
		A => A(1),
		B => B(1),
		Cin => x1,
		Cout => x2,
		M => resultado(1)
	);
	
	sum_2: FullAdder port map (
		A => A(2),
		B => B(2),
		Cin => x2,
		Cout => resultado(3),
		M => resultado(2)
	);
	

end behavioral;