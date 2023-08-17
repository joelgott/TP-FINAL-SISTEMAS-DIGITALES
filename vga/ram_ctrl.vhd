LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity ram_ctrl is
port (
    clk :	    in std_logic;
    rst :	    in std_logic;
    data_in			: in std_logic_vector(0 DOWNTO 0);
    dir_w			: in std_logic_vector(18 DOWNTO 0);
    ready		    : out std_logic;
    dir_r			: in std_logic_vector(18 DOWNTO 0);
    data_out		: out std_logic_vector(0 DOWNTO 0)
);
end ram_ctrl;

architecture arch of ram_ctrl is

	COMPONENT blk_mem_gen_0
	  PORT (
		clka : IN std_logic;
		ena : IN std_logic;
		wea : IN std_logic_vector(0 DOWNTO 0);
		addra : IN std_logic_vector(18 DOWNTO 0);
		dina : IN std_logic_vector(0 DOWNTO 0);
		clkb : IN std_logic;
		enb : IN std_logic;
		addrb : IN std_logic_vector(18 DOWNTO 0);
		doutb : OUT std_logic_vector(0 DOWNTO 0)
	  );
	END COMPONENT;   

    signal data_ram: std_logic_vector(0 DOWNTO 0);
	signal current_address, address_aux: std_logic_vector(18 DOWNTO 0);
    
begin

    ram : blk_mem_gen_0
	PORT MAP (
		clka => clk,
		ena => '1',
		wea => (others => '1'),
		addra => current_address,
		dina => data_in,
		clkb => clk,
		enb => '1',
		addrb => dir_r,
		doutb => data_out
	);
    
    process(clk, rst)
    begin
        if rst = '1' then

        elsif rising_edge(clk) then
			if address_aux /= dir_w then
				data_ram <= (others => '0');
				current_address <= address_aux;
				address_aux <= dir_w;
			elsif address_aux = dir_w then
				data_ram <= data_in;
				current_address <= address_aux;
			end if;
        end if;
    end process;
end;