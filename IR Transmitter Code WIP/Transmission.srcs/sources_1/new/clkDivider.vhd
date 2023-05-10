----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2023 09:59:47 PM
-- Design Name: 
-- Module Name: clkDivider - Behavioral
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

entity clkDivider is
  Port ( 
    clk     : in std_logic;
    Outclk  : out std_logic
  );
end clkDivider;

architecture Behavioral of clkDivider is
begin
--    process(clk)
--    variable cnt : integer range 2047 to 0;
--    variable clk38KHz : std_logic := '0';
--    begin
 --       if rising_edge(clk) then
   --         cnt := cnt + 1;
     --       if cnt = 1312 then
       --         clk38KHz := not clk38KHz;
         --       Outclk <= clk38KHz;          
           --     cnt := 0;
        --    end if;
      --  end if;
--end process;
end Behavioral;
