library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Adder3BitsArray_tb is
end;

architecture bench of Adder3BitsArray_tb is

  component Adder3BitsArray
  	port
  	(
  		A	: in  std_logic_vector(2 downto 0);
  		B	: in  std_logic_vector(2 downto 0);
  		resultado	: out std_logic_vector(3 downto 0)
  	);
  end component;

  signal A: std_logic_vector(2 downto 0);
  signal B: std_logic_vector(2 downto 0);
  signal resultado: std_logic_vector(3 downto 0) ;

begin

  uut: Adder3BitsArray port map ( A         => A,
                                  B         => B,
                                  resultado => resultado );

  stimulus: process
  begin
  
	A <= "011"; -- 3 
	B <= "101"; -- 5
	-- resultado => 8
	wait for 20 ns;
	A <= "001"; -- 1
	B <= "010"; -- 2
	-- resultado => 3
	wait for 20 ns;
	A <= "111"; -- 7
	B <= "111"; -- 7
	-- resultado => 14
	wait for 20 ns;
	
    wait;
  end process;


end;
  