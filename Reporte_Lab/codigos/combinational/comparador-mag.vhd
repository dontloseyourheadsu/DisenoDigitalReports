library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mag_comparator is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           AeqB : out STD_LOGIC; -- A equals B
           AltB : out STD_LOGIC; -- A less than B
           AgtB : out STD_LOGIC); -- A greater than B
end mag_comparator;

architecture Behavioral of mag_comparator is

begin
    AeqB <= '1' when (A = B) else '0';
    
    AltB <= '1' when (A < B) else '0';
    AgtB <= '1' when (A > B) else '0';
end Behavioral;