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
    IR_CONTROL: out std_logic  --ir led control signal
  );
end top;

architecture Behavioral of top is
    signal CLK50MHZ : std_logic := '0';
    
    signal clk38KHZ : std_logic := '0';
    signal keycode  : std_logic_vector(31 downto 0);
    
begin

    tclk : entity work.clkDivider
    port map (
        clk     =>  CLK100MHZ,
        Outclk  =>  clk38KHZ
    );
    
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
        ircontrol   => IR_CONTROL,
        clk38KHZ    => clk38KHZ,
        clk         => CLK100MHZ
    );
    
    process(CLK100MHZ)
    begin
        if rising_edge(CLK100MHZ) then
            CLK50MHZ <= not CLK50MHZ;
        end if;
    end process;

end Behavioral;
