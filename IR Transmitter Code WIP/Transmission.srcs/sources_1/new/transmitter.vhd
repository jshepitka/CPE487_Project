----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2023 06:39:44 PM
-- Design Name: 
-- Module Name: transmitter - Behavioral
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
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transmitter is
    Port ( 
        dataIN  :   in std_logic_vector;
        dataL   :   in integer;
        dataOUT :   out std_logic;
        clk     :   in std_logic;
        clkDiv  :   in std_logic
    );
end transmitter;

architecture Behavioral of transmitter is
begin
    process(clk)
        variable data : std_logic_vector(7 downto 0);
        variable i : integer range 32 to 0 :=0;
        variable length : integer range 32 to 0;
    begin
    data := dataIN;
    length := dataL;
        if rising_edge(clk) then
        if clkDIV = '1' then
            if i < length then
                dataOUT <= data(i);
                i := i + 1;
            else
                i := 0;
            end if;
        end if;
       end if;
    end process;
end Behavioral;
