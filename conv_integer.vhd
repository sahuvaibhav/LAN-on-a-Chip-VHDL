library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity conv_integer is
port(a: in bit_vector(2 downto 0);
      b: out integer);
end conv_integer;

architecture bahavior of  conv_integer is
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
b<= conv_integer(a);
end bahavior;

