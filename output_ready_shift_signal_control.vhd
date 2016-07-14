library IEEE;
use IEEE.std_logic_1164.all;


entity output_ready_shift_signal_control is
generic(n:integer:=116);
port(data_input,clk,reset:in bit;
      data_out:out bit);
end output_ready_shift_signal_control;

architecture behavior of output_ready_shift_signal_control is
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
data_out<=internal(0);
end behavior;