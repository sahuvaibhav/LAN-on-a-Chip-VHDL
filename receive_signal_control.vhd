library IEEE;
use IEEE.std_logic_1164.all;

entity receive_signal_control is
port( in_src_addr:in bit_vector(2 downto 0);
      in_flag,latch_en,receive_in,power_reset:in bit;
      receive_out:out bit);
end receive_signal_control;


architecture behavior of receive_signal_control is

begin
process(latch_en)
variable src_station_addr:bit_vector(2 downto 0):="000";
variable group_indicator:bit :='0';
begin
if(latch_en 'event and latch_en='1')then
   if(power_reset='0')then
      if(receive_in='1')then
         if(group_indicator='0' and in_flag='1')then
            group_indicator:=in_flag;
            src_station_addr:=in_src_addr;
            receive_out<='1';
         elsif(group_indicator='1' and in_flag='1')then
             if(in_src_addr=src_station_addr)then
                 receive_out<='1';
              else
            receive_out<='0';
       end if;
             
        elsif(group_indicator='1' and in_flag='0')then
             if(in_src_addr=src_station_addr)then
                 receive_out<='1';
                 src_station_addr:="000";
                 group_indicator:='0';
           else
            receive_out<='0';
       end if;
              end if;    
          else
            receive_out<='0';
       end if;
         else
            receive_out<='0';
  end if;     
end if; 
           
      
end process;
end behavior;