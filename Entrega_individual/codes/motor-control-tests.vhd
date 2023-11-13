library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture sim of testbench is
    signal A, B, C, D: STD_LOGIC;
    signal M: STD_LOGIC;
    
    component MotorControl
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               C : in  STD_LOGIC;
               D : in  STD_LOGIC;
               M : out STD_LOGIC);
    end component;
    
begin
    DUT: MotorControl port map(A => A, B => B, C => C, D => D, M => M);
    
    stimulus: process
    begin
        -- Explicitly setting each combination for A, B, C, D
        A <= '0'; B <= '0'; C <= '0'; D <= '0'; wait for 10 ns;
        A <= '0'; B <= '0'; C <= '0'; D <= '1'; wait for 10 ns;
        A <= '0'; B <= '0'; C <= '1'; D <= '0'; wait for 10 ns;
        A <= '0'; B <= '0'; C <= '1'; D <= '1'; wait for 10 ns;
        A <= '0'; B <= '1'; C <= '0'; D <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; C <= '0'; D <= '1'; wait for 10 ns;
        A <= '0'; B <= '1'; C <= '1'; D <= '0'; wait for 10 ns;
        A <= '0'; B <= '1'; C <= '1'; D <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; C <= '0'; D <= '0'; wait for 10 ns;
        A <= '1'; B <= '0'; C <= '0'; D <= '1'; wait for 10 ns;
        A <= '1'; B <= '0'; C <= '1'; D <= '0'; wait for 10 ns;
        A <= '1'; B <= '0'; C <= '1'; D <= '1'; wait for 10 ns;
        A <= '1'; B <= '1'; C <= '0'; D <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; C <= '0'; D <= '1'; wait for 10 ns;
        A <= '1'; B <= '1'; C <= '1'; D <= '0'; wait for 10 ns;
        A <= '1'; B <= '1'; C <= '1'; D <= '1'; wait for 10 ns;
        
        wait;
    end process stimulus;

end sim;
