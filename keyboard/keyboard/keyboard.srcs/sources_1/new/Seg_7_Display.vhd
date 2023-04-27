library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
entity seg7decimal is
    port (
        x   : in  std_logic_vector(31 downto 0);
        clk : in  std_logic;
        seg : out std_logic_vector(6 downto 0);
        an  : out std_logic_vector(7 downto 0);
        dp  : out std_logic
    );
end entity;

architecture Behavioral of seg7decimal is

    signal s    : std_logic_vector(2 downto 0);
    signal aen  : std_logic_vector(7 downto 0);
    
    signal digit: std_logic_vector(3 downto 0);
    signal clkdiv: std_logic_vector(19 downto 0);

begin
    dp <= '1';
    s  <= clkdiv(19 downto 17);
    aen <= "11111111"; --was 8 ones

    -- Quad 4-to-1 MUX
        -- Decoder for 7-segment display values

    process(clk)
    begin
    if rising_edge(clk) then
        case s is
            when "000" =>
                    digit <= x(3 downto 0);
                when "001" =>
                    digit <= x(7 downto 4);
                when "010" =>
                    digit <= x(11 downto 8); 
                when "011" =>
                    digit <= x(15 downto 12);    
                when "100" =>
                    digit <= x(19 downto 16);
                when "101" =>
                    digit <= x(23 downto 20);    
                when "110" =>
                    digit <= x(27 downto 24);
                when "111" =>
                    digit <= x(31 downto 28);
                when others =>
                    digit <= x(3 downto 0);
                end case;      
        end if;
        case digit is
            when "0000" =>
                seg <= "1000000";
            when "0001" =>
                seg <= "1111001";
            when "0010" =>
                seg <= "0100100";
            when "0011" =>
                seg <= "0110000";
            when "0100" =>
                seg <= "0011001";
            when "0101" =>
                seg <= "0010010";
            when "0110" =>
                seg <= "0000010";
            when "0111" =>
                seg <= "1111000";
            when "1000" =>
                seg <= "0000000";
            when "1001" =>
                seg <= "0010000";
            when others =>
                seg <= "0000000"; -- U
        end case;
    end process;

    -- Output enable signals for 7-segment displays
    process(aen, s) 
    begin
        an <= "11111111";
        if aen(to_integer(unsigned(s))) = '1' then
            an(to_integer(unsigned(s))) <= '0';
        end if;
    end process;

    -- Clock divider
    process(clk) begin
        if rising_edge(clk) then
            clkdiv <= clkdiv + 1;
        end if;
    end process;

end architecture;
