library IEEE;
use IEEE.std_logic_1164.all;

entity LAN is
   port(input:in bit_vector(32 downto 0);
        chip_enable,system_receive_clock,system_clock,address_convert_clock: in bit;
        preclear_generation_clock,bus_clock,ram_oe,ram_we:in bit;
        input_fifo_ready_tx,input_fifo_ready_rx,data_in_tx,or_in_tx,half_full_tx: in bit;  ---from input(tx) & output(rx) FIFO  
        clk_out_rx,clock_out_tx:out bit;   --- clk_out_rx to output FIFO as write clock,clock_out_tx as clk signal to input FIF as read clk
        ethernet_address_input:in bit_vector(47 downto 0);
        station_address_input:in bit_vector(2 downto 0);
        packet_out:out bit_vector(32 downto 0);
        data_out: out bit);
end LAN;

architecture behavior of LAN is

component station_latch 
port(ins:in bit_vector(32 downto 0);
      outs:out bit_vector(32 downto 0);
      clk,pwr_reset:in bit);
end component;

component preclear_signal_generator 
port(clk,I_EN,I:in bit;
     Q,Q_EN:out bit);
end component;

component bus_clock_generator 
port(clk,I_EN,I:in bit;
     Q,Q_EN:out bit);
end component;

component communication_control 
port(dest_addr:in bit_vector(2 downto 0);
     flag_in:in bit_vector(1 downto 0);
     comp_en:in bit;
     send,receive,send_empty,resend:out bit);  
end component;

component send_signal_control 
port( input_fifo_ready,send_signal_in,output_ready_arrive,send_empty,power_reset:in bit;
      send_signal_out,clear_2_1_enable:out bit);
end component;

component receive_signal_control 
port( in_src_addr:in bit_vector(2 downto 0);
      in_flag,latch_en,receive_in,power_reset:in bit;
      receive_out:out bit);
end component;

component ack_nack 
port(bus_clk,rec_en0,receive_enable,fifo_inready,counter_stop:in bit;
     send_ack,send_nack:out bit);
end component;

component parallel_series_converter
port(data_in :in bit_vector(23 downto 0);
       addr_in:in bit_vector(4 downto 0);
       oe:in bit;
       data_out:out bit);
end component;

component preclear_signal_generator_1 
port(clk,I_EN,I:in bit;
     Q:out bit);
end component;

component five_bit_counter 
port(power_up_reset,pc,clk:in bit;
     counter_out:out bit_vector(4 downto 0) ;
     clk_out,counter_stop:out bit);
end component;

component series_parallel_converter
generic(n:integer:=24);
port(data_input,clk,reset:in bit;
      data_out:out bit_vector(23 downto 0));
end component;

component data_shift_component 
generic(n:integer:=116);
port(data_input,clk,reset:in bit;
      data_out:out bit_vector(115 downto 0));
end component;

component output_ready_shift_signal_control 
generic(n:integer:=116);
port(data_input,clk,reset:in bit;
      data_out:out bit);
end component;

component shift_control 
 port(fifo_or,sys_clock,clock,counter_stop,shift_stop: in bit;
      count: in bit_vector(4 downto 0);
      clk_1,clk_2: out bit);
end component;

component preamble_identifier 
port(in_p:in bit_vector(63 downto 0);
     flag_out:out bit);
end component;

component input_control_component 
port(data_in:in bit;
     or_in,half_full,clock_in:in bit;
     data_out:out bit;
     or_out,clock_out:out bit);
end component;

component mac_address_register 
port(clock:in bit;
      data_in:in bit_vector(47 downto 0);
      data_out:out bit_vector(47 downto 0));
end component;

component three_bit_counter 
port(power_reset,clear,clock:in bit;
     count_out:out bit_vector(2 downto 0));
end component;

component static_RAM 
port(we,oe:in bit;
     write_stn_addr:in bit_vector(2 downto 0);
     mac_addr_in: in bit_vector(47 downto 0);
     read_stn_addr: in bit_vector(2 downto 0);
     mac_addr_out: out bit_vector(47 downto 0));
end component;

component mac_address_converter 
port(convert_enable:in bit;
    mac_addr_in,ram_mac_addr_in:in bit_vector(47 downto 0);
    stn_addr_in:in bit_vector(2 downto 0);
    stn_addr_out:out bit_vector(2 downto 0));
end component;

component output_control_component 
port(send_ack,send_nack,send_empty,send_data,resend:in bit;
     latch_in:in bit_vector(32 downto 0);
     shift_data_in:in bit_vector(23 downto 0);
     shift_dest_in:in bit_vector(2 downto 0);
     shift_flag_2:in bit;
     packet_out:out bit_vector(32 downto 0));
end component;

signal x1,x3,x4,x5,x6,x7,x8,x9,x11,x13,x14,x15,x16,x18,x19,x20,x21,x22,x23,x24,x25,x26,x30,x31,x34,x35,x36:bit;
signal x2:bit_vector(32 downto 0);
signal x10,x17:bit_vector(4 downto 0);
signal x12:bit_vector(115 downto 0);
signal x27,x33:bit_vector(2 downto 0);
signal x28,x29:bit_vector(47 downto 0);
signal x32:bit_vector(23 downto 0);

begin

L1:station_latch port map(input,x2,x1,chip_enable);

L2:bus_clock_generator port map(bus_clock,chip_enable,bus_clock,x1,x3);

L3:communication_control port map(x2(28 downto 26),x2(25 downto 24),x3,x4,x5,x6,x7); 

L4:send_signal_control port map(input_fifo_ready_tx,x4,x14,x6,chip_enable,x35,x13);

L5:receive_signal_control port map(x2(31 downto 29),x2(32),x3,x5,chip_enable,x8);

L6:ack_nack port map(x1,x5,x8,input_fifo_ready_rx,x11,x30,x31);

L7:parallel_series_converter port map(x2(23 downto 0),x10,input_fifo_ready_rx,data_out);

L8:preclear_signal_generator_1 port map(preclear_generation_clock,x3,x8,x9);

L9:five_bit_counter port map(chip_enable,x9,system_receive_clock,x10,clk_out_rx,x11);

L10:series_parallel_converter port map(x12(0),x18,chip_enable,x32);

L11:data_shift_component port map(x21,x19,chip_enable,x12);

L12:output_ready_shift_signal_control port map(x22,system_clock,chip_enable,x14);

L13:five_bit_counter port map(chip_enable,x25,system_clock,x17,x15,x16);

L14:shift_control port map(x14,system_clock,x15,x16,x20,x17,x18,x19);

L15:preamble_identifier port map(x12(63 downto 0),x20);

L16:input_control_component port map(data_in_tx,or_in_tx,half_full_tx,x19,x21,x22,clock_out_tx);

L17:preclear_signal_generator_1 port map (preclear_generation_clock,x14,x14,x23);

L18:preclear_signal_generator_1 port map (preclear_generation_clock,x13,x6,x24);

x25<= x23 or x24;

L19:mac_address_register port map(x20,x12(110 downto 63),x28);

L20:three_bit_counter port map(chip_enable,x26,address_convert_clock,x27);

L21:preclear_signal_generator_1 port map (preclear_generation_clock,chip_enable,x20,x26);

L22:static_RAM port map(ram_we,ram_oe,station_address_input,ethernet_address_input,x27,x29);

L23:mac_address_converter port map(address_convert_clock,x28,x29,x27,x33);

x34<=x20 and x14;

L24:output_control_component port map(x30,x31,x6,x35,x7,x2,x32,x33,x34,packet_out);

end behavior;