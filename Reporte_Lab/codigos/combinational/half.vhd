-- Code your design here
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity half_subtractor is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Difference : out STD_LOGIC;
           Borrow : out STD_LOGIC);
end half_subtractor;

architecture Behavioral of half_subtractor is
begin
    Difference <= A xor B;
    Borrow <= not A and B;

end Behavioral;
