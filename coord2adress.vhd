library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity coord2adress is 
generic(
    W : natural := 640;
    H : natural := 480;
    N : natural := 9
);
	port (
		clk :	    	in std_logic;
		rst :	    	in std_logic;
		req :           in std_logic;  
		x_in :   	    in std_logic_vector (N-1 downto 0);
        y_in :   	    in std_logic_vector (N-1 downto 0);
		dir_out : 		out std_logic_vector(18 DOWNTO 0)
	);
	end coord2adress;

architecture behavioral of coord2adress is

	signal x_p, y_p: std_logic_vector (9 downto 0);

begin
    process(clk, rst)
    begin
        if rst = '1' then
        elsif rising_edge(clk) then
            if req = '1' then
                x_p <= std_logic_vector(to_unsigned(to_integer(unsigned(x_in(N-1 downto N-7)))+W/2,10));
                y_p <= std_logic_vector(to_unsigned(to_integer(unsigned(y_in(N-1 downto N-7)))+H/2,10));
                dir_out <= std_logic_vector(to_unsigned(to_integer(unsigned(x_p))+to_integer(unsigned(y_p))*640, 19));
            end if;
        end if;
    end process;
end behavioral;