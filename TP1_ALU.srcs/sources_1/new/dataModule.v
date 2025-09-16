`timescale 1ns / 1ps

module dataModule
#(
    parameter NB_DATA = 8
)
(
    input  wire signed [NB_DATA-1:0] i_data,
    output wire signed [NB_DATA-1:0] o_result,
    input  wire                      i_clock,    
    input  wire                      i_enable,
    input  wire                      i_reset
);

    reg signed [NB_DATA-1:0] result;
    assign o_result = result;
    
    always @(posedge i_clock) begin
        if (i_reset)
            result <= {NB_DATA{1'b0}};
        else if (i_enable)
            result <= i_data;
    end
    
endmodule
