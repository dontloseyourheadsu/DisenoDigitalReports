-- Code your testbench here
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity testbench is
end testbench;

architecture Behavioral of testbench is

    -- Component Declaration for the Unit Under Test (UUT)
    component half_subtractor
    port(
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Difference : out  STD_LOGIC;
        Borrow : out  STD_LOGIC
        );
    end component;

   --Inputs
   signal A : STD_LOGIC := '0';
   signal B : STD_LOGIC := '0';

    --Outputs
    signal Difference : STD_LOGIC;
    signal Borrow : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: half_subtractor port map (
        A => A,
        B => B,
        Difference => Difference,
        Borrow => Borrow
    );

    -- Stimulus process
    stim_proc: process
    begin   
        -- Test 1      
        A <= '0';
        B <= '0';
        wait for 100 ns;
        
        -- Test 2
        A <= '1';
        B <= '0';
        wait for 100 ns;

        -- Test 3
        A <= '0';
        B <= '1';
        wait for 100 ns;

        -- Test 4
        A <= '1';
        B <= '1';
        wait for 100 ns;
        
        -- End simulation
        wait;
    end process;

end Behavioral;
