library IEEE;
use IEEE.std_logic_1164.all;

entity tp_tb is
end;
	
architecture behavioral of tp_tb is

	constant N : natural := 16;
	signal tb_clk : std_logic := '0';
    signal tb_rst : std_logic;
	signal tb_rx : std_logic;
    signal px: std_logic_vector(N-1 DOWNTO 0);
    signal py: std_logic_vector(N-1 DOWNTO 0);

begin

	tb_rst <= '0' ,'1' after 50 ns, '0' after 100 ns;
    tb_clk <= not tb_clk after 10 ns; -- señal de 20 ns de periodo -> 50 MHz
	
	TEST:
    process is begin
    wait until tb_rst = '0';
    wait for 3 ns;
  
    tb_rx <= '1';  -- IDLE
    wait for 8681 ns; -- Tiempo de un bit: 1/BAUD_RATE. En este caso BAUD_RATE = 115200 => 8680,555 => 8681 redondeando
    
    tb_rx <= '0'; -- START
    wait for 8681 ns;
        
    -- Envio letra R
    tb_rx <= '0';  --bit(0) de la R = "01010010", se envia de derecha a izquierda. Empezando por el LSB
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(1) de la R
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(2) de la R
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de la R
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(4) de la R
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de la R
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(6) de la R
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de la R
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio letra O

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '1';  --bit(0) de la O = "01001111"
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(1) de la O
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(2) de la O
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(3) de la O
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de la O
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de la O
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(6) de la O
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de la O
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio letra T

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '0';  --bit(0) de la T = "01010100"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de la T
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(2) de la T
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de la T
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(4) de la T
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de la T
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(6) de la T
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de la T
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio ESPACIO

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '0';  --bit(0) de ESPACIO = "00100000"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(2) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(5) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(6) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de ESPACIO
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio letra A

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '1';  --bit(0) de la A = "01000001"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de la A
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(2) de la A
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de la A
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de la A
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de la A
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(6) de la A
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de la A
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio ESPACIO

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '0';  --bit(0) de ESPACIO = "00100000"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(2) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(5) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(6) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de ESPACIO
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio numeros
    --6
    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '0';  --bit(0) de 6 = "00110110"
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(1) de 6
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(2) de 6
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de 6
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(4) de 6
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(5) de 6
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(6) de 6
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de 6
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;

    --4
    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '0';  --bit(0) de 4 = "00110100"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de 4
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(2) de 4
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de 4
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(4) de 4
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(5) de 4
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(6) de 4
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de 4
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio ENTER (Carriage Return)

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '1';  --bit(0) de ENTER = "00001101"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(2) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(3) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(6) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '1'; -- STOP
    wait for 8681 ns;
    
    tb_rx <= '1'; -- IDLE
    wait for 8681 ns;
    
    wait for 10000 us;
   
    -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tb_rx <= '1';  -- IDLE
    wait for 8681 ns; 
    
    tb_rx <= '0'; -- START
    wait for 8681 ns;
        
    -- Envio letra R
    tb_rx <= '0';  --bit(0) de la R = "01010010"
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(1) de la R
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(2) de la R
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de la R
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(4) de la R
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de la R
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(6) de la R
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de la R
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio letra O

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '1';  --bit(0) de la O = "01001111"
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(1) de la O
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(2) de la O
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(3) de la O
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de la O
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de la O
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(6) de la O
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de la O
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio letra T

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '0';  --bit(0) de la T = "01010100"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de la T
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(2) de la T
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de la T
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(4) de la T
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de la T
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(6) de la T
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de la T
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio ESPACIO

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '0';  --bit(0) de ESPACIO = "00100000"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(2) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(5) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(6) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de ESPACIO
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio letra C

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '1';  --bit(0) de la C = "01000011"
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(1) de la C
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(2) de la C
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de la C
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de la C
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de la C
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(6) de la C
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de la C
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio ESPACIO

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '0';  --bit(0) de ESPACIO = "00100000"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(2) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(5) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(6) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de ESPACIO
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio letra H
    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '0';  --bit(0) de H = "01001000"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de H
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(2) de H
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(3) de H
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de H
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de H
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(6) de H
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de H
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio ENTER (Carriage Return)

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '1';  --bit(0) de ENTER = "00001101"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(2) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(3) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(6) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '1'; -- STOP
    wait for 8681 ns;
    
    tb_rx <= '1'; -- IDLE
    wait for 8681 ns;


    wait for 10000 us;
   
    -- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tb_rx <= '1';  -- IDLE
    wait for 8681 ns; 
    
    tb_rx <= '0'; -- START
    wait for 8681 ns;
        
    -- Envio letra R
    tb_rx <= '0';  --bit(0) de la R = "01010010"
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(1) de la R
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(2) de la R
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de la R
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(4) de la R
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de la R
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(6) de la R
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de la R
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio letra O

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '1';  --bit(0) de la O = "01001111"
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(1) de la O
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(2) de la O
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(3) de la O
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de la O
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de la O
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(6) de la O
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de la O
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio letra T

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '0';  --bit(0) de la T = "01010100"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de la T
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(2) de la T
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de la T
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(4) de la T
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de la T
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(6) de la T
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de la T
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio ESPACIO

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '0';  --bit(0) de ESPACIO = "00100000"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(2) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(5) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(6) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de ESPACIO
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio letra C

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '1';  --bit(0) de la C = "01000011"
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(1) de la C
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(2) de la C
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de la C
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de la C
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de la C
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(6) de la C
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de la C
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio ESPACIO

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '0';  --bit(0) de ESPACIO = "00100000"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(2) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(5) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(6) de ESPACIO
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de ESPACIO
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio letra A

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '1';  --bit(0) de la A = "01000001"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de la A
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(2) de la A
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(3) de la A
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de la A
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de la A
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(6) de la A
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de la A
    wait for 8681 ns;

    tb_rx <= '1';   -- STOP
    wait for 8681 ns;

    tb_rx <= '1';   -- IDLE
    wait for 8681 ns;
    
    -- Envio ENTER (Carriage Return)

    tb_rx <= '0';   -- START
    wait for 8681 ns;

    tb_rx <= '1';  --bit(0) de ENTER = "00001101"
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(1) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(2) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '1';  --bit(3) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(4) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(5) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(6) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '0';  --bit(7) de ENTER
    wait for 8681 ns;
    
    tb_rx <= '1'; -- STOP
    wait for 8681 ns;
    
    tb_rx <= '1'; -- IDLE
    wait for 8681 ns;

    end process TEST;

	DUT: entity work.tp_final
		generic map(
			N => 16
		)
		port map(
			clk => tb_clk,  
			rst => tb_rst,  	
			rx => tb_rx,  	
			pixel_x => px,
			pixel_y => py	
		);
end;
