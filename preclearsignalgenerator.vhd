library IEEE;
use IEEE.std_logic_1164.all;

entity preclear_signal_generator is
port(clk,I_EN,I:in bit;
     Q,Q_EN:out bit);
end preclear_signal_generator;

architecture behavior of preclear_signal_generator is
type state is (a,b);
signal pr_state,nx_state:state;
signal temp:bit;
begin

process(clk,I_EN)
begin
if(I_EN='1')then
pr_state<=a;
elsif(clk 'event and clk='1')then
Q<=temp;
Q_EN<= not temp;
pr_state<=nx_state;
end if;
end process;

process(I,pr_state)
begin

case pr_state is
  when a =>
      if(I='0')then
       temp <='0'; 
         
        nx_state<=b;
      elsif(I='1')then
       temp<='0';
               
        nx_state<=a;

      end if;

  when b=>
       if(I='0')then
        temp<='0';
          
         nx_state<=b;
        elsif(I='1')then
         temp<='1';
            
          nx_state<=a;
        end if;

        end case;

end process;

end behavior;      