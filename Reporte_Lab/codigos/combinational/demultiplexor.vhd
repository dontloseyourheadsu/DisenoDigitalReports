library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEMUX is
    Port ( A : in STD_LOGIC;
           S : in STD_LOGIC;
           Y0 : out STD_LOGIC; -- Output 0
           Y1 : out STD_LOGIC); -- Output 1
end DEMUX;

architecture Behavioral of DEMUX is
begin
    Y0 <= A and not S;
    Y1 <= A and S;
end Behavioral;
