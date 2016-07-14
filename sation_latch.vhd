library IEEE;
use IEEE.std_logic_1164.all;
entity station_latch is
port ( ins :  in bit_vector(32 downto 0);
      outs  :  out bit_vector(32 downto 0);
      clk,pwr_reset : in bit);
end station_latch;

architecture behavior of station_latch is
begin
process (clk,pwr_reset)
begin
if (pwr_reset='1') then
   outs<="000000000000000000000000000000000";
elsif (clk'EVENT and clk='1') then
outs<=ins;
end if;
end process; 
end behavior;
   