library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb is
end entity;

architecture testbench of tb is
component  mag_comparator is
port (A : in STD_LOGIC;
      B : in STD_LOGIC;
	  AeqB : out STD_LOGIC; 
      AltB : out STD_LOGIC;
      AgtB : out STD_LOGIC);
end component;

signal A_in : STD_LOGIC;
signal B_in : STD_LOGIC;
signal AeqB_out : STD_LOGIC;
signal AltB_out : STD_LOGIC;
signal AgtB_out : STD_LOGIC;

begin

uut:  mag_comparator port map(
A => A_in,
B => B_in,
AeqB => AeqB_out,
AltB => AltB_out,
AgtB => AgtB_out);

stim: process
begin

A_in <= '0';
B_in <= '0';
wait for 1 ns;

A_in <= '0';
B_in <= '1';
wait for 1 ns;

A_in <= '1';
B_in <= '0';
wait for 1 ns;

A_in <= '1';
B_in <= '1';
wait for 1 ns;

wait;

end process;
end testbench;