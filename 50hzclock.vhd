library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity slowclock is 
	port (
		clk :	    	in std_logic;
		rst :	    	in std_logic;
		clk50hz : 		out std_logic
	);
	end slowclock;

architecture behavioral of slowclock is

    constant count_50hz : natural := 1000; -- divisor para disminuir la frecuencia 50Mhz/ 50hz = 1000000
    signal count: unsigned(20 downto 0) :=  (others => '0'); 

begin
    process(clk, rst)
    begin
        if rst = '1' then
            count <= (others => '0');
            clk50hz <= '1';
        elsif rising_edge(clk) then
            if count = count_50hz then
                count <= (others => '0');
                clk50hz <= '1';
            else 
                count <= count + 1;
                clk50hz <= '0';
            end if;
        end if;
    end process;
end behavioral;