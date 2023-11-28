library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ParentComponent_tb is
end ParentComponent_tb;

architecture Behavioral of ParentComponent_tb is
    signal clock_100Mhz : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';

    signal coin_1 : STD_LOGIC := '0';
    signal coin_2 : STD_LOGIC := '0';
    signal coin_5 : STD_LOGIC := '0';
    signal coin_10 : STD_LOGIC := '0';

    signal product_3 : STD_LOGIC := '0';
    signal product_6 : STD_LOGIC := '0';
    signal product_7 : STD_LOGIC := '0';
    signal product_12 : STD_LOGIC := '0';
    signal product_15 : STD_LOGIC := '0';
    
    signal confirm_purchase : STD_LOGIC := '0';
    signal get_change : STD_LOGIC := '0';

    signal Anode_Activate : STD_LOGIC_VECTOR (3 downto 0);
    signal LED_out : STD_LOGIC_VECTOR (6 downto 0);
    
    signal purchase_confirmed_led : STD_LOGIC;

begin
    uut: entity work.ParentComponent
        port map (
            clock_100Mhz => clock_100Mhz,
            reset => reset,
            coin_1 => coin_1,
            coin_2 => coin_2,
            coin_5 => coin_5,
            coin_10 => coin_10,
            product_3 => product_3,
            product_6 => product_6,
            product_7 => product_7,
            product_12 => product_12,
            product_15 => product_15,
            confirm_purchase => confirm_purchase,
            get_change => get_change,
            Anode_Activate => Anode_Activate,
            LED_out => LED_out,
            purchase_confirmed_led => purchase_confirmed_led
        );

    stimulus: process
    begin
        -- Reset del sistema
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait for 10 ns;

        -- Caso 1: Selección de producto 3 y moneda 1
        product_3 <= '1';
        coin_1 <= '1';
        wait for 10 ns;
        product_3 <= '0';
        coin_1 <= '0';
        wait for 10 ns;

        -- Confirmación de la compra para el producto 3
        confirm_purchase <= '1';
        wait for 10 ns;
        confirm_purchase <= '0';
        wait for 10 ns;

        -- Cálculo de cambio
        get_change <= '1';
        wait for 10 ns;

        -- Caso 2: Selección de producto 6 y moneda 6
        product_6 <= '1';
        coin_6 <= '1';
        wait for 10 ns;
        product_6 <= '0';
        coin_6 <= '0';
        wait for 10 ns;

        -- Confirmación de la compra para el producto 6
        confirm_purchase <= '1';
        wait for 10 ns;
        confirm_purchase <= '0';
        wait for 10 ns;

        -- Cálculo de cambio para producto 6
        get_change <= '1';
        wait for 10 ns;
        get_change <= '0';
        wait for 10 ns;

        -- Caso 3: Selección de producto 7 y moneda 10
        product_7 <= '1';
        coin_10 <= '1';
        wait for 10 ns;
        product_7 <= '0';
        coin_10 <= '0';
        wait for 10 ns;

        -- Confirmación de la compra para el producto 7
        confirm_purchase <= '1';
        wait for 10 ns;
        confirm_purchase <= '0';
        wait for 10 ns;

        -- Cálculo de cambio para producto 7
        get_change <= '1';
        wait for 10 ns;
        get_change <= '0';
        wait for 50 ns;

        -- Reset del sistema nuevamente
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait for 50 ns;

        wait;
    end process stimulus;
end Behavioral;
