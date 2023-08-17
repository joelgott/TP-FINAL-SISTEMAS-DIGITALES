library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity precordic is
generic(
    N : natural := 16 
);
port(
    rot0_vec1: in std_logic;
    x_i : in std_logic_vector(N-1 downto 0);
    y_i : in std_logic_vector(N-1 downto 0);
    z_i : in std_logic_vector(N-1 downto 0);
    x_o : out std_logic_vector(N-1 downto 0);
    y_o : out std_logic_vector(N-1 downto 0);
    z_o : out std_logic_vector(N-1 downto 0)      
);
end precordic;

architecture behavioral of precordic is

constant ang_180 : signed := to_signed(2**(N-1), N);
constant ang_90 : signed := to_signed(2**(N-2), N);
constant ang_neg_90 : signed := to_signed(-2**(N-2), N);
constant ang_45 : signed := to_signed(2**(N-3), N);
    
signal mode : std_logic;
        

begin  

    mode <= rot0_vec1;
        
    x_o <= std_logic_vector(signed(not(x_i))+1) when (abs(signed(z_i)) > abs(ang_90) and (mode = '0')) else
           x_i;
        
    y_o <= std_logic_vector(signed(not(y_i))+1) when (abs(signed(z_i)) > abs(ang_90) and (mode = '0')) else
           y_i;
               
    z_o <= std_logic_vector(signed(z_i) - ang_180) when (signed(z_i) > ang_90 and (mode = '0')) else
           std_logic_vector(signed(z_i) + ang_180) when (signed(z_i) < ang_neg_90 and (mode = '0')) else
           z_i;

end behavioral;