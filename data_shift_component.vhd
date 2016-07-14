library IEEE;
use IEEE.std_logic_1164.all;


entity data_shift_component is
generic(n:integer:=116);
port(data_input,clk,reset:in bit;
      data_out:out bit_vector(115 downto 0));
end data_shift_component;

architecture behavior of data_shift_component is
signal internal :bit_vector(n-1 downto 0);
begin
process(clk,reset)
begin
if(reset='1')then
internal<=(others=>'0');
elsif(clk 'event and clk='1')then
  internal<=data_input & internal(internal'left downto 1);
end if;
end process;
data_out<=internal;
end behavior;