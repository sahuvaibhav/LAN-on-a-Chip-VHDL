library IEEE;
use IEEE.std_logic_1164.all;

entity three_bit_counter is
port(power_reset,clear,clock:in bit;
     count_out:out bit_vector(2 downto 0));
end three_bit_counter;

architecture behavior of three_bit_counter is
type state is range 0 to 7;
signal pr_state,nx_state: state;
begin

process(clock,power_reset)
begin
if(power_reset='1')then
  pr_state<=7;
elsif(power_reset 'event and power_reset='0')then
pr_state<=7;
elsif(clock 'event and clock='1')then
  pr_state<=nx_state;
  end if;
end process;

process(pr_state,clear)
begin
case pr_state is
   when 0 =>
   count_out<="111";
   nx_state<=1; 
   when 1 =>
   count_out<="101";
   nx_state<=2; 
   when 2 =>
   count_out<="100";
   nx_state<=3; 
   when 3 =>
   count_out<="000";
   nx_state<=4; 
   when 4 =>
   count_out<="001";
   nx_state<=5; 
   when 5 =>
   count_out<="011";
   nx_state<=6;
   when 6 =>
   count_out<="010";
   nx_state<=7; 
   when 7 =>
   count_out<="110";
     if(clear='1')then
        nx_state<=0;
      else
     nx_state<=7;
   end if;
end case;
end process;
end behavior;
   