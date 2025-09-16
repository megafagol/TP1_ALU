`timescale 1ns / 1ps

module top
#(
    parameter NB_DATA   = 8,
    parameter NB_OPCODE = 6,
    parameter N_ENABLE  = 3
)
(
    input  wire signed [NB_DATA-1:0] i_switch,
    input  wire [N_ENABLE-1:0]       i_enable,
    input  wire                      i_clock,    
    input  wire                      i_reset,
    output wire signed [NB_DATA-1:0] o_result,
    output wire                      o_carry,
    output wire                      o_zero
);

    // Wires de interconexión
    wire signed [NB_DATA-1:0]   w_dataA;
    wire signed [NB_DATA-1:0]   w_dataB;
    wire        [NB_OPCODE-1:0] w_opcode;

    // Registro A
    dataModule #(.NB_DATA(NB_DATA)) u_dataA (
        .i_data   (i_switch),
        .o_result (w_dataA),
        .i_clock  (i_clock),
        .i_enable (i_enable[0]),
        .i_reset  (i_reset)
    );

    // Registro B
    dataModule #(.NB_DATA(NB_DATA)) u_dataB (
        .i_data   (i_switch),
        .o_result (w_dataB),
        .i_clock  (i_clock),
        .i_enable (i_enable[1]),
        .i_reset  (i_reset)
    );

    // Registro Opcode (6 bits por default)
    dataModule #(.NB_DATA(NB_OPCODE)) u_opcode (
        .i_data   (i_switch[NB_OPCODE-1:0]),
        .o_result (w_opcode),
        .i_clock  (i_clock),
        .i_enable (i_enable[2]),
        .i_reset  (i_reset)
    );

    // ALU
    ALU #(
        .NB_DATA   (NB_DATA),
        .NB_OPCODE (NB_OPCODE)
    ) u_alu (
        .i_op_1   (w_dataA),
        .i_op_2   (w_dataB),             
        .i_opcode (w_opcode),
        .o_result (o_result),
        .o_carry (o_carry),
        .o_zero (o_zero)
    );

endmodule
