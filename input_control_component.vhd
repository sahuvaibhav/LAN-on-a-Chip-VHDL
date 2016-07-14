library IEEE;
use IEEE.std_logic_1164.all;

entity input_control_component is
port(data_in:in bit;
     or_in,half_full,clock_in:in bit;
     data_out:out bit;
     or_out,clock_out:out bit);
end input_control_component; 

architecture behavior of input_control_component is
begin
process(clock_in)
begin
if(clock_in 'event and clock_in='1')then
    if(or_in='0')then
      data_out<='0';
      clock_out<='0';
      or_out<='0';
    elsif(or_in='1')then
       if(half_full='1')then
          clock_out <='1';
          or_out<='1';
          data_out<=data_in;
       else
          data_out<='0';
          clock_out<='0';
          or_out<='0';    
       end if;
 end if;
else
clock_out<='0';
end if;
end process;
end behavior;