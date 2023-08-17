library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity cordicFSM is
    generic(
        N: natural := 16
    );
    port (
          clk :	in std_logic;
          clk50hz :	in std_logic;
          rst :	in std_logic;
          enable: in std_logic;
          cont: in std_logic; -- si es rotacion continua es 1 si no 0
          dir: in std_logic;  -- si es continua la rotacion si es en sentido horario es 1 si no 0
          angle : in std_logic_vector(N-1 downto 0);
          angle_changed : in std_logic;
          x_i : in std_logic_vector(N-1 downto 0);
          y_i : in std_logic_vector(N-1 downto 0);
          x_o : out std_logic_vector(N-1 downto 0);
          y_o : out std_logic_vector(N-1 downto 0);
          z_o : out std_logic_vector(N-1 downto 0)    
    );
end cordicFSM;

architecture behavioral of cordicFSM is

    type T_STATE is
        (IDLE, ROTCH, ROTCA, ROTA);

    signal state: T_STATE;
    signal x_reg, y_reg, z_reg: std_logic_vector(N-1 downto 0);
    signal step : std_logic_vector(N-1 downto 0) := "0000000010000000";
    signal angle_done : std_logic := '0';

    begin
        
    x_o <= x_reg;
    y_o <= y_reg;
    z_o <= z_reg;
    
    process(clk50hz,rst)
    begin
        if rst='1' then
            x_reg <= "0100000000000000";
        elsif clk50hz = '1' and clk50hz'event then
            C1: case state is
                when IDLE =>
                    x_reg <= "0100000000000000";
                    y_reg <= (others => '0');
                    z_reg <= (others => '0');
                    angle_done <= '0';
                when ROTCH =>
                    x_reg <= x_i;
                    y_reg <= y_i;
                    z_reg <= step;
                when ROTCA =>
                    x_reg <= x_i;
                    y_reg <= y_i;
                    z_reg <= std_logic_vector(-signed(step));
                when ROTA =>
                    if angle_done = '0' then
                    x_reg <= x_i;
                    y_reg <= y_i;
                    z_reg <= std_logic_vector(to_unsigned(to_integer(unsigned(angle))*to_integer(unsigned(step)),N));
                    angle_done <= '1';
                    end if;
            end case C1;
        end if;
    end process;
    process(clk, rst)
    begin
        if rst = '1' then
        state <= IDLE;
        elsif rising_edge(clk) then
            if enable = '0'  then
                state <= IDLE;
            elsif cont = '1' then
                if dir = '1' then
                    state <= ROTCH;
                else
                    state <= ROTCA;
                end if;
            else
                state <= ROTA;
            end if;
        end if;
    end process;
end behavioral;