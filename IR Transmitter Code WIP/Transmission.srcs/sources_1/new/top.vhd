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
    clkoutput : out std_logic;
    clkout50m : out std_logic;
    clkout38k : out std_logic;
    
    SEG       : out std_logic_vector(6 downto 0);
    AN        : out std_logic_vector(7 downto 0);
    DP        : out std_logic;
    UART_TXD  : out std_logic
  );
end top;

architecture Behavioral of top is
    signal CLK50MHZ : std_logic := '0';
    signal clk38KHZ : std_logic := '1';
    signal keycode  : std_logic_vector(31 downto 0);
    signal cnt : unsigned(10 downto 0);
    --test files
    file testInputs : text;
    file results : text;
    signal testOut : std_logic;

begin
    clkoutput <= CLK100MHZ;
    clkout50m <= CLK50MHZ;
  --  clkout38k <= clk38KHZ;
    clkout38k <= clk38KHz;
    
    process
    begin
        wait until rising_edge(CLK100MHZ); 
               cnt <= cnt + "1";
--            cnt := cnt + 1;
            if cnt = 1312 then
                clk38kHz <= not clk38kHz; --not clk38KHz;             
                 cnt <= "00000000000";
           end if;
end process;
    
--    tclk : entity work.clkDivider
--    port map (
--        clk     =>  CLK100MHZ,
--        Outclk  =>  clk38KHZ--clkoutput--clk38KHZ
--    );
    
    keyboard : entity work.PS2Receiver
    port map(
        clk         =>  CLK50MHZ,
        kclk        =>  PS2_CLK,
        kdata       =>  PS2_DATA,
        keycodeout  =>  keycode(31 downto 0)
    );

    transmissionSignal : entity work.sig
    port map (
        keycode     => keycode,
        ircontrol   => IR_CONTROL, --for testing, using testOut signal instead of IR_CONTROL port (JA[1])
        clk38KHZ    => clk38KHZ,
        clk         => CLK100MHZ
    );
    
    
    sevenSeg : entity work.seg7decimal
    port map (
        x    => keycode(31 downto 0),
        clk  => CLK100MHZ,
        seg  => SEG(6 downto 0),
        an   => AN(7 downto 0),
        dp   => DP
    );
    
    process(CLK100MHZ)
    begin
        if rising_edge(CLK100MHZ) then
            CLK50MHZ <= not CLK50MHZ;
        end if;
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
