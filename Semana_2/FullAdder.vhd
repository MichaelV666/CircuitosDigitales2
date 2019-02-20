entity FullAdder is

	port
	(
		-- Input ports
		A	: in  bit;
		B	: in  bit;
		Cin	: in  bit;

		-- Output ports
		Cout	: out bit;
		M	: out bit

	);

end FullAdder;


architecture behavioral of FullAdder is

signal x1, x2, x3 : bit; 

begin

	x1 <= A XOR B;
	x2 <= A AND B;
	x3 <= x1 AND Cin;
	M  <= x1 XOR Cin;
	Cout <= x2 OR X3;
	

end behavioral;