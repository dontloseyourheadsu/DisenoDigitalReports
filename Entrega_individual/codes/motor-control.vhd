library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MotorControl is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC; 
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           M : out STD_LOGIC);
end MotorControl;

architecture Behavioral of MotorControl is
begin
    process(A, B, C, D)
    begin
        M <= (not A) and D;
    end process;

end Behavioral;
