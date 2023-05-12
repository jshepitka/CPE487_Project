----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/12/2023 02:23:23 AM
-- Design Name: 
-- Module Name: codematcher - Behavioral
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

entity codematcher is
    port(
        keycode_in         : in std_logic_vector(31 downto 0);
        clk_in          : in std_logic;
        IRcode_out      : out std_logic_vector(31 downto 0)
        
    );
end codematcher;

architecture Behavioral of codematcher is
    signal key : std_logic_vector(15 downto 0) := "0000000000000000";
begin
    key <= keycode_in(15 downto 0);
process(clk_in)
begin
    IF (rising_edge(clk_in)) THEN
    CASE key(15 downto 0) IS
        when "1111000000101001" => 
            IRcode_out <= "01010111111000111100000000111111"; --power 111101000110 111100101010
        when "1111000000011101" => --w
            IRcode_out <= "01010111111000110100101010110101"; --netflix
        when "1111000000011011" =>--s
            IRcode_out <= "01010111111000110000010011111011"; --volume down
        when others => 
            IRcode_out <= "00000000000000000000000000000000";
   END CASE;
   END IF;
end process;
end Behavioral;
