library ieee;
use ieee.std_logic_1164.all;

entity tb_UART_Tx is
	generic (N : integer := 8;
		parity_flag : integer := 1;
		F_CPU : integer := 50000000;
		BaudRate : integer := 9600
				
		);
end tb_UART_Tx;

architecture tb of tb_UART_Tx is

    component UART_Tx
	generic (N : integer := 8;
		parity_flag : integer := 1;
		F_CPU : integer := 50000000;
		BaudRate : integer := 9600
				
	);
        port (Start_tx  : in std_logic;
              clk_50    : in std_logic;
              datos     : in std_logic_vector (n-1 downto 0);
              Salida_tx : out std_logic);
    end component;

    signal Start_tx  : std_logic;
    signal clk_50    : std_logic;
    signal datos     : std_logic_vector (n-1 downto 0);
    signal Salida_tx : std_logic := '0';

    constant TbPeriod : time := 20 ns; -- EDIT Put right period here
	constant tbPeriodoBR : integer := F_CPU/BaudRate;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : UART_Tx
	generic map(N,
		    parity_flag,
		    F_CPU,
		    BaudRate				
		)
    port map (Start_tx  => Start_tx,
              clk_50    => clk_50,
              datos     => datos,
              Salida_tx => Salida_tx);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk_50 is really your main clock signal
    clk_50 <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        Start_tx <= '1';
        datos <= "01011011";

        -- EDIT Add stimuli here
        wait for 11 * tbPeriodoBR * TbPeriod;
	
	Start_tx <= '0';
        datos <= "01010101";
	
	wait for tbPeriodoBR*TbPeriod;	
	
	Start_tx <= '1';
	 wait for 11 * 5200 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;
