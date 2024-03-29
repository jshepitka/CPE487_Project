----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2023 10:22:02 PM
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
use STD.textio.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

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
    PS2_CLK   : in std_logic;
    PS2_DATA  : in std_logic;
    
    IR_CONTROL: out std_logic;  --ir led control signal
    BTNC      : in  std_logic;
    
    SEG       : out std_logic_vector(6 downto 0);
    AN        : out std_logic_vector(7 downto 0);
    DP        : out std_logic;
    UART_TXD  : out std_logic;
    
    clkoutput : out std_logic
  );
end top;

architecture Behavioral of top is
    signal CLK100MHZ_signal: std_logic := '0';
    signal CLK50MHZ : std_logic := '0';
    signal clk38KHZ : std_logic := '0';
    signal keycode  : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    
    signal pwm_signal   : std_logic := '0';
    signal control_signal      : std_logic := '0';

begin
    CLK100MHZ_signal <= CLK100MHZ;
    IR_CONTROL <= control_signal AND pwm_signal; --testIR_CONTROL for testing
    
    keyboard : entity work.PS2Receiver
    port map(
        clk         =>  CLK50MHZ,
        kclk        =>  PS2_CLK,
        kdata       =>  PS2_DATA,
        keycodeout  =>  keycode(31 downto 0)
    );
    
    pwm_module : entity work.pwm
    --generic map ();
    port map(
        clk_in  =>  CLK100MHZ_signal, --100MHz Clock/CLK100MHZ when not testing / testclk100M for testing
        pwm_out =>  pwm_signal
    );
    
    transmissionSignal : entity work.sig
    port map (
        keycode     => keycode, --keycode,
        send_button => BTNC,
        ircontrol   => control_signal, --for testing, using testOut signal instead of IR_CONTROL port (JA[1])
        clk         => CLK100MHZ_signal --CLK100MHZ
    );
    
    
    sevenSeg : entity work.seg7decimal
    port map (
        x    => keycode(31 downto 0),
        clk  => CLK100MHZ_signal,
        seg  => SEG(6 downto 0),
        an   => AN(7 downto 0),
        dp   => DP
    );
    
CLK_50MHz : process(CLK100MHZ)
begin
    if rising_edge(CLK100MHZ) then
        CLK50MHZ <= not CLK50MHZ;
    end if;
end process;
   

test_100MHz_clk : process  --testbench begins
begin
    wait for 5ns;--half period of 100MHz clock in ns
    CLK100MHZ_signal <= NOT CLK100MHZ_signal;   
end process;

test_keycode : process
begin
    wait for 100 ns;
    keycode(15 downto 0) <= "1111000000101001";
end process;
   
 
--p1: process --test process.
--    variable ILine, Oline : Line;
--    variable testData : bit_vector;
--    variable keycode_in: std_logic_vector(15 downto 0);
--    variable f_out: std_logic; --dont know if this is right

----    file inputFile  :   text open read_mode is "C:/Users/johnn/Documents/.ActuallyDocuments/cpe487CPE487_Project/projectTestFiles/testInputs.txt";
----    file resultFile :   text open write_mode is "C:/Users/johnn/Documents/.ActuallyDocuments/cpe487CPE487_Project/projectTestFiles/results.txt";
--begin
--    file_open(testInputs, "C:/Users/johnn/Documents/.ActuallyDocuments/cpe487CPE487_Project/projectTestFiles/testInputs.txt", READ_MODE);
----    file_open(results, "C:/Users/johnn/Documents/.ActuallyDocuments/cpe487CPE487_Project/projectTestFiles/results.txt", WRITE_MODE);
--    while not endfile(testInputs) loop
--        readLine(testInputs, ILine);
--        read(ILine, testData);
--        keycode_in := to_stdlogicvector(testData);
--        keycode <= keycode_in;
--    wait for 60 NS;
--    end loop;
--       file_close(testInputs);
----       file_close(results);
--end process p1;
end Behavioral;
