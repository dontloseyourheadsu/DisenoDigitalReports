library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity testbench is
end testbench;

architecture Behavioral of testbench is

    -- Component Declaration for the Unit Under Test (UUT)
    component mux2x1
    port(
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        S : in  STD_LOGIC;
        Y : out STD_LOGIC
        );
    end component;

    --Inputs
    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal S : STD_LOGIC := '0';

    --Outputs
    signal Y : STD_LOGIC;

begin

    uut: mux2x1 port map (
        A => A,
        B => B,
        S => S,
        Y => Y
    );
    
    -- Stimulus process
    stim_proc: process
    begin   
        -- Test 1: S = '0'
        A <= '0'; B <= '0'; S <= '0'; wait for 100 ns;
        A <= '1'; B <= '0'; S <= '0'; wait for 100 ns;
        A <= '0'; B <= '1'; S <= '0'; wait for 100 ns;
        A <= '1'; B <= '1'; S <= '0'; wait for 100 ns;
        
        -- Test 2: S = '1'
        A <= '0'; B <= '0'; S <= '1'; wait for 100 ns;
        A <= '1'; B <= '0'; S <= '1'; wait for 100 ns;
        A <= '0'; B <= '1'; S <= '1'; wait for 100 ns;
        A <= '1'; B <= '1'; S <= '1'; wait for 100 ns;
        
        -- End simulation
        wait;
    end process;

end Behavioral;
