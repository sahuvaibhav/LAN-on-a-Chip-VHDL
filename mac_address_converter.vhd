library IEEE;
use IEEE.std_logic_1164.all;

entity mac_address_converter is
port(convert_enable:in bit;
    mac_addr_in,ram_mac_addr_in:in bit_vector(47 downto 0);
    stn_addr_in:in bit_vector(2 downto 0);
    stn_addr_out:out bit_vector(2 downto 0));
end mac_address_converter;

architecture behavior of mac_address_converter is
begin
process(convert_enable)
begin
   if(convert_enable 'event and convert_enable='0')then
      if(mac_addr_in=ram_mac_addr_in)then
        stn_addr_out<=stn_addr_in;
      end if;
   end if;
end process;
end behavior;
     

