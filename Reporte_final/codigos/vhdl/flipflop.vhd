library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FF is
    port( 
        T: in std_logic;
        Clock: in std_logic;
        Reset: in std_logic; -- Added reset
        Q: out std_logic
    );
end T_FF;

architecture Behavioral of T_FF is
    signal tmp: std_logic := '0'; -- Initialized tmp
begin
    process (Clock, Reset)
    begin
        if Reset = '1' then
            tmp <= '0'; -- Reset state
        elsif rising_edge(Clock) then
            if T = '1' and tmp = '0' then
                tmp <= '1';
            end if;
        end if;
    end process;
    Q <= tmp;
end Behavioral;