library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb is

end entity;

architecture testbench of tb is
component coin_selector is
Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       C : in STD_LOGIC;
       ten : out STD_LOGIC;
       five : out STD_LOGIC;
       one : out STD_LOGIC);

end component;

signal A_in, B_in, C_in, ten_out, five_out, one_out: STD_LOGIC;

begin

uut: coin_selector port map(
A => A_in,
B => B_in,
C => C_in,
ten => ten_out,
five => five_out,
one => one_out);

stim: process

begin

A_in <= '1';
B_in <= '1';
C_in <= '1';
wait for 1 ns;

A_in <= '1';
B_in <= '0';
C_in <= '1';
wait for 1 ns;

A_in <= '1';
B_in <= '1';
C_in <= '0';
wait for 1 ns;

A_in <= '1';
B_in <= '0';
C_in <= '0';
wait for 1 ns;

A_in <= '0';
B_in <= '1';
C_in <= '1';
wait for 1 ns;

A_in <= '0';
B_in <= '1';
C_in <= '0';
wait for 1 ns;

A_in <= '0';
B_in <= '0';
C_in <= '1';
wait for 1 ns;

A_in <= '0';
B_in <= '0';
C_in <= '0';
wait for 1 ns;

wait;

end process;
end testbench;
