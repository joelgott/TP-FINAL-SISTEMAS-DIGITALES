library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity postcordic is
generic(
    N : natural := 16 
);
port(
    x_i : in std_logic_vector(N-1 downto 0);
    y_i : in std_logic_vector(N-1 downto 0);
    x_o : out std_logic_vector(N-1 downto 0);
    y_o : out std_logic_vector(N-1 downto 0)    
);
end postcordic;

architecture behavioral of postcordic is   

    signal x_i_aux, y_i_aux: std_logic_vector(N-1 downto 0);
    signal x_o_mul, x_o_shifted: std_logic_vector(N+10 downto 0);
    signal y_o_mul, y_o_shifted: std_logic_vector(N+10 downto 0);
   
begin  

    x_i_aux <= x_i;
    y_i_aux <= y_i;

    x_o_mul <= std_logic_vector(to_unsigned(to_integer(signed(x_i_aux))*1243,27));
    y_o_mul <= std_logic_vector(to_unsigned(to_integer(signed(y_i_aux))*1243,27));

    x_o_shifted <= std_logic_vector(shift_right(signed(x_o_mul),11));
    y_o_shifted <= std_logic_vector(shift_right(signed(y_o_mul),11));
   
    x_o <= x_o_shifted(N-1 downto 0);
    y_o <= y_o_shifted(N-1 downto 0);
               
end behavioral;