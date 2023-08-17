library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_fixed is
    generic(
        WORD_SIZE : natural := 16
    );
    port(
        add0_sub1 : in std_logic;
        x : in std_logic_vector(WORD_SIZE-1 downto 0);
        y : in std_logic_vector(WORD_SIZE-1 downto 0);
        z : out std_logic_vector(WORD_SIZE-1 downto 0)
    );
end adder_fixed;

architecture behavioral of adder_fixed is
    signal x_value,y_value : signed(WORD_SIZE-1 downto 0);
    signal result : signed(WORD_SIZE-1 downto 0);

begin
    x_value <= signed(x);
    y_value <= signed(y);

    result <= x_value + y_value when add0_sub1 = '0' else
              x_value - y_value;

    z <= std_logic_vector(result);

end behavioral; 