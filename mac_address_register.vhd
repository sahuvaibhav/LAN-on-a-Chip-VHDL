library IEEE;
use IEEE.std_logic_1164.all;

entity mac_address_register is
port(clock:in bit;
      data_in:in bit_vector(47 downto 0);
      data_out:out bit_vector(47 downto 0));
end mac_address_register;

architecture behavior of mac_address_register is
begin
process(clock)
begin
if(clock 'event and clock='1')then
data_out<=data_in;
end if;
end process;
end behavior;
