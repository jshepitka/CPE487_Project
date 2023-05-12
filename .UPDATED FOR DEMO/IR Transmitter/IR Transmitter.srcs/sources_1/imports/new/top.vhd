----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2023 08:22:04 PM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
  Port ( 
    CLK100MHZ : in std_logic;
    BTNC      : in  std_logic;
    
    pwm_clock_out   :   out std_logic;
    test_clock_out  :   out std_logic;
    IR_output      :   out std_logic;
    
    
    PS2_CLK   : in std_logic;
    PS2_DATA  : in std_logic;
    SEG       : out std_logic_vector(6 downto 0);
    AN        : out std_logic_vector(7 downto 0);
    DP        : out std_logic;
    UART_TXD  : out std_logic
  );
end top;

architecture Behavioral of top is
signal clk_50MHz    : std_logic := '0';
signal test_clock   : std_logic := '1';
    
signal pwm_signal   : std_logic := '0';
signal data_line    : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
signal control      : std_logic := '0';

signal keycode  : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
signal send_button : std_logic := '0';    
begin

test_clock_out  <= test_clock;
IR_output <= control AND pwm_signal;
send_button <= BTNC;

pwm_module : entity work.pwm
port map(
    clk_in  =>  test_clock,
    --data_in =>  data_line,
    pwm_out =>  pwm_signal
);

keyboard : entity work.PS2Receiver
port map(
    clk         => clk_50MHz,
    kclk        => PS2_CLK,
    kdata       => PS2_DATA,
    keycodeout  => keycode
);

sevenSeg : entity work.seg7decimal
    port map (
        x    => keycode(31 downto 0),
        clk  => test_clock,
        seg  => SEG(6 downto 0),
        an   => AN(7 downto 0),
        dp   => DP
    );

match : entity work.codematcher
    port map (
        keycode_in  =>  keycode,
        clk_in      =>  CLK_50MHz,
        ircode_out  =>  data_line
    );

clock_50MHZ : process(test_clock)
begin
        if rising_edge(test_clock) then
        CLK_50MHZ <= not CLK_50MHZ;
    end if;
end process;

sender : process
    variable data   :   std_logic_vector(31 downto 0);
begin
    WAIT UNTIL (send_button = '1' AND data_line /= "00000000000000000000000000000000");
    data := data_line;
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
end process;

--test : processes

virtual_clock : process
begin
wait for 5 ns;
test_clock <= NOT test_clock; --100MHz
end process;


test    :   process
begin
wait for 10 us;
data_line   <=  "01010111111000111100000000111111";
end process;



end Behavioral;
