library IEEE;
use IEEE.std_logic_1164.all;

entity preamble_identifier is
port(in_p:in bit_vector(63 downto 0);
     flag_out:out bit);
end preamble_identifier;

architecture behavior of preamble_identifier is
begin
process(in_p)
begin
flag_out<='1';

   
  if(in_p="1010101010101010101010101010101010101010101010101010101010101011")then
   flag_out<='0';
   else
   flag_out<='1';
   end if;

end process;
end behavior;