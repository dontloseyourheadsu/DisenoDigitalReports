library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ChangeCalculator is
    Port (
        coin_total : in integer range 0 to 31;
        product_selected : in integer range 0 to 31;
        change_value : out integer range 0 to 31
    );
end ChangeCalculator;

architecture Behavioral of ChangeCalculator is
begin
    process(coin_total, product_selected)
    begin
        if coin_total >= product_selected then
            change_value <= coin_total - product_selected;
        else
            change_value <= 0;
        end if;
    end process;
end Behavioral;
