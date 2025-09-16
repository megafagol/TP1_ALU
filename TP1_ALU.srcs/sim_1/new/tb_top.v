`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2025 08:38:09 PM
// Design Name: 
// Module Name: tb_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_top( );
    
    
        //sizes
    localparam  NB_DATA       = 8;
    localparam  NB_OPCODE     = 6;
    localparam  N_ENABLE  = 3;
    // opcodes
    localparam  ADD = 6'b100000;
    localparam  SUB = 6'b100010;
    localparam  AND = 6'b100100;
    localparam  OR  = 6'b100101;
    localparam  XOR = 6'b100110;
    localparam  SRA = 6'b000011;
    localparam  SRL = 6'b000010;
    localparam  NOR = 6'b100111;
    //TB signals
    reg                         clk;
    reg                         test_start;
    reg [1:0]                   i;
    reg [NB_OPCODE * 8 -1:0]   codeOperacion; 

    //INPUTS
    reg [NB_DATA-1 : 0]         switchs;
    reg [N_ENABLE-1 : 0]    enable;
    reg                         reset;

    //OUTPUTS
    wire [NB_DATA-1 : 0] o_result;
    
initial begin
    #0
    clk = 1'b0;
    i = 2'b00;
    test_start = 1'b0;
    switchs = {NB_DATA {1'b0}};
    enable = {N_ENABLE {1'b0}};
    reset = 1'b1;
    
    codeOperacion = {ADD, SUB, AND, OR, XOR, SRA, SRL, NOR};
    
    #20
    reset = 1'b0;

    #80
    test_start = 1'b1;

    #1000
    $finish;
    end // initial

    top
    #(
        .NB_DATA       (NB_DATA),
        .NB_OPCODE      (NB_OPCODE),
        .N_ENABLE   (N_ENABLE)
    )
    u_top
    (
        .i_switch     (switchs),
        .i_clock        (clk),
        .i_enable   (enable),
        .i_reset        (reset),
        .o_result       (o_result)
        
    );

    always #10 clk = ~clk;

    /*
    1st cycle: assign first operand
    2nd cycle: assign second operand
    3rd cycle: assign opcode
    4th cycle: check result
    */
    always @(negedge clk)
    begin
        if(test_start)
        begin
            case(i)
            2'b00: //load first operand
                begin
                    switchs <= $urandom; 
                    enable <= {{N_ENABLE-1 {1'b0}}, 1'b1}; //001
                    #1
                    $display("El dato A es: %bb = %dd = %hh", switchs, $signed(switchs), switchs); 
                end

            2'b01: //load second operand
                begin
                    switchs <= $urandom;
                    enable <= enable << 1'b1; //010
                    #1
                    $display("El dato B es: %bb = %dd = %hh", switchs, $signed(switchs), switchs);
                end
            2'b10: //load opcode
                begin
                    switchs <= codeOperacion[($urandom % 8) * NB_OPCODE +: NB_OPCODE];
                    enable <= enable << 1'b1; //100
                    #1
                    $display("La operacion es: %bb = %dd = %hh", switchs, switchs, switchs);
                end
            2'b11: //show result
                begin 
                    #1
                    $display("El resultado es: %bb = %dd = %hh ", o_result, $signed(o_result), o_result);
                    $display("----------------------------------------------------");
                end
            default:
                begin
                    i <= 2'b00;
                    $display("ERROR");
                end
            endcase
            #5
            i <= i + 2'b01; //i++
        end
         
    end
    
endmodule
