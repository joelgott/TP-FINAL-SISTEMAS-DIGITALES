library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity fullcordic is
    generic(
        N : natural := 16
    );
    port(
        clk: in std_logic;
        rst: in std_logic;
        req: in std_logic;
        ack: out std_logic;
        rot0_vec1: in std_logic;
        x_0 : in std_logic_vector(N-1 downto 0);
        y_0 : in std_logic_vector(N-1 downto 0);
        z_0 : in std_logic_vector(N-1 downto 0);
        x_nm1 : out std_logic_vector(N-1 downto 0);
        y_nm1 : out std_logic_vector(N-1 downto 0);
        z_nm1 : out std_logic_vector(N-1 downto 0)   
    );
end fullcordic;


architecture behavioral of fullcordic is

    signal x_i_precordic, y_i_precordic, z_i_precordic : std_logic_vector(N-1 downto 0);
    signal x_o_precordic, y_o_precordic, z_o_precordic : std_logic_vector(N-1 downto 0);
    signal x_o_midcordic, y_o_midcordic : std_logic_vector(N-1 downto 0);
    signal ack_aux : std_logic;
       

begin
    
    x_i_precordic <= x_0;
    y_i_precordic <= y_0;
    z_i_precordic <= z_0;
    ack <= ack_aux;
    
    PRECORDIC: entity work.precordic(behavioral)
    generic map(N => N)
    port map(
        rot0_vec1 => rot0_vec1,
        x_i => x_i_precordic,
        y_i => y_i_precordic,
        z_i => z_i_precordic,
        x_o => x_o_precordic,
        y_o => y_o_precordic,
        z_o => z_o_precordic
    );
    
    MIDCORDIC: entity work.midcordic(iter)    -- aca se cambia si se quiere el iterativo o desarrollado
    generic map(N => N)
    port map(
        clk       => clk,
        rst       => rst,
        req       => req,
        ack       => ack_aux,
        rot0_vec1 => rot0_vec1,
        x_0       => x_o_precordic,
        y_0       => y_o_precordic,
        z_0       => z_o_precordic,
        x_nm1     => x_o_midcordic,
        y_nm1     => y_o_midcordic,
        z_nm1     => z_nm1
    );

    POSTCORDIC: entity work.postcordic(behavioral)    
    generic map(N => N)
    port map(
        x_i     => x_o_midcordic,
        y_i     => y_o_midcordic,
        x_o     => x_nm1,
        y_o     => y_nm1
    );
    
end behavioral;
