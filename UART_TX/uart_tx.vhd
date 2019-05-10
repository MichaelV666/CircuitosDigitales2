library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity UART_Tx is
	generic (N : integer := 8;
				parity_flag : integer := 0;
				F_CPU : integer := 50000000;
				BaudRate : integer := 9600
				
	);
	port
	(
		-- Input ports
		Start_tx	: in  std_logic := '0';
		clk_50	: in  std_logic;
		datos	: in  std_logic_vector(N-1 downto 0);

		-- Output ports
		Salida_tx	: out std_logic

	);

end UART_Tx;


architecture behavioral of UART_Tx is

signal counter : integer range 0 to F_CPU/BaudRate := 0;
signal bit_index : integer range 0 to 8 := 0;
signal clk_BaudRate : std_logic := '0';
signal parity_calc : std_logic := '0';
signal flag_start_tx : std_logic := '0';
constant max_cycles : integer := F_CPU/BaudRate;
constant half_cycle : integer := max_cycles/2;

type states is (IDLE, DATA, PARITY, STOP);

signal tx_state : states := IDLE;

begin
	clk_gen: process(clk_50)
	begin
		if (clk_50'event) and (clk_50 = '1') then
			if (counter < half_cycle) then
				clk_BaudRate <= '0';
			else
				clk_BaudRate <= '1';
			end if;
			
			if (counter < max_cycles) then
				counter <= counter + 1;
			else
				counter <= 0;
			end if;
		end if;
	end process clk_gen;
	
	tx_process: process(clk_BaudRate)
	begin
		if(rising_edge(clk_BaudRate)) then
			case tx_state is
	 		  when IDLE =>
							if(start_tx = '1') then
								Salida_tx <= '0';
								tx_state <= DATA;
								
							else 
								Salida_tx <= '1';
							end if;
			  when DATA =>
							Salida_tx <= datos(bit_index);
							
							
							if (bit_index < N - 1) then
								bit_index <= bit_index + 1;
							elsif (parity_flag = 0) then
								bit_index <= 0;
								tx_state <= STOP;
							else 
								bit_index <= 0;
								tx_state <= PARITY;
							end if;
							
			  when PARITY =>
							Salida_tx <= datos(0) XOR datos(1) XOR datos(2) XOR datos(3) XOR datos(4) XOR datos(5) XOR datos(6) XOR datos(7);
							tx_state <= STOP;
			  when STOP =>
							Salida_tx <= '1';
							if(start_tx = '1') then
								tx_state <= STOP;
							else 
								tx_state <= IDLE;
							end if;
			end case;
		end if;
	end process tx_process;
	
end behavioral;