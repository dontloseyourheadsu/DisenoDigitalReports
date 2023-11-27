library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ParentComponent is
    Port (
        clock_100Mhz : in STD_LOGIC;
        reset : in STD_LOGIC;

        -- Inputs for CoinConverter
        coin_1 : in STD_LOGIC;
        coin_2 : in STD_LOGIC;
        coin_5 : in STD_LOGIC;
        coin_10 : in STD_LOGIC;

        -- Inputs for ProductSelector
        product_3 : in STD_LOGIC;
        product_6 : in STD_LOGIC;
        product_7 : in STD_LOGIC;
        product_12 : in STD_LOGIC;
        product_15 : in STD_LOGIC;
        
        confirm_purchase : in STD_LOGIC;
        get_change : in STD_LOGIC;

        -- Outputs for seven segment display
        Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0);
        LED_out : out STD_LOGIC_VECTOR (6 downto 0);
        
        -- Output LED for purchase confirmation
        purchase_confirmed_led : out STD_LOGIC
    );
end ParentComponent;

architecture Behavioral of ParentComponent is

    -- Component declarations
    component CoinConverter
        Port (
            coin_1 : in STD_LOGIC;
            coin_2 : in STD_LOGIC;
            coin_5 : in STD_LOGIC;
            coin_10 : in STD_LOGIC;
            total_value : out integer range 0 to 31
        );
    end component;

    component ProductSelector
        Port (
            product_3 : in STD_LOGIC;
            product_6 : in STD_LOGIC;
            product_7 : in STD_LOGIC;
            product_12 : in STD_LOGIC;
            product_15 : in STD_LOGIC;
            product_value : out integer range 0 to 31
        );
    end component;

    component seven_segment_display_VHDL
        Port ( 
            clock_100Mhz : in STD_LOGIC;
            reset : in STD_LOGIC;
            value1 : in integer range 0 to 31;
            value2 : in integer range 0 to 31;
            Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0);
            LED_out : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;
    
    component ChangeCalculator
        Port (
            coin_total : in integer range 0 to 31;
            product_selected : in integer range 0 to 31;
            change_value : out integer range 0 to 31
        );
    end component;

    component T_FF
        Port (
            T : in STD_LOGIC;
            Clock : in STD_LOGIC;
            Reset : in STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;

    -- Signal declarations
    signal total_value: integer range 0 to 31;
    signal product_value: integer range 0 to 31;
    signal purchase_confirmed: STD_LOGIC;
    signal change_value: integer range 0 to 31;
    signal display_value1, display_value2: integer range 0 to 31;
    
    -- Slower clock for D Flip-Flop
    signal slower_clock_counter: integer range 0 to 50000000 := 0;
    signal slower_clock: STD_LOGIC := '0';

begin

    process(clock_100Mhz, reset)
begin
    if reset = '1' then
        slower_clock_counter <= 0;
        slower_clock <= '0';
    elsif rising_edge(clock_100Mhz) then
        if slower_clock_counter >= 50000000 then
            slower_clock <= not slower_clock;
            slower_clock_counter <= 0;
        else
            slower_clock_counter <= slower_clock_counter + 1;
        end if;
    end if;
end process;

    t_ff_inst: T_FF port map(
        T => confirm_purchase,
        Clock => slower_clock, 
        Reset => reset,       
        Q => purchase_confirmed
    );
    
    purchase_confirmed_led <= purchase_confirmed;
        
    -- Instantiate the CoinConverter
    coinConverter_inst: CoinConverter port map(
        coin_1 => coin_1,
        coin_2 => coin_2,
        coin_5 => coin_5,
        coin_10 => coin_10,
        total_value => total_value
    );

    -- Instantiate the ProductSelector
    productSelector_inst: ProductSelector port map(
        product_3 => product_3,
        product_6 => product_6,
        product_7 => product_7,
        product_12 => product_12,
        product_15 => product_15,
        product_value => product_value
    );

    -- Instantiate the seven_segment_display_VHDL
    seven_seg_display_inst: seven_segment_display_VHDL port map(
        clock_100Mhz => clock_100Mhz,
        reset => reset,
        value1 => display_value1,
        value2 => display_value2,
        Anode_Activate => Anode_Activate,
        LED_out => LED_out
    );
    
    changeCalculator_inst: ChangeCalculator port map(
        coin_total => total_value,
        product_selected => product_value,
        change_value => change_value
    );
    
    process(purchase_confirmed, get_change, total_value, change_value)
    begin
        if purchase_confirmed = '1' and get_change = '1' and total_value >= product_value then
            display_value1 <= change_value;
            display_value2 <= 0; -- Display change
        else
            display_value1 <= total_value;
            display_value2 <= product_value; -- Display coin total and product value
        end if;
    end process;

end Behavioral;
