library IEEE;
use IEEE.std_logic_1164.all;


entity series_parallel_converter is
generic(n:integer:=24);
port(data_input,clk,reset:in bit;
      data_out:out bit_vector(23 downto 0));
end series_parallel_converter;

architecture behavior of series_parallel_converter is
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