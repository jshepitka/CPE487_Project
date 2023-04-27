library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
    signal digit: std_logic_vector(3 downto 0);
    signal aen  : std_logic_vector(7 downto 0);
    signal clkdiv: unsigned(19 downto 0) := (others => '0');

begin

    dp <= '1';
    s  <= std_logic_vector(clkdiv(19 downto 17));
    aen <= "11111111"; --was 8 ones

    -- Quad 4-to-1 MUX
	seg <= "0000001" WHEN digit = "0000" ELSE -- 0
	       "1001111" WHEN digit = "0001" ELSE -- 1
	       "0010010" WHEN digit = "0010" ELSE -- 2
	       "0000110" WHEN digit = "0011" ELSE -- 3
	       "1001100" WHEN digit = "0100" ELSE -- 4
	       "0100100" WHEN digit = "0101" ELSE -- 5
	       "0100000" WHEN digit = "0110" ELSE -- 6
	       "0001111" WHEN digit = "0111" ELSE -- 7
	       "0000000" WHEN digit = "1000" ELSE -- 8
	       "0000100" WHEN digit = "1001" ELSE -- 9
	       "0001000" WHEN digit = "1010" ELSE -- A
	       "1100000" WHEN digit = "1011" ELSE -- B
	       "0110001" WHEN digit = "1100" ELSE -- C
	       "1000010" WHEN digit = "1101" ELSE -- D
	       "0110000" WHEN digit = "1110" ELSE -- E
	       "0111000" WHEN digit = "1111" ELSE -- F
	       "1111111";

    -- Decoder for 7-segment display values
    process(digit) begin
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
    process(aen, s) begin
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
