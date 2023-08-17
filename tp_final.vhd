library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tp_final is
    generic(
        N: natural := 16
    );
    port (
		clk :	    	in std_logic;
		rst :	    	in std_logic;
		rx :   	        in std_logic;
        pixel_x :       out std_logic_vector(N-1 DOWNTO 0);
        pixel_y :       out std_logic_vector(N-1 DOWNTO 0)
	);

	end tp_final;

architecture behavioral of tp_final is

	signal tb_rgb : std_logic_vector(2 downto 0);
	signal hsync_test_aux: std_logic;
	signal vsync_test_aux: std_logic;
	signal data_in : std_logic_vector (0 DOWNTO 0) := "1";
	signal dir_w : std_logic_vector(18 DOWNTO 0) := (others => '0');
	signal x_p : std_logic_vector(N-1 DOWNTO 0);
	signal y_p : std_logic_vector(N-1 DOWNTO 0);
	signal x_i : std_logic_vector(N-1 DOWNTO 0);
	signal y_i,z_i : std_logic_vector(N-1 DOWNTO 0);
	signal vector_ready : std_logic;
	signal tb_slowclock : std_logic;
	signal char_ready : std_logic;
	signal char : std_logic_vector(7 DOWNTO 0);
	signal tb_calc : std_logic;
	signal tb_cont : std_logic;
	signal tb_dir : std_logic;
	signal tb_angle : std_logic_vector(N-1 DOWNTO 0);
	signal tb_angle_changed : std_logic;
begin

    pixel_x <= x_p;
    pixel_y <= y_p;
	
	ram_vga: entity work.ram_vga_ctrl
    port map(
        clk 	=> clk,
        rst 	=> rst,
        hsync 	=> hsync_test_aux,
        vsync 	=> vsync_test_aux,
        rgb     => tb_rgb,
        data_in => data_in,
        dir_w   => dir_w
    );
	
	adress_gen: entity work.coord2adress
	generic map(
        N => N 
    )
	port map(
		clk 	=> clk,
		rst 	=> rst,
		req     => vector_ready,
		x_in 	=> x_p,
		y_in 	=> y_p,
		dir_out => dir_w
	);

    slowclock: entity work.slowclock
	port map(
		clk 	=> clk,
		rst 	=> rst,
		clk50hz => tb_slowclock  

	);
	
	cordic: entity work.fullcordic
    generic map(
        N => N 
    )
    port map(
        clk => clk,
        rst => rst,
        req => tb_slowclock,
        ack => vector_ready,
        rot0_vec1 => '0',
        x_0 => x_i,
        y_0 => y_i,
        z_0 => z_i,
        x_nm1 => x_p,
        y_nm1 => y_p,
        z_nm1 => open    
    );

    C_FSM: entity work.cordicFSM
    generic map(
        N => N 
    )
    port map(
        clk => clk,
        clk50hz => tb_slowclock,
        rst => rst,
        enable => tb_calc,
        cont => tb_cont,
        dir => tb_dir,
        angle => tb_angle,
        angle_changed => tb_angle_changed,
        x_i => x_p,
        y_i => y_p,
        x_o => x_i,
        y_o => y_i,
        z_o => z_i    
    );
    
	Uart: entity work.uart_ctrl
		generic map(
			BAUD_RATE => 115200,
			CLOCK_RATE => 50E6
		)
		port map(
			clk_pin => clk,  	-- Clock input (from pin)
			rst_pin => rst,  	-- Active HIGH reset (from pin)
			rxd_pin => rx,  	-- RS232 RXD pin - directly from pin
			rx_data_rdy => char_ready,
			rx_data => char	-- 8 LED outputs
		);

	U_FSM: entity work.uartFSM
		generic map(
			N => N 
		)
		port map(
			clk => clk,
			rst => rst,
			char_ready => char_ready,
			char => char,
			calc => tb_calc,
			cont => tb_cont,
			dir => tb_dir,
			angle => tb_angle,
			angle_changed => tb_angle_changed
		);
	
end behavioral;