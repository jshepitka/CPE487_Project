-- counter.vhd --

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY counter IS
	PORT (
		clk : IN STD_LOGIC;
		count : OUT STD_LOGIC_VECTOR (15 DOWNTO 0); -- NEED REVISE! 16 bits
		irClk : OUT STD_LOGIC
		); 
END counter;

ARCHITECTURE Behavioral OF counter IS
	--SIGNAL cnt : STD_LOGIC_VECTOR (38 DOWNTO 0); -- 39-bit counter
	SIGNAL cnt : integer := 0;
	SIGNAL clkout : std_logic;
BEGIN
	PROCESS (clk)
	BEGIN
		IF clk'EVENT AND clk = '1' THEN -- on rising edge of clock
			cnt <= cnt + 1; -- increment counter
			IF cnt = 1312 THEN  --was 2624 but halved because goes it on, cycles again, goes off
			     cnt <= 0;
			     IF clkout = '0' THEN
			         clkout <= '1';
			     ELSE
			         clkout <= '0';
			     END IF;
			END IF;	 
		END IF;
	END PROCESS;
	irClk <= clkout;
END Behavioral;