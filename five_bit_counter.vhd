library IEEE;
use IEEE.std_logic_1164.all;

entity five_bit_counter is
port(power_up_reset,pc,clk:in bit;
     counter_out:out bit_vector(4 downto 0) ;
     clk_out,counter_stop:out bit);
end five_bit_counter;

architecture behavior of five_bit_counter is
type state is range 0 to 27;
signal pr_state,nx_state: state;
begin

process(clk,power_up_reset)
begin
if(power_up_reset='1')then
  pr_state<=27;
elsif(power_up_reset 'event and power_up_reset='0')then
pr_state<=27;
elsif(clk 'event and clk='1')then
  pr_state<=nx_state;
  end if;


end process;

process(pr_state,clk,pc)
begin

if(clk='1')then
case pr_state is
  when 0=>
    counter_stop<='0';
    nx_state<=1;
  when 1=>
    counter_stop<='0';
    nx_state<=2;
  when 2=>
    counter_stop<='0';
    counter_out<="00011";
    nx_state<=3;
  when 3=>
    counter_stop<='0';
    counter_out<="00010";
    clk_out<=clk;
    nx_state<=4; 
  when 4=>
    counter_stop<='0';
    counter_out<="00110";
    clk_out<=clk;
    nx_state<=5; 
  when 5=>
    counter_stop<='0';
    counter_out<="00111";
    clk_out<=clk;
    nx_state<=6;
  when 6=>
    counter_stop<='0';
    counter_out<="00101";
    clk_out<=clk;
    nx_state<=7;
  when 7=>
    counter_stop<='0';
    counter_out<="00100";
    clk_out<=clk;
    nx_state<=8;
  when 8=>
    counter_stop<='0';
    counter_out<="01100";
    clk_out<=clk;
    nx_state<=9;
  when 9=>
    counter_stop<='0';
    counter_out<="01101";
    clk_out<=clk;
    nx_state<=10;
  when 10=>
    counter_stop<='0';
    counter_out<="01111";
    clk_out<=clk;
    nx_state<=11;
  when 11=>
    counter_stop<='0';
    counter_out<="01110";
    clk_out<=clk;
    nx_state<=12;
  when 12=>
    counter_stop<='0';
    counter_out<="01010";
    clk_out<=clk;
    nx_state<=13;
  when 13=>
    counter_stop<='0';
    counter_out<="01011";
    clk_out<=clk;
    nx_state<=14;
  when 14=>
    counter_stop<='0';
    counter_out<="01001";
    clk_out<=clk;
    nx_state<=15;
  when 15=>
    counter_stop<='0';
    counter_out<="01000";
    clk_out<=clk;
    nx_state<=16;
  when 16=>
    counter_stop<='0';
    counter_out<="11000";
    clk_out<=clk;
    nx_state<=17;
  when 17=>
    counter_stop<='0';
    counter_out<="11001";
    clk_out<=clk;
    nx_state<=18;
  when 18=>
    counter_stop<='0';
    counter_out<="11011";
    clk_out<=clk;
    nx_state<=19;
  when 19=>
    counter_stop<='0';
    counter_out<="11010";
    clk_out<=clk;
    nx_state<=20;
  when 20=>
    counter_stop<='0';
    counter_out<="11110";
    clk_out<=clk;
    nx_state<=21;
  when 21=>
    counter_stop<='0';
    counter_out<="11111";
    clk_out<=clk;
    nx_state<=22;
  when 22=>
    counter_stop<='0';
    counter_out<="11101";
    clk_out<=clk;
    nx_state<=23;
  when 23=>
    counter_stop<='0';
    counter_out<="11100";
    clk_out<=clk;
    nx_state<=24;
  when 24=>
    counter_stop<='0';
    counter_out<="10100";
    clk_out<=clk;
    nx_state<=25;
  when 25=>
    counter_stop<='0';
    counter_out<="10101";
    clk_out<=clk;
    nx_state<=26;
  when 26=>
    counter_stop<='0';
    clk_out<=clk;
    nx_state<=27;
  when 27=>
   counter_stop<='1';
    if(pc='1')then
     nx_state<=0;
    else
   nx_state<=27;
    end if; 
end case;
else
clk_out<='0';
end if;


end process;
end behavior;
   