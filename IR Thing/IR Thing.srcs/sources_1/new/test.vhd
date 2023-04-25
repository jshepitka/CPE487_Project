----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/06/2023 12:42:15 PM
-- Design Name: 
-- Module Name: test - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL, STD.textio.all;;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test is
--  Port ( );
end test;

architecture Behavioral of test is
    file vectors : text;
    file results : text;
    signal v,w,x,y,z : BIT;
begin
        file_open(vectors, "C:/Users/johnn/Documents/.Documents/cpe487/problem7hw/test/vectors.txt", READ_MODE);
        file_open(results, "C:/Users/johnn/Documents/.Documents/cpe487/problem7hw/test/results.txt", WRITE_MODE);
        while not endfile(vectors) loop
            readLine(vectors, ILine);
            read(ILine, a_in);
            read(ILine, ch);
            read(ILine, b_in);
            read(ILine, ch);
            read(ILine, c_in);
            read(ILine, ch);
            read(ILine, d_in);
            v <= a_in;
            w <= b_in;
            x <= c_in;
            y <= d_in;
            wait for 60 NS;
         f_out := z;
         write(OLine, f_out, right, 0);
         writeline(results, OLine);
       end loop;
       file_close(vectors);
       file_close(results);
       end process p1;

end Behavioral;
