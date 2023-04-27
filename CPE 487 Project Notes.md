---
author: "john"
---
set_param general.maxThreads 8
## Keyboard PS2 USB
The NEXYS A7 100t allows usb keyboards to be read as PS2 inputs.

variables can only be used in processes. shared variables can be declared outside.
```
shared variable datacur    : std_logic_vector(7 downto 0);
```

[variable data type](https://startingelectronics.org/software/VHDL-CPLD-course/tut13-VHDL-data-types-and-operators/):
- Predefined variable types:
	- BIT
	can only be 0 or 1 must use single quotes (ex: '0') when defining.
	- BIT_VECTOR
	Like bit but 2 or more bits.
	- BOOLEAN
	
	- INTEGER
	
- IEEE.STD_LOGIC_1164.ALL variable types:
	- STD_LOGIC
	Can have value X: unknown. 0: logic 0, 1: logic 1, Z: high impedance (oc) / tristate buffer?. can have other values which cant be used?
		
	- STD_LOGIC_VECTOR
	2 or more bits of STD_LOGIC.

[StackExchange STD_LOGIC vs BIT](https://electronics.stackexchange.com/questions/51848/when-to-use-std-logic-over-bit-in-vhdl)

[<= is used to assign value to variable (=> is used for case statements)](https://stackoverflow.com/questions/7988098/vhdl-difference-between-and)
```
variable x : std_logic := 0;
```

![[Pasted image 20230427002629.png]]

## Processes:
Syntax:
```
[process_label] : process([sensitivity list])
--declare variables and such stuff here
begin
--code statements

end process [process_label]
```
[sensitivity list]: signals used in process

If statement syntax:
```
if ([conditional statement]) then

end if;
```

switch statement syntax:
```
case [variable] is
	when [condition 1] =>
		statement if true;
	when [conidtion 2] =>
		statement if true
	when others => --else/default statement
		statement when else is true
end case;
```


IN TOP FILE U NEED TO RE DECLARE PORTS OR USE OTHER
```
    PS2Receiver_inst : entity work.PS2Receiver
    port map (
        clk         => CLK50MHZ,
        kclk        => PS2_CLK,
        kdata       => PS2_DATA,
        keycodeout  => keycode(31 downto 0)
    );


COMPONENT bat_n_ball IS
PORT (
	v_sync : IN STD_LOGIC;
	pixel_row : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	pixel_col : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	bat_x : IN STD_LOGIC_VECTOR (10 DOWNTO 0);
	serve : IN STD_LOGIC;
	red : OUT STD_LOGIC;
	green : OUT STD_LOGIC;
	blue : OUT STD_LOGIC
);
END COMPONENT;

add_bb : bat_n_ball
	PORT MAP(--instantiate bat and ball component
	v_sync => S_vsync,
	pixel_row => S_pixel_row,
	pixel_col => S_pixel_col,
	bat_x => batpos,
	serve => btn0,
	red => S_red,
	green => S_green,
	blue => S_blue
);
```
