library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity uartFSM is
    generic(
        N: natural := 16
    );
    port (
          clk :	in std_logic;
          rst :	in std_logic;
          char_ready : in std_logic;
          char: in std_logic_vector(7 downto 0);
          calc: out std_logic;
          cont: out std_logic; -- si es rotacion continua es 1 si no 0
          dir: out std_logic;  -- si es continua la rotacion si es en sentido horario es 1 si no 0
          angle : out std_logic_vector(N-1 downto 0);
          angle_changed: out std_logic
    );
end uartFSM;

architecture behavioral of uartFSM is

    type T_STATE is
        (START, R, O, T, SPACE_1, MODE, SPACE_2, DIRE, ANGLESIGN, ANGLE_1, ANGLE_2,ERR);

    signal state: T_STATE := START;
    signal angle_aux: std_logic_vector(N-1 downto 0);
    signal cont_aux : std_logic;
    signal anglesig : std_logic;
    signal firstdigit: unsigned(7 downto 0);
    signal seconddigit: unsigned(7 downto 0);

    begin
        
    process(char_ready,rst)
    begin
        if rst='1' then
            calc <= '0';
            cont <= '0';
            dir <= '0';
            angle <= (others => '0');
            angle_changed <= '0';
        elsif char_ready = '1' and char_ready'event then
            C1: case state is
                when START =>
                if char = "01010010" then
                    state <= R;
                else
                    state <= ERR; 
                end if;
                angle_changed <= '0';
                when R =>
                if char = "01001111" then
                    state <= O;
                else
                    state <= ERR; 
                end if;
                when O =>
                if char = "01010100" then
                    state <= T;
                else
                    state <= ERR; 
                end if;
                when T =>
                if char = "00100000" then
                    state <= SPACE_1;
                else 
                    state <= ERR;                
                end if;
                when SPACE_1 =>
                if char = "01000001" then
                    cont <= '0';
                    cont_aux <= '0';
                    state <= MODE;
                elsif char = "01000011" then
                    cont <= '1';
                    cont_aux <= '1';
                    state <= MODE; 
                else
                    state <= ERR;      
                end if;
                when MODE =>
                if char = "00100000" then
                    state <= SPACE_2;
                else
                    state <= ERR;     
                end if;
                when SPACE_2 =>
                if cont_aux = '0' then
                    if char = "00101101" then
                        state <= ANGLESIGN;
                        anglesig <= '1';
                    elsif unsigned(char) >= to_unsigned(48, 8) and unsigned(char) <= to_unsigned(57, 8) then
                        firstdigit <= unsigned(char) - to_unsigned(48, 8);
                        state <= ANGLE_1;
                        anglesig <= '0';
                        
                    else
                        state <= ERR;
                    end if;
                else
                    if char = "01001000" then
                        dir <= '1';
                        state <= DIRE;
                    elsif char = "01000001" then
                        dir <= '0';
                        state <= DIRE;
                    else
                        state <= ERR;     
                    end if;
                end if;
                when ANGLESIGN =>
                if unsigned(char) >= to_unsigned(48, 8) and unsigned(char) <= to_unsigned(57, 8) then
                    firstdigit <= unsigned(char) - to_unsigned(48, 8);
                    state <= ANGLE_1;
                else
                    state <= ERR;
                end if;
                when ANGLE_1 =>
                if unsigned(char) >= to_unsigned(48, 8) and unsigned(char) <= to_unsigned(57, 8) then
                    seconddigit <= unsigned(char) - to_unsigned(48, 8);
                    state <= ANGLE_2;
                else
                    state <= ERR;
                end if;
                when ANGLE_2 =>
                if char = "00001101" then
                    if anglesig = '0' then
                        angle <= std_logic_vector(firstdigit*10+seconddigit); 
                    else
                        angle <= std_logic_vector(to_signed(-(to_integer(firstdigit)*10+to_integer(seconddigit)),N));
                    end if;
                    state <= START;
                    calc <= '1';
                    angle_changed <= '1';
                else
                    state <= ERR; 
                end if;
                when DIRE =>
                if char = "00001101" then
                    state <= START;
                    calc <= '1';
                else
                    state <= ERR;
                end if;
                when ERR =>
                    state <= START;
                    calc <= '0';
                    cont <= '0';
                    dir <= '0';
                    angle <= (others => '0');
            end case C1;
        end if;
    end process;
end behavioral;