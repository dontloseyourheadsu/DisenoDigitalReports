library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ChangeCalculator_tb is
end ChangeCalculator_tb;

architecture Behavioral of ChangeCalculator_tb is
    signal coin_total : integer range 0 to 31 := 0;
    signal product_selected : integer range 0 to 31 := 0;
    signal change_value : integer range 0 to 31;

begin
    uut: entity work.ChangeCalculator
        port map (
            coin_total => coin_total,
            product_selected => product_selected,
            change_value => change_value
        );

    stimulus: process
    begin
        -- Caso 1: total igual al producto seleccionado
        coin_total <= 10;
        product_selected <= 10;
        wait for 10 ns;

        -- Caso 2: total mayor que el producto seleccionado
        coin_total <= 20;
        product_selected <= 15;
        wait for 10 ns;

        -- Caso 3: total menor que el producto seleccionado
        coin_total <= 5;
        product_selected <= 10;
        wait for 10 ns;

        -- Caso 4: total mucho mayor que el producto seleccionado
        coin_total <= 30;
        product_selected <= 10;
        wait for 10 ns;

        -- Caso 5: total y producto seleccionado a 0
        coin_total <= 0;
        product_selected <= 0;
        wait for 10 ns;

        wait;
    end process stimulus;
end Behavioral;
