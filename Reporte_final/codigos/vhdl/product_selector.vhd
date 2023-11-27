library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProductSelector is
    Port (
        product_3 : in STD_LOGIC;
        product_6 : in STD_LOGIC;
        product_7 : in STD_LOGIC;
        product_12 : in STD_LOGIC;
        product_15 : in STD_LOGIC;
        product_value : out integer range 0 to 31
    );
end ProductSelector;

architecture Behavioral of ProductSelector is
begin
    process(
        product_3, 
        product_6, 
        product_7, 
        product_12, 
        product_15
    )
    variable value : integer range 0 to 31;
    begin
        value := 0;

        if product_3 = '1' then
            value := 3;
        elsif product_6 = '1' then
            value := 6;
        elsif product_7 = '1' then
            value := 7;
        elsif product_12 = '1' then
            value := 12;
        elsif product_15 = '1' then
            value := 15;
        end if;

        product_value <= value;
    end process;
end Behavioral;
