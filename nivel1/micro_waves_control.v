`include "nivel2/decoder_7seg/decoder.v"
`include "nivel2/entrada_timer_controle/control_timer.v"
`include "nivel2/timer_min_sec/timer_nivel2.v"
`include "nivel2/magnetron/magnetron.v"

module micro_waves_control(input wire startn, stopn, clearn, 
                           door_closed, [9:0] keypad, 
                           input clk, 
                           output wire [6:0] sec_ones_segs, 
                           sec_tens_segs, min_segs,
                           output wire mag_on);

    wire [3:0] unidades, dezenas, minutos;
    wire zero;
    wire saida_controle;
    wire D[3:0];
    wire loadn;
    wire pgt_1Hz;

    control_timer control_timer();

    magnetron magnetron(startn, stopn, clearn,door_closed, zero, mag_on); // saida zero do timer conectado em timer_done do mag_on

    timer_nivel2 timer_nivel2(D, pgt_1Hz, mag_on, loadn, clearn, unidades, dezenas, minutos, zero); // enable do timer é o mag_on

    decoder decoder();

endmodule