library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProductSelector_tb is
end ProductSelector_tb;

architecture Behavioral of ProductSelector_tb is
    signal product_3 : STD_LOGIC := '0';
    signal product_6 : STD_LOGIC := '0';
    signal product_7 : STD_LOGIC := '0';
    signal product_12 : STD_LOGIC := '0';
    signal product_15 : STD_LOGIC := '0';
    signal product_value : integer range 0 to 31;

begin
    uut: entity work.ProductSelector
        port map (
            product_3 => product_3,
            product_6 => product_6,
            product_7 => product_7,
            product_12 => product_12,
            product_15 => product_15,
            product_value => product_value
        );

    stimulus: process
    begin
        product_3 <= '1';
        wait for 10 ns;
        product_3 <= '0';

        product_6 <= '1';
        wait for 10 ns;
        product_6 <= '0';

        product_7 <= '1';
        wait for 10 ns;
        product_7 <= '0';

        product_12 <= '1';
        wait for 10 ns;
        product_12 <= '0';

        product_15 <= '1';
        wait for 10 ns;
        product_15 <= '0';

        product_3 <= '1';
        product_12 <= '1';
        wait for 10 ns;
        product_3 <= '0';
        product_12 <= '0';

        wait;
    end process stimulus;
end Behavioral;