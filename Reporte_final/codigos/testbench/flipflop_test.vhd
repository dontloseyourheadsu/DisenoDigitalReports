library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FF_tb is
-- Testbench no necesita puertos
end T_FF_tb;

architecture Behavioral of T_FF_tb is
    signal T : std_logic := '0';
    signal Clock : std_logic := '0';
    signal Reset : std_logic := '0';
    signal Q : std_logic;

begin
    uut: entity work.T_FF
        port map (
            T => T,
            Clock => Clock,
            Reset => Reset,
            Q => Q
        );

    stimulus: process
    begin
        -- Caso 1: Reset con reloj en '0'
        Reset <= '1';
        wait for 10 ns;
        Clock <= '1'; -- Primer pulso de reloj
        wait for 10 ns;
        Clock <= '0';
        wait for 10 ns;
        Reset <= '0';
        wait for 10 ns;

        -- Caso 2: T = 0 con reloj en '1' (No cambia)
        T <= '0';
        Clock <= '1';
        wait for 10 ns;
        Clock <= '0';
        wait for 10 ns;

        -- Caso 3: T = 1 con reloj en '1' (Toggle)
        T <= '1';
        Clock <= '1';
        wait for 10 ns;
        Clock <= '0';
        wait for 10 ns;
        Clock <= '1';
        wait for 10 ns;
        Clock <= '0';
        wait for 10 ns;

        -- Caso 4: Reset en medio de un toggle con reloj en '1'
        Reset <= '1';
        Clock <= '1';
        wait for 10 ns;
        Clock <= '0';
        wait for 10 ns;
        Reset <= '0';
        wait for 10 ns;
        T <= '0';
        Clock <= '1';
        wait for 10 ns;
        Clock <= '0';
        wait for 10 ns;
        T <= '1';
        Clock <= '1';
        wait for 10 ns;
        Clock <= '0';
        wait for 10 ns;

        -- Caso 5: T = 1 constante con cambios de reloj
        T <= '1';
        Clock <= '1';
        wait for 10 ns;
        Clock <= '0';
        wait for 10 ns;
        Clock <= '1';
        wait for 10 ns;
        Clock <= '0';
        wait for 10 ns;

        wait;
    end process stimulus;
end Behavioral;
