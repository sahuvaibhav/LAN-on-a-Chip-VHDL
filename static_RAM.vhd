library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity static_RAM is
port(we,oe:in bit;
     write_stn_addr:in bit_vector(2 downto 0);
     mac_addr_in: in bit_vector(47 downto 0);
     read_stn_addr: in bit_vector(2 downto 0);
     mac_addr_out: out bit_vector(47 downto 0));
end static_RAM;

architecture behavior of static_RAM is

type vector_array is array (0 to 7) of
bit_vector(47 downto 0);
signal memory:vector_array;

function conv_integer(signal vector: bit_vector(2 downto 0))
return integer is
variable result : integer range 0 to 2**vector'length-1;
begin
if(vector(vector'high)='1')then result:=1;
else result:=0;
end if;
for i in (vector'high-1) downto (vector'low) loop
 result:= result*2;
  if(vector(i)='1')then result:= result+1;
  end if;
end loop;
return result;
end conv_integer;



begin
process(we,oe,read_stn_addr,write_stn_addr)
variable y:integer range 0 to 7;
begin

   if(we='0' and oe='1')then
      y:=conv_integer(write_stn_addr);
      memory(y)<= mac_addr_in;
      end if;
    if(we='1' and oe='0')then
       y:=conv_integer(read_stn_addr);
       mac_addr_out<=memory(y);
       end if;

end process;
end behavior;

