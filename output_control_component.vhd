library IEEE;
use IEEE.std_logic_1164.all;

entity output_control_component is
port(send_ack,send_nack,send_empty,send_data,resend:in bit;
     latch_in:in bit_vector(32 downto 0);
     shift_data_in:in bit_vector(23 downto 0);
     shift_dest_in:in bit_vector(2 downto 0);
     shift_flag_2:in bit;
     packet_out:out bit_vector(32 downto 0));
   constant source_station_address:bit_vector(2 downto 0):="001";
end output_control_component;

architecture behavior of output_control_component is
begin
process(send_ack,send_nack,send_empty,send_data,resend)
begin

   if(send_ack='1')then
    packet_out(32)<='0';
    packet_out(31)<=source_station_address(2);
    packet_out(30)<=source_station_address(1);
    packet_out(29)<=source_station_address(0);
    packet_out(28)<=shift_dest_in(2); 
    packet_out(27)<=shift_dest_in(1);
    packet_out(26)<=shift_dest_in(0);
    packet_out(25)<='1';
    packet_out(24)<='0'; 
    packet_out(23)<='0';
    packet_out(22)<='0';
    packet_out(21)<='0';
    packet_out(20)<='0';
    packet_out(19)<='0';
    packet_out(18)<='0';
    packet_out(17)<='0';
    packet_out(16)<='0';
    packet_out(15)<='0';
    packet_out(14)<='0';
    packet_out(13)<='0';
    packet_out(12)<='0';
    packet_out(11)<='0';
    packet_out(10)<='0';
    packet_out(9)<='0';
    packet_out(8)<='0';
    packet_out(7)<='0';
    packet_out(6)<='0';
    packet_out(5)<='0';
    packet_out(4)<='0';
    packet_out(3)<='0';
    packet_out(2)<='0';
    packet_out(1)<='0';
    packet_out(0)<='0';
  end if;  
  if(send_nack='1')then
    packet_out(32)<='0';
    packet_out(31)<=source_station_address(2);
    packet_out(30)<=source_station_address(1);
    packet_out(29)<=source_station_address(0);
    packet_out(28)<=shift_dest_in(2); 
    packet_out(27)<=shift_dest_in(1);
    packet_out(26)<=shift_dest_in(0);
    packet_out(25)<='0';
    packet_out(24)<='1'; 
    packet_out(23)<='0';
    packet_out(22)<='0';
    packet_out(21)<='0';
    packet_out(20)<='0';
    packet_out(19)<='0';
    packet_out(18)<='0';
    packet_out(17)<='0';
    packet_out(16)<='0';
    packet_out(15)<='0';
    packet_out(14)<='0';
    packet_out(13)<='0';
    packet_out(12)<='0';
    packet_out(11)<='0';
    packet_out(10)<='0';
    packet_out(9)<='0';
    packet_out(8)<='0';
    packet_out(7)<='0';
    packet_out(6)<='0';
    packet_out(5)<='0';
    packet_out(4)<='0';
    packet_out(3)<='0';
    packet_out(2)<='0';
    packet_out(1)<='0';
    packet_out(0)<='0';
  end if;
 if(send_empty='1')then
    packet_out(32)<='0';
    packet_out(31)<=source_station_address(2);
    packet_out(30)<=source_station_address(1);
    packet_out(29)<=source_station_address(0);
    packet_out(28)<=shift_dest_in(2); 
    packet_out(27)<=shift_dest_in(1);
    packet_out(26)<=shift_dest_in(0);
    packet_out(25)<='0';
    packet_out(24)<='0'; 
    packet_out(23)<='0';
    packet_out(22)<='0';
    packet_out(21)<='0';
    packet_out(20)<='0';
    packet_out(19)<='0';
    packet_out(18)<='0';
    packet_out(17)<='0';
    packet_out(16)<='0';
    packet_out(15)<='0';
    packet_out(14)<='0';
    packet_out(13)<='0';
    packet_out(12)<='0';
    packet_out(11)<='0';
    packet_out(10)<='0';
    packet_out(9)<='0';
    packet_out(8)<='0';
    packet_out(7)<='0';
    packet_out(6)<='0';
    packet_out(5)<='0';
    packet_out(4)<='0';
    packet_out(3)<='0';
    packet_out(2)<='0';
    packet_out(1)<='0';
    packet_out(0)<='0';
  end if; 
 if(resend='1' or send_data='1')then
    packet_out(32)<=shift_flag_2;
    packet_out(31)<=source_station_address(2);
    packet_out(30)<=source_station_address(1);
    packet_out(29)<=source_station_address(0);
    packet_out(28)<=shift_dest_in(2); 
    packet_out(27)<=shift_dest_in(1);
    packet_out(26)<=shift_dest_in(0);
    packet_out(25)<='1';
    packet_out(24)<='1';
    packet_out(23)<=shift_data_in(23);
    packet_out(22)<=shift_data_in(22);
    packet_out(21)<=shift_data_in(21);
    packet_out(20)<=shift_data_in(20);
    packet_out(19)<=shift_data_in(19);
    packet_out(18)<=shift_data_in(18);
    packet_out(17)<=shift_data_in(17);
    packet_out(16)<=shift_data_in(16);
    packet_out(15)<=shift_data_in(15);
    packet_out(14)<=shift_data_in(14);
    packet_out(13)<=shift_data_in(13);
    packet_out(12)<=shift_data_in(12);
    packet_out(11)<=shift_data_in(11); 
    packet_out(10)<=shift_data_in(10);
    packet_out(9)<=shift_data_in(9);
    packet_out(8)<=shift_data_in(8);
    packet_out(7)<=shift_data_in(7); 
    packet_out(6)<=shift_data_in(6);
    packet_out(5)<=shift_data_in(5);
    packet_out(4)<=shift_data_in(4);
    packet_out(3)<=shift_data_in(3);
    packet_out(2)<=shift_data_in(2); 
    packet_out(1)<=shift_data_in(1);
    packet_out(0)<=shift_data_in(0);
   end if;
  if(send_ack='0'and send_nack='0' and send_empty='0' and send_data='0' and resend='0')then
    packet_out<=latch_in;
   end if;

end process;
end behavior;

    