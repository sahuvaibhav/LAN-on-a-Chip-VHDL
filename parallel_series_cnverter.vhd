library IEEE;
use IEEE.std_logic_1164.all;

entity parallel_series_converter is
port(data_in :in bit_vector(23 downto 0);
       addr_in:in bit_vector(4 downto 0);
       oe:in bit;
       data_out:out bit);
end parallel_series_converter;

architecture behavior of parallel_series_converter is
begin
process(addr_in)
begin	
 if(oe='1')then
  case addr_in is
      when "00011"=>
      data_out<=data_in(0); 
      when "00010"=>
      data_out<=data_in(1); 
      when "00110"=>
      data_out<=data_in(2); 
      when "00111"=>
      data_out<=data_in(3); 
      when "00101"=>
      data_out<=data_in(4); 
      when "00100"=>
      data_out<=data_in(5); 
      when "01100"=>
      data_out<=data_in(6); 
      when "01101"=>
      data_out<=data_in(7); 
      when "01111"=>
      data_out<=data_in(8); 
      when "01110"=>
      data_out<=data_in(9); 
      when "01010"=>
      data_out<=data_in(10); 
      when "01011"=>
      data_out<=data_in(11); 
      when "01001"=>
      data_out<=data_in(12); 
      when "01000"=>
      data_out<=data_in(13); 
      when "11000"=>
      data_out<=data_in(14); 
      when "11001"=>
      data_out<=data_in(15); 
      when "11011"=>
      data_out<=data_in(16); 
      when "11010"=>
      data_out<=data_in(17); 
      when "11110"=>
      data_out<=data_in(18); 
      when "11111"=>
      data_out<=data_in(19); 
      when "11101"=>
      data_out<=data_in(20); 
      when "11100"=>
      data_out<=data_in(21); 
      when "10100"=>
      data_out<=data_in(22); 
      when "10101"=>
      data_out<=data_in(23);
      when others =>
      data_out<='0';
    end case;
else
data_out<='0';
end if;


end process;
end behavior;