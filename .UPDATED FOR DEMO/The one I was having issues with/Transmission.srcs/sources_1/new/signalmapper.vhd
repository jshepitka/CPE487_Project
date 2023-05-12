library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


-- HANDLES THE KEYCODE SIGNAL TO DETERMINE WHICH IRCODE TO SEND.
entity sig is
    
    port(
        keycode         : in std_logic_vector(31 downto 0);
        send_button     : in std_logic;
        ircontrol       : out std_logic;
        clk             : in std_logic
    );
end sig;

architecture Behavioral of sig is
    signal dataIN : std_logic_vector(15 downto 0);
    signal irdata : std_logic_vector(31 downto 0);
    
    signal keycode_detected : std_logic := '1';
    
    signal control      : std_logic := '0'; 
begin
    dataIN <= keycode(15 downto 0);
    ircontrol <= control;
process
begin -- signal starts with 1111 then 8 bits of data this is for tcl
    WAIT UNTIL send_button = '1';
    case dataIN(15 downto 0) is --cases are for  release keycodes (f0__) matched to the digits from sevenseg display code
        when "1111000000101001" => --space bar
            irdata <= "01010111111000111100000000111111"; --power 111101000110 111100101010
            keycode_detected <= '0';
        when "1111000000011101" => --w
            irdata <= "01010111111000110100101010110101"; --netflix
            keycode_detected <= '0';
        when "1111000000011011" =>--s
            irdata <= "01010111111000110000010011111011"; --volume down
            keycode_detected <= '0';
--        when "  " =>
--            irdata <= "1111
--        when "  " =>
--            irdata <= "1111
--        when "  " =>
        when others =>
            irdata <= "00000000000000000000000000000000";
    end case;
end process;
    --tcl uses 9ms on then 4.5ms off ("mark"), then 12 bit signal, first 4 are address bits (likely all 1s), then 8 bits for function (on, off, channel up, etc.)
    --each bit is on for 0.5ms, then if it is a 1 off for 1ms, if it is a 0 off for 2ms
    --on means "send 19 pulses at 38kHz" where the pulse is transmitted for half the time = actually 76khz clock?
    --ex. power on is '1111 00101010' (15 42 in decimal)
    --currently implements the 12 bits being sent but not the mark
    
sender : process
    variable data   :   std_logic_vector(31 downto 0);
begin
    IF (keycode_detected = '1') THEN
    data := irdata;
    control   <=  '1';
    WAIT FOR 9 ms;
    control   <=  '0';
    WAIT FOR 4.5 ms;
    FOR i in 31 downto 0 LOOP
        control   <=  '1';
        WAIT FOR 562.5 us;
        control   <=  '0';
        CASE data(i) IS
        WHEN '1' =>
            WAIT FOR 1630 us;
        WHEN '0' =>
            WAIT FOR 600 us;  
        WHEN OTHERS =>
            null;
        END CASE;
    END LOOP;
    keycode_detected <= '0';
    END IF;
end process;
 

end Behavioral;