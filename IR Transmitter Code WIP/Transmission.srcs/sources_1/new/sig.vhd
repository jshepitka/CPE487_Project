library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


-- HANDLES THE KEYCODE SIGNAL TO DETERMINE WHICH IRCODE TO SEND.
entity sig is
    port(
        keycode         : in std_logic_vector(31 downto 0);
        ircontrol       : out std_logic;
        clk38KHZ        : in std_logic;
        clk             : in std_logic
    );
end sig;

architecture Behavioral of sig is
    signal dataIN : std_logic_vector(31 downto 0);
    signal irdata : std_logic_vector(31 downto 0);
begin
    dataIN <= keycode;
process
    variable i : integer range 31 to 0 := 0;
begin
    case dataIN is
        when "  " =>
            irdata <=
            i :=
        when "  " =>
            irdata <=
            i :=
        when "  " =>
            irdata <=
            i :=
        when "  " =>
            irdata <=
            i :=
        when "  " =>
            irdata <=
            i :=
        when "  " =>
        
        when others =>
            ircode <= "0";
    end case;
    
    if rising_edge(clk38KHZ) then
        if irdata /= "0" then
            ircontrol <= irdata(i);
            i := i +1;
        end if;
    end if;
end Behavioral;