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
    signal dataIN : std_logic_vector(15 downto 0);
    signal irdata : std_logic_vector(11 downto 0);
begin
    dataIN <= keycode(15 downto 0);
process(clk38KHz)
    variable i : integer range 12 to 0 := 0;
    variable mark : integer range 2 to 0 := 0; --wait counter  
    variable count : integer range 304 to 0;
begin -- signal starts with 1111 then 8 bits of data this is for tcl
    if rising_edge(clk38KHZ) then
    case dataIN(15 downto 0) is --cases are for  release keycodes (f0__) matched to the digits from sevenseg display code
        when "1111000000101001" => --space bar
            irdata <= "111100101010"; --power
        when "1111000000011101" => --w
            irdata <= "111100101111"; --volume up
        when "1111000000011011" =>--s
            irdata <= "111100101110"; --volume down
--        when "  " =>
--            irdata <= "1111
--        when "  " =>
--            irdata <= "1111
--        when "  " =>
        when others =>
            irdata <= "000000000000";
    end case;

    --tcl uses 4ms on then 4ms off ("mark"), then 12 bit signal, first 4 are address bits (likely all 1s), then 8 bits for function (on, off, channel up, etc.)
    --each bit is on for 0.5ms, then if it is a 1 off for 1ms, if it is a 0 off for 2ms
    --on means "send 19 pulses at 38kHz" where the pulse is transmitted for half the time = actually 76khz clock?
    --ex. power on is '1111 00101010' (15 42 in decimal)
    --currently implements the 12 bits being sent but not the mark
    
        if irdata /= 0 then
            if mark = 0 then
                ircontrol <= clk38KHz;
                if count < 152 then
                    count := count + 1;
                else
                    mark := 1;
                    count := 0;    
                end if;
            elsif mark = 1 then
                ircontrol <= '0';
                mark := 2;
            end if;
            if i < 12 then
                if irdata(i) = '1' then
                    if count < 152 then
                        ircontrol <= clk38KHz;
                        count := count + 1;   
                    elsif (count < 304) then
                        ircontrol <= '0';
                        count := count + 1;
                    else
                        i := i + 1;
                        count := 0;
                    end if;
             else
                    if count < 19 then
                        ircontrol <= clk38KHz;
                    elsif (count < 95) then
                        ircontrol <= '0';
                    else
                        i := i +1;
                        count := 0;
                    end if;    
                end if;
           else
                i := 0;
                mark := 0;
                ircontrol <= clk38KHz;
           end if;
        end if;
      end if;
end process;
end Behavioral;