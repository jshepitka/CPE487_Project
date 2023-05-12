--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

--entity testbench is
--end testbench;

--architecture io of testbench is
--    constant period : time := 10ns;
    
--    signal CLK100MHZ : std_logic;
--    signal PS2_CLK : std_logic;
--    signal PS2_DATA : std_logic;
--    signal IR_CONTROL : std_logic;
--    signal clkoutput : ou
--begin
    
--    top1: entity WORK.top(Behavioral) port map (d2=>sigd2, nd2=>signd2);
    
--    process
--    begin
--        CLK100MHZ<='0';
--        wait for period/2;
--        CLK100MHZ<='1';
--        wait for period/2;
--    end process;
    
    
--end architecture io;

----entity top is
----  Port ( 
----    CLK100MHZ : in std_logic;
----    PS2_CLK   : in std_logic;
----    PS2_DATA  : in std_logic;
----    IR_CONTROL: out std_logic;  --ir led control signal
----    clkoutput : out std_logic;
----    clkout50m : out std_logic;
----    clkout38k : out std_logic;
    
----    SEG       : out std_logic_vector(6 downto 0);
----    AN        : out std_logic_vector(7 downto 0);
----    DP        : out std_logic;
----    UART_TXD  : out std_logic
----  );
----end top;




----architecture io of circuit_gates is
----    signal sigd2, signd2, sigd1, sigdand, sigd3, sigy, sigx, sigd0, sigv : BIT;
----    file vectors : text;
----    file results : text;
----begin
----    g1: entity WORK.D2Not(ex1) port map (d2=>sigd2, nd2=>signd2);
----    g2: entity WORK.andD1D2(ex1) port map (d1=>sigd1, nd2=>signd2, dand=>sigdand);
----    g3: entity WORK.orY(ex1) port map (dand=>sigdand, d3=>sigd3, y=>sigy);
----    g4: entity WORK.orX(ex1) port map (d2=>sigd2, d3=>sigd3, x=>sigx);
----    g5: entity WORK.orV(ex1) port map (d0=>sigd0, d1=>sigd1, x=>sigx, v=>sigv);
--   -- aa<= '0', '1' after 120ns, '0' after 160ns,'1' after 180ns, '0' after 190ns;
--   -- bb<= '0', '1' after 150ns;
--   -- cc<= '0', '1' after 170ns;
--   -- dd<= '0', '1' after 140ns;
----   p1: process is
----        variable ILine, OLine : Line;
----        variable X_in, Y_in, Z_in, W_in, y_out, x_out, v_out : BIT;
----        variable ch : CHARACTER;
----    begin
----        file_open(vectors, "C:/Users/croco/Downloads/vectors2.txt", READ_MODE);
----        file_open(results, "C:/Users/croco/Downloads/results.txt", WRITE_MODE);
----        while not endfile(vectors) loop
----            readline(vectors, ILine);
----            read(ILine, X_in);
----            read(ILine, ch);
----            read(ILine, Y_in);
----            read(ILine, ch);
----            read(ILine, Z_in);
----            read(ILine, ch);
----            read(ILine, W_in);
----            sigd0 <= X_in;
----            sigd1 <= Y_in;
----            sigd2 <= Z_in;
----            sigd3 <= W_in;
----            wait for 60 NS;
----            x_out := sigx;
----            v_out := sigv;
----            y_out := sigy;
----            write(OLine, x_out, right, 0);
----            write(OLine, y_out, right, 0);
----            write(OLine, v_out, right, 0);
----            writeline(results, OLine);
----        end loop;
----        file_close(vectors);
----        file_close(results);
----        end process p1;
----end architecture io;