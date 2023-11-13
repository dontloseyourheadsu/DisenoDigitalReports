library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb is
end entity;

architecture testbench of tb is
component DEMUX is
Port ( A : in STD_LOGIC;
       S : in STD_LOGIC;
       Y0 : out STD_LOGIC; 
       Y1 : out STD_LOGIC);
end component;

signal A_in, S_in, Y0_out, Y1_out : STD_LOGIC;

begin

uut: DEMUX port map(
A => A_in, 
S => S_in,
Y0 => Y0_out, 
Y1 => Y1_out);

stim: process
begin

A_in <= '1';
S_in <= '1';
wait for 1 ns;


A_in <= '1';
S_in <= '0';
wait for 1 ns;


wait;

end process;
end testbench;