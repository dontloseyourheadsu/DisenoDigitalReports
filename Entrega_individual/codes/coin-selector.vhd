library IEEE;
use IEEE.std_logic_1164.all;
entity coin_selector is

    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           ten : out STD_LOGIC;
           five : out STD_LOGIC;
           one : out STD_LOGIC);
end entity;

architecture Selection of coin_selector is
begin
    ten <= '1' when ((A = '1') and (B = '1') and (C = '1')) else '0';
    five <= '1' when (A = '0' and B = '1' and C = '1') else '0';
    one <= '1' when (A = '0' and B = '0' and C = '1') else '0';
    
end architecture;