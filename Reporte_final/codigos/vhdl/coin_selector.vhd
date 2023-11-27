library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CoinConverter is
    Port (
        coin_1 : in STD_LOGIC;
        coin_2 : in STD_LOGIC;
        coin_5 : in STD_LOGIC;
        coin_10 : in STD_LOGIC;
        total_value : out integer range 0 to 31
    );
end CoinConverter;

architecture Behavioral of CoinConverter is
begin
    process(coin_1, coin_2, coin_5, coin_10)
    variable total : integer range 0 to 31; 
    begin
        total := 0;

        if coin_1 = '1' then
            total := total + 1;
        end if;

        if coin_2 = '1' then
            total := total + 2;
        end if;

        if coin_5 = '1' then
            total := total + 5;
        end if;

        if coin_10 = '1' then
            total := total + 10;
        end if;

        total_value <= total;
    end process;
end Behavioral;