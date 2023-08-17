library IEEE;
use IEEE.std_logic_1164.all;

entity uart_tb is
end;
	
architecture behavioral of uart_tb is

	constant N : natural := 16;
	signal tb_clk : std_logic := '0';
    signal tb_rst : std_logic;
	signal rxd_tb : std_logic;
	signal char_ready : std_logic;
	signal char : std_logic_vector(7 DOWNTO 0);
	signal tb_calc : std_logic;
	signal tb_cont : std_logic;
	signal tb_dir : std_logic;
	signal tb_angle : std_logic_vector(N-1 DOWNTO 0);

begin

	tb_rst <= '1', '0' after 15 ns;
    tb_clk <= not tb_clk after 10 ns; -- señal de 20 ns de periodo -> 50 MHz
	
	TEST:
    process is begin
    wait until tb_rst = '0';
    wait for 3 ns;
  
    rxd_tb <= '1';  -- IDLE
    wait for 8681 ns; -- Tiempo de un bit: 1/BAUD_RATE. En este caso BAUD_RATE = 115200 => 8680,555 => 8681 redondeando
    
    rxd_tb <= '0'; -- START
    wait for 8681 ns;
        
    -- Envio letra R
    rxd_tb <= '0';  --bit(0) de la R = "01010010", se envia de derecha a izquierda. Empezando por el LSB
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(1) de la R
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(2) de la R
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(3) de la R
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(4) de la R
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(5) de la R
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(6) de la R
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(7) de la R
    wait for 8681 ns;

    rxd_tb <= '1';   -- STOP
    wait for 8681 ns;

    rxd_tb <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio letra O

    rxd_tb <= '0';   -- START
    wait for 8681 ns;

    rxd_tb <= '1';  --bit(0) de la O = "01001111"
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(1) de la O
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(2) de la O
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(3) de la O
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(4) de la O
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(5) de la O
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(6) de la O
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(7) de la O
    wait for 8681 ns;

    rxd_tb <= '1';   -- STOP
    wait for 8681 ns;

    rxd_tb <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio letra T

    rxd_tb <= '0';   -- START
    wait for 8681 ns;

    rxd_tb <= '0';  --bit(0) de la T = "01010100"
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(1) de la T
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(2) de la T
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(3) de la T
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(4) de la T
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(5) de la T
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(6) de la T
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(7) de la T
    wait for 8681 ns;

    rxd_tb <= '1';   -- STOP
    wait for 8681 ns;

    rxd_tb <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio ESACIO

    rxd_tb <= '0';   -- START
    wait for 8681 ns;

    rxd_tb <= '0';  --bit(0) de ESPACIO = "00100000"
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(1) de ESPACIO
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(2) de ESPACIO
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(3) de ESPACIO
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(4) de ESPACIO
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(5) de ESPACIO
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(6) de ESPACIO
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(7) de ESPACIO
    wait for 8681 ns;

    rxd_tb <= '1';   -- STOP
    wait for 8681 ns;

    rxd_tb <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio letra A

    rxd_tb <= '0';   -- START
    wait for 8681 ns;

    rxd_tb <= '1';  --bit(0) de la A = "01000001"
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(1) de la A
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(2) de la A
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(3) de la A
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(4) de la A
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(5) de la A
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(6) de la A
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(7) de la A
    wait for 8681 ns;

    rxd_tb <= '1';   -- STOP
    wait for 8681 ns;

    rxd_tb <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio ESACIO

    rxd_tb <= '0';   -- START
    wait for 8681 ns;

    rxd_tb <= '0';  --bit(0) de ESPACIO = "00100000"
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(1) de ESPACIO
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(2) de ESPACIO
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(3) de ESPACIO
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(4) de ESPACIO
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(5) de ESPACIO
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(6) de ESPACIO
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(7) de ESPACIO
    wait for 8681 ns;

    rxd_tb <= '1';   -- STOP
    wait for 8681 ns;

    rxd_tb <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio numeros
    --4
    rxd_tb <= '0';   -- START
    wait for 8681 ns;

    rxd_tb <= '0';  --bit(0) de 4 = "00110100"
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(1) de 4
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(2) de 4
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(3) de 4
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(4) de 4
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(5) de 4
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(6) de 4
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(7) de 4
    wait for 8681 ns;

    rxd_tb <= '1';   -- STOP
    wait for 8681 ns;

    rxd_tb <= '1';   -- IDLE
    wait for 8681 ns;

    --5
    rxd_tb <= '0';   -- START
    wait for 8681 ns;

    rxd_tb <= '1';  --bit(0) de 5 = "00110101"
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(1) de 5
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(2) de 5
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(3) de 5
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(4) de 5
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(5) de 5
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(6) de 5
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(7) de 5
    wait for 8681 ns;

    rxd_tb <= '1';   -- STOP
    wait for 8681 ns;

    rxd_tb <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio ENTER (Carriage Return)

    rxd_tb <= '0';   -- START
    wait for 8681 ns;

    rxd_tb <= '1';  --bit(0) de ENTER = "00001101"
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(1) de ENTER
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(2) de ENTER
    wait for 8681 ns;
    
    rxd_tb <= '1';  --bit(3) de ENTER
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(4) de ENTER
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(5) de ENTER
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(6) de ENTER
    wait for 8681 ns;
    
    rxd_tb <= '0';  --bit(7) de ENTER
    wait for 8681 ns;
    
   rxd_tb <= '1'; -- STOP
   wait for 8681 ns;
   
   rxd_tb <= '1'; -- IDLE
   wait for 8681 ns;
   
   wait for 10000 ns;
   
    end process TEST;

	U0: entity work.uart_ctrl
		generic map(
			BAUD_RATE => 115200,
			CLOCK_RATE => 50E6
		)
		port map(
			clk_pin => tb_clk,  	-- Clock input (from pin)
			rst_pin => tb_rst,  	-- Active HIGH reset (from pin)
			rxd_pin => rxd_tb,  	-- RS232 RXD pin - directly from pin
			rx_data_rdy => char_ready,
			rx_data => char	-- 8 LED outputs
		);

	U_FSM: entity work.uartFSM
		generic map(
			N => N 
		)
		port map(
			clk => tb_clk,
			rst => tb_rst,
			char_ready => char_ready,
			char => char,
			calc => tb_calc,
			cont => tb_cont,
			dir => tb_dir,
			angle => tb_angle,
			angle_changed => open
		);
end;
