`timescale 1ns / 1ps

module alu#(
        parameter DATA_WIDTH = 32,
        parameter OPCODE_LENGTH = 4
        )
        (
        input logic [DATA_WIDTH-1:0]    SrcA,
        input logic [DATA_WIDTH-1:0]    SrcB,

                input logic [25:0]    Operation,
        output logic[DATA_WIDTH-1:0] ALUResult
        );

        
        always_comb
        begin
            case(Operation)
            26'b00000000000000000000000001: // OR
                    ALUResult = SrcA | SrcB;
            26'b00000000000000000000000010: // ADD/ADDI
                    ALUResult = SrcA + SrcB;
            26'b00000000000000000000000110: // SUB
                    ALUResult = SrcA - SrcB;
            26'b00000000000000000000001000: // AND/ ANDI
                    ALUResult = SrcA & SrcB;
            26'b00000000000000000000010000: // XOR
                    ALUResult = SrcA ^ SrcB;
            26'b00000000000000000000100000: // SLT/SLTI
                    ALUResult = (SrcA < SrcB)? 1 : 0;
            26'b00000000000000000001000000: // SRAI
                    ALUResult = SrcA >>> SrcB;
            26'b00000000000000000010000000: // SRLI
                    ALUResult = SrcA >> SrcB;
            26'b00000000000000000100000000: // SLLI
                    ALUResult = SrcA << SrcB;
            26'b00000000000000001000000000: // BEQ
                    ALUResult = (SrcA == SrcB)? 1 : 0; // equal
            26'b00000000000000010000000000: // BNE
                    ALUResult = (SrcA == SrcB)? 0 : 1; // nequal
            26'b00000000000000100000000000: // BLT
                    ALUResult = (SrcA < SrcB)? 1 : 0; // lower
            26'b00000000000001000000000000: // BGE
                    ALUResult = (SrcA < SrcB)? 0 : 1; // greater or equal
            26'b00000000000010000000000000: // JAL
            26'b00000000000100000000000000: // JALR
            26'b00000000001000000000000000: // LUI
            26'b00000000010000000000000000: // LW
            26'b00000000100000000000000000: // SW
            26'b00000001000000000000000000: // LB
            26'b00000010000000000000000000: // LH
            26'b00000100000000000000000000: // LBU
            26'b00001000000000000000000000: // SB
            26'b00010000000000000000000000:// SH

            default:
                    ALUResult = 0;
            endcase
        end
endmodule

