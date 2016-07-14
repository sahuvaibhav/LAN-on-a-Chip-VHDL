library IEEE;
use IEEE.std_logic_1164.all;

entity ack_nack is
port(bus_clk,rec_en0,receive_enable,fifo_inready,counter_stop:in bit;
     send_ack,send_nack:out bit);
end ack_nack;

architecture behavior of ack_nack is
begin
process(bus_clk)
begin
if (bus_clk 'event and bus_clk='1')then
  if(rec_en0='1')then
    if(receive_enable='1')then
       if(fifo_inready='1')then
         if(counter_stop='0')then
             send_ack<='1';
             send_nack<='0';
              else
                 send_ack<='0';
                 send_nack<='0';
                 end if;
          else
             send_ack<='0';
             send_nack<='1';
             end if;    
      else
         send_ack<='0';
         send_nack<='0';
         end if;    
   else
      send_ack<='0';
      send_nack<='0';
      end if;   
end if;
end process;
end behavior; 