library ieee;
use ieee.std_logic_1164.all;

entity communication_control is
port(dest_addr:in bit_vector(2 downto 0);
     flag_in:in bit_vector(1 downto 0);
     comp_en:in bit;
     send,receive,send_empty,resend:out bit);  
end communication_control;

architecture bahavior_comm of communication_control is
constant station_addr:bit_vector:="001";
begin
process(comp_en)
begin
if(comp_en='1')then
 if(dest_addr=station_addr)then
    case flag_in is
      when "00"=>
         send<='1';
      when "11"=>
        receive<='1';
      when "01"=>
        resend<='1';
      when "10"=>
        send_empty<='1';
end case;
end if;
elsif(comp_en='0')then
     send<='0';
     receive<='0';
     send_empty<='0';
     resend<='0';
end if;


end process;
end bahavior_comm;  