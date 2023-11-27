library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seven_segment_display_VHDL is
    Port ( 
        clock_100Mhz : in STD_LOGIC;
        reset : in STD_LOGIC;
        value1 : in integer range 0 to 31;
        value2 : in integer range 0 to 31;
        Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0);
        LED_out : out STD_LOGIC_VECTOR (6 downto 0)
    );
end seven_segment_display_VHDL;

architecture Behavioral of seven_segment_display_VHDL is
    -- Signals for BCD conversion
    signal value1_BCD, value2_BCD: STD_LOGIC_VECTOR(7 downto 0);
    signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
    signal refresh_counter: STD_LOGIC_VECTOR (19 downto 0);
    signal LED_activating_counter: std_logic_vector(1 downto 0);

begin
    -- Process for converting integer to BCD
    value1_BCD <= conv_std_logic_vector(value1 mod 10, 4) 
    & conv_std_logic_vector(value1 / 10, 4);
    value2_BCD <= conv_std_logic_vector(value2 mod 10, 4) 
    & conv_std_logic_vector(value2 / 10, 4);

    -- Refresh process
    process(clock_100Mhz, reset)
    begin 
        if reset = '1' then
            refresh_counter <= (others => '0');
        elsif rising_edge(clock_100Mhz) then
            refresh_counter <= refresh_counter + 1;
        end if;
    end process;

   -- Anode activating process
    LED_activating_counter <= refresh_counter(19 downto 18);
    process(LED_activating_counter)
    begin
        case LED_activating_counter is
            when "00" =>
                Anode_Activate <= "1110"; 
                LED_BCD <= value2_BCD(3 downto 0);
            when "01" =>
                Anode_Activate <= "1101";
                LED_BCD <= value2_BCD(7 downto 4);
            when "10" =>
                Anode_Activate <= "1011";
                LED_BCD <= value1_BCD(3 downto 0);
            when "11" =>
                Anode_Activate <= "0111"; 
                LED_BCD <= value1_BCD(7 downto 4);
        end case;
    end process;
    
    -- 7-segment LED display decoder
    process(LED_BCD)
    begin
        case LED_BCD is
            when "0000" => LED_out <= "0000001"; -- "0"
            when "0001" => LED_out <= "1001111"; -- "1"
            when "0010" => LED_out <= "0010010"; -- "2"
            when "0011" => LED_out <= "0000110"; -- "3"
            when "0100" => LED_out <= "1001100"; -- "4"
            when "0101" => LED_out <= "0100100"; -- "5"
            when "0110" => LED_out <= "0100000"; -- "6"
            when "0111" => LED_out <= "0001111"; -- "7"
            when "1000" => LED_out <= "0000000"; -- "8"
            when "1001" => LED_out <= "0000100"; -- "9"
            when others => LED_out <= "1111111"; -- " "
        end case;

    end process;

end Behavioral;