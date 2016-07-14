library IEEE;
use IEEE.std_logic_1164.all;

entity send_signal_control is
port( input_fifo_ready,send_signal_in,output_ready_arrive,send_empty,power_reset:in bit;
      send_signal_out,clear_2_1_enable:out bit);
end send_signal_control;

architecture behavior of send_signal_control is
signal temp1,temp2,temp3: bit;
begin
process(input_fifo_ready,send_signal_in,output_ready_arrive,send_empty,power_reset)
begin
if(power_reset='0')then
   if(input_fifo_ready='1')then
      if(send_empty='1')then
         clear_2_1_enable<='0';
      elsif(temp3='1' and send_signal_in='0')then
        clear_2_1_enable<='1';
      end if;
      if(temp1='1' and send_signal_in='1')then
          send_signal_out<='1';
        else
         send_signal_out<='0';
      end if;
else
    send_signal_out<='0';
    clear_2_1_enable<='1';
   end if;
  if(output_ready_arrive='1')then
      clear_2_1_enable<='0'; 
    elsif(temp3='1' and send_signal_in='0')then
        clear_2_1_enable<='1';
       end if;   
    if(temp2='1' and send_signal_in='1')then
        send_signal_out<='1';
      else
        send_signal_out<='0';
    end if;  
        
    temp1<=send_empty;
    temp2<=output_ready_arrive;
    temp3<=send_signal_in;
else
    send_signal_out<='0';
    clear_2_1_enable<='1';
   end if;

end process;
end behavior;
