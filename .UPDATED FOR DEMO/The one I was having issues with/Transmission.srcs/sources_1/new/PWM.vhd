----------------------------------------------------------------------------------
-- Company: STEVENS
-- Engineer: John Shepitka
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
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity pwm is
    generic(
        carrier_period_ns  :    integer     :=  26316; --38kHz
        carrier_freq_hz    :    integer     :=  38000;  
        carrier_duty_cycle  :    integer     :=  4     --1/(this value)
    );
    port(
        clk_in  :   in  std_logic;  --100MHZ CLOCK
        --data_in :   in std_logic_vector(31 downto 0);
        pwm_out :   out std_logic                       := '0'
    );
end entity;

architecture Behavioral of pwm is
    constant    cnt_length      :   integer     :=  (carrier_period_ns/10);--integer(carrier_period_ns / 1000);   --also period of carrier wave in microseconds
    constant    duty_cycle_cnt  :   integer     :=  integer(cnt_length/carrier_duty_cycle);--integer((carrier_duty_cycle/100)*cnt_length);

    signal      base_clk        :   std_logic   :=  '0';
    signal      carrier         :   std_logic   :=  '1';   
    signal      cnt             :   integer range 0  to (cnt_length) := 0;
    
begin

    pwm_out <=  carrier;
    
carrier_clk : process(clk_in)  
begin
    IF (rising_edge(clk_in)) THEN
        IF cnt = (cnt_length - 1) THEN
            cnt <= 0;
            carrier <=  NOT carrier;
        ELSIF cnt = (duty_cycle_cnt - 1) THEN
            carrier <=  NOT carrier;
            cnt <=  cnt + 1;
        ELSE
            cnt <=  cnt + 1;
        END IF;
        
   END IF;
end process;

end Behavioral;