library IEEE;
use IEEE.std_logic_1164.all;

entity top is
    port(
        CLK100MHZ : in std_logic;
        PS2_CLK   : in std_logic;
        PS2_DATA  : in std_logic;
        SEG       : out std_logic_vector(6 downto 0);
        AN        : out std_logic_vector(7 downto 0);
        DP        : out std_logic;
        UART_TXD  : out std_logic
    );
end top;

architecture Behavioral of top is
    signal CLK50MHZ : std_logic := '0';
    signal keycode  : std_logic_vector(31 downto 0);

begin

    PS2Receiver_inst : entity work.PS2Receiver
    port map (
        clk         => CLK50MHZ,
        kclk        => PS2_CLK,
        kdata       => PS2_DATA,
        keycodeout  => keycode(31 downto 0)
    );

    seg7decimal_inst : entity work.seg7decimal
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

end Behavioral;
