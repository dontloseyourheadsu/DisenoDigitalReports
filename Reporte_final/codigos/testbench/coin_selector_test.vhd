library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CoinConverter_tb is
end CoinConverter_tb;

architecture Behavioral of CoinConverter_tb is
    signal coin_1 : STD_LOGIC := '0';
    signal coin_2 : STD_LOGIC := '0';
    signal coin_5 : STD_LOGIC := '0';
    signal coin_10 : STD_LOGIC := '0';
    signal total_value : integer range 0 to 31;

begin
    uut: entity work.CoinConverter
        port map (
            coin_1 => coin_1,
            coin_2 => coin_2,
            coin_5 => coin_5,
            coin_10 => coin_10,
            total_value => total_value
        );

    stimulus: process
    begin
        -- Combinación 1: 1
        coin_1 <= '1';
        wait for 10 ns;

        -- Combinación 2: 2
        coin_1 <= '0';
        coin_2 <= '1';
        wait for 10 ns;

        -- Combinación 3: 1 + 2
        coin_1 <= '1';
        wait for 10 ns;

        -- Combinación 4: 5
        coin_1 <= '0';
        coin_2 <= '0';
        coin_5 <= '1';
        wait for 10 ns;

        -- Combinación 5: 1 + 10
        coin_5 <= '0';
        coin_1 <= '1';
        coin_10 <= '1';
        wait for 10 ns;

        coin_1 <= '0';
        coin_10 <= '0';
        
        wait;
    end process stimulus;
end Behavioral;
