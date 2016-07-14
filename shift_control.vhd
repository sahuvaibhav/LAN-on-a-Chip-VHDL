library IEEE;
use IEEE.std_logic_1164.all;

entity shift_control is
 port(fifo_or,sys_clock,clock,counter_stop,shift_stop: in bit;
      count: in bit_vector(4 downto 0);
      clk_1,clk_2: out bit);
end shift_control;

architecture behavior of shift_control is
begin
process(sys_clock)
begin

   if(fifo_or='0')then
       clk_2<=	sys_clock;
       clk_1<='0';
   end if;

  if(fifo_or='1')then
    if(shift_stop='0')then
       if(count/="10000" and counter_stop='0')then
           clk_1<=clock;
           clk_2<='0';
         else
           clk_1<='0';
           clk_2<='0';
       end if;
      else
           clk_1<=clock;
           clk_2<=clock;
    end if; 
  end if; 

end process;
end behavior;
  



   


