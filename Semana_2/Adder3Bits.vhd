entity Adder3Bits is

	port
	(
		-- Input ports
		A0, A1, A2	: in  bit;
		B0, B1, B2	: in  bit;
		-- Output ports
		M0, M1, M2, M3	: out bit
	);

end Adder3Bits;


architecture behavioral of Adder3Bits is

component FullAdder is
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
end component;

signal x1, x2: bit; 

begin
	
	sum_0: FullAdder port map (
		A => A0,
		B => B0,
		Cin => '0',
		Cout => x1,
		M => M0
	);
	
	sum_1: FullAdder port map (
		A => A1,
		B => B1,
		Cin => x1,
		Cout => x2,
		M => M1
	);
	
	sum_2: FullAdder port map (
		A => A2,
		B => B2,
		Cin => x2,
		Cout => M3,
		M => M2
	);
	

end behavioral;