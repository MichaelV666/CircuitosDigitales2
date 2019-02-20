entity BCD_16 is
	port
	(
		-- Input ports
		-- D es el bit menos significativo
		-- A es el bit mas significativo
		A,B,C,D	: in  BIT;
		
		--Output ports
		LED0, LED1, LED2, LED3, LED4, LED5, LED6	: out BIT
	);

end BCD_16;


architecture behavioral of BCD_16 is

begin

	LED0 <= (A and not B and not C) or -- AB'C'
		(not A and B and D) or -- A'BD
		(not B and not D) or --B'D'
		(not A and C) or --A'C
		(A and not D) or --AD' 
		(B and C); --BC

	LED1 <= (not A and not C and not D) or --A'C'D'
		(not A and C and D) or -- A'CD  
		(A and not C and D) or --AC'D  
		(not B and not C) or --B'C'
		(not B and not D);--B'D'

	LED2 <= (not B and not C) or --B'C'
		(not B and D) or --B'D
		(not C and  D) or --C'D
		(not A and B) or --A'B
		(A and not B);--AB'

	LED3 <= (not A and not B and not D) or -- A'B'D'
		(not B and C and D) or --B'CD
		(B and not C and D)or --BC'D
		(B and C and not D) or --BCD'
		(A and not C) or--AC'
		(A AND B); -- AB

	LED4 <= (not B and not D) or --B'D'
		(C and not D) or --CD'
		(A and C) or --AC
		(A and B) ;--AB

	LED5 <= (not A and B and not C) or --A'BC'
		(not C and not D) or --C'D'
		(B and not D) or --BD'
		(A and not B) or --AB'
		(A and C);--AC

	LED6 <= (not A and B and not C) or --A'BC'
		(not B and  C) or --B'C
		(C and not D) or --CD'
		(A and not B) or --AB'
		(A and D);--AD

end behavioral;