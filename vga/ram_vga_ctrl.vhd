library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram_vga_ctrl is
	port (
		clk :	    	in std_logic;
		rst :	    	in std_logic;
		data_in :   	in std_logic_vector (0 downto 0);
		dir_w : 		in std_logic_vector(18 DOWNTO 0);
		hsync , vsync : out std_logic;
		rgb	: 			out std_logic_vector(2 DOWNTO 0)
	);
	end ram_vga_ctrl;

architecture behavioral of ram_vga_ctrl is
	
	signal sw: std_logic_vector (2 downto 0) := "111";
	signal dir_r: std_logic_vector (18 downto 0);
	signal data_out: std_logic_vector (0 downto 0);
	signal pixel_x, pixel_y: std_logic_vector (9 downto 0);
	

begin

	-- instanciacion del controlador VGA
	vga_sync_unit: entity work.vga_sync
		port map(
			clk 	=> clk,
			rst 	=> rst,
			hsync 	=> hsync,
			vsync 	=> vsync,
			vidon	=> open,
			p_tick 	=> open,
			pixel_x => pixel_x,
			pixel_y => pixel_y
		);

	ram: entity work.ram_ctrl
		port map(
			clk      	=> clk,
			rst 	    => rst,
			data_in		=> data_in,
			dir_w		=> dir_w,
			ready		=> open,
			dir_r		=> dir_r,
			data_out	=> data_out
		);

		dir_r <= std_logic_vector(to_unsigned(to_integer(unsigned(pixel_x))+to_integer(unsigned(pixel_y))*640, 19));
		rgb <= sw when data_out = "1" else 
			"000";
	
end behavioral;