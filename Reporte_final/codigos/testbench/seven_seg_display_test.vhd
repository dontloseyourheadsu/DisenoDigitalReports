library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_segment_display_VHDL_tb is
end seven_segment_display_VHDL_tb;

architecture Behavioral of seven_segment_display_VHDL_tb is
    signal clock_100Mhz : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal value1 : integer range 0 to 31 := 0;
    signal value2 : integer range 0 to 31 := 0;
    signal Anode_Activate : STD_LOGIC_VECTOR (3 downto 0);
    signal LED_out : STD_LOGIC_VECTOR (6 downto 0);

begin
    uut: entity work.seven_segment_display_VHDL
        port map (
            clock_100Mhz => clock_100Mhz,
            reset => reset,
            value1 => value1,
            value2 => value2,
            Anode_Activate => Anode_Activate,
            LED_out => LED_out
        );

    stimulus: process
    begin
        reset <= '1';
        wait for 10 ns;
        reset <= '0';
        wait for 10 ns;

        value1 <= 10;
        value2 <= 12;
        clock_100Mhz <= '1';
        wait for 10 ns;
        clock_100Mhz <= '0';
        wait for 10 ns;

        value1 <= 7;
        value2 <= 13;
        clock_100Mhz <= '1';
        wait for 10 ns;
        clock_100Mhz <= '0';
        wait for 10 ns;

        value1 <= 15;
        value2 <= 4;
        clock_100Mhz <= '1';
        wait for 10 ns;
        clock_100Mhz <= '0';
        wait for 50 ns;

        wait;
    end process stimulus;
end Behavioral;