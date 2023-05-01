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
    variable cnt : integer range 38 to 0;
    variable alternate : std_logic := '1';
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
    --tcl uses 4ms on then 4ms off ("mark"), then 12 bit signal, first 4 are address bits (likely all 1s), then 8 bits for function (on, off, channel up, etc.)
    --each bit is on for 0.5ms, then if it is a 1 off for 1ms, if it is a 0 off for 2ms
    --on means "send 19 pulses at 38kHz" where the pulse is transmitted for half the time = actually 76khz clock?
    --ex. power on is '1111 00101010' (15 42 in decimal)
    --currently implements the 12 bits being sent but not the mark
    if rising_edge(clk38KHZ) then
        if irdata /= "0" then
            if(cnt /= 38) then
                if(cnt < 37) then  -- loop the 19 pulses every bit gets
                    ircontrol <= alternate;
                    alternate := not alternate;
                    cnt := cnt + 1;
                else
                    ircontrol <= '0';  --final loop turns signal off and resets counter
                    cnt := 38;  --38 = already looped
                end if;
            
            else
                if(irdata(i) = '1') then
                    --wait 1ms not sure how to do that 38 cycles
                else
                    --wait 2ms 76 cycles
                cnt := 0;
                ircontrol <= irdata(i);
                i := i +1;
            end if;
        end if;
    end if;
end Behavioral;
