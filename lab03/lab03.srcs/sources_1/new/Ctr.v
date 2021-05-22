`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/17 08:13:57
// Design Name: 
// Module Name: Ctr
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


module Ctr(
    input [5:0] opCode,
    output regDst,
    output ALUsrc,
    output memToReg,
    output regWrite,
    output memRead,
    output memWrite,
    output branch,
    output [1:0] aluOp,
    output jump
    );
    
    reg regDst;
    reg ALUsrc;
    reg memToReg;
    reg regWrite;
    reg memRead;
    reg memWrite;
    reg branch;
    reg [1:0] aluOp;
    reg jump;
    
    always @(opCode)
    begin
        case(opCode)
        6'b000000://R type
        begin
            regDst=1;
            ALUsrc=0;
            memToReg=0;
            regWrite=1;
            memRead=0;
            memWrite=0;
            branch=0;
            aluOp=2'b10;
            jump=0;
        end
        6'b100011://lw type
        begin
            regDst=0;
            ALUsrc=1;
            memToReg=1;
            regWrite=1;
            memRead=1;
            memWrite=0;
            branch=0;
            aluOp=2'b00;
            jump=0;
        end
        6'b101011://sw type
        begin
            regDst=0;//x
            ALUsrc=1;
            memToReg=0;//x
            regWrite=0;
            memRead=0;
            memWrite=1;
            branch=0;
            aluOp=2'b00;
            jump=0;
        end
        6'b000100://beq type
        begin
            regDst=0;//x
            ALUsrc=0;
            memToReg=0;//x
            regWrite=0;
            memRead=0;
            memWrite=0;
            branch=1;
            aluOp=2'b01;
            jump=0;
        end
        6'b000010://jump
        begin
            regDst=0;
            ALUsrc=0;
            memToReg=0;
            regWrite=0;
            memRead=0;
            memWrite=0;
            branch=0;
            aluOp=2'b00;
            jump=1;
        end
        default:
        begin
            regDst=0;
            ALUsrc=0;
            memToReg=0;
            regWrite=0;
            memRead=0;
            memWrite=0;
            branch=0;
            aluOp=2'b00;
            jump=0;
        end
        endcase
    end

endmodule
