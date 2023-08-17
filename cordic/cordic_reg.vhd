library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity cordic_reg is
    generic(
        N : natural := 16; -- cantidad de iteraciones que va a hacer el algoritmo
        CLOG2N : natural := 4 -- cantidad de iteraciones que va a hacer el algoritmo
    );
    port(
        clk: in std_logic;
        rst: in std_logic;
        num_iter : in unsigned(CLOG2N-1 downto 0);
        rot0_vec1: in std_logic;
        x_i : in std_logic_vector(N-1 downto 0);
        y_i : in std_logic_vector(N-1 downto 0);
        z_i : in std_logic_vector(N-1 downto 0);
        x_ip1 : out std_logic_vector(N-1 downto 0);
        y_ip1 : out std_logic_vector(N-1 downto 0);
        z_ip1 : out std_logic_vector(N-1 downto 0)     
    );
end cordic_reg;

architecture behavioral of cordic_reg is

    signal x_reg,y_reg,z_reg : std_logic_vector(N-1 downto 0);
    signal atan_2mi:  std_logic_vector(N-3 downto 0);
    signal ack_aux : std_logic;

begin
    ROM: entity work.atan_rom(behavioral)
        generic map(
            ADD_W  => CLOG2N,
            DATA_W => N-2
        )
        port map(
            addr_i => std_logic_vector(num_iter),
            data_o => atan_2mi
        );

    CORDIC_BASE: entity work.cordic_base(behavioral)
    generic map(
        N => N, 
        CLOG2N => CLOG2N
    )
    port map(
        num_iter => num_iter,
        rot0_vec1 => rot0_vec1,
        x_i => x_i,
        y_i => y_i,
        z_i => z_i,
        atan_2mi => atan_2mi,
        x_ip1 => x_reg,
        y_ip1 => y_reg,
        z_ip1 => z_reg      
    );

    process(clk,rst)
    begin
        if rst = '1' then
            x_ip1 <= (others => '0');
            y_ip1 <= (others => '0');
            z_ip1 <= (others => '0');
        elsif clk'event and clk = '1' then
            x_ip1 <= x_reg;
            y_ip1 <= y_reg;
            z_ip1 <= z_reg;     
        end if;
    end process;
end behavioral;
