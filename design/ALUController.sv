`timescale 1ns / 1ps

module ALUController (
    //Inputs
    input logic [1:0] ALUOp,  // 2-bit opcode field from the Controller--00: LW/SW/AUIPC; 01:Branch; 10: Rtype/Itype; 11:JAL/LUI
    input logic [6:0] Funct7,  // bits 25 to 31 of the instruction
    input logic [2:0] Funct3,  // bits 12 to 14 of the instruction
    input logic [6:0] opcode,

    //Output
    output logic [25:0] Operation  // operation selection for ALU
);

    assign Operation[0] = ((ALUOp == 2'b10) && (Funct3 == 3'b110) && (Func7 == 7'b0000000));  // R\I-or
    assign Operation[1] = ((ALUOp == 2'b10) && (Func3 == 3'b000)); // Add/Addi/Sub
    assign Operation[2] = ((ALUOp == 2'b10) && (Func3 == 3'b000) && (Func7 == 7'b0100000)); // SUB
    assign Operation[3] = ((ALUOp == 2'b10) && (Func3 == 3'b111)); // AND/ANDI
    assign Operation[4] = ((ALUOp == 2'b10) && (Func3 == 3'b100) && (Func7 == 7'b0000000)); // XOR
    assign Operation[5] = ((ALUOp == 2'b10) && (Func3 == 3'b010)); // SLT/SLTI 
    assign Operation[6] = ((ALUOp == 2'b10) && (Func3 == 3'b101) && (Func7 == 7'b0100000)); // SRAI
    assign Operation[7] = ((ALUOp == 2'b10) && (Func3 == 3'b101) && (Func7 == 7'b0000000)); // SRLI
    assign Operation[8] = ((ALUOp == 2'b10) && (Func3 == 3'b001) && (Func7 == 7'b0000000)); // SLLI
    assign Operation[9] = ((ALUOp == 2'b01) && (Func3 == 3'b000)); // BEQ
    assign Operation[10] = ((ALUOp == 2'b01) && (Func3 == 3'b001)); // BNE
    assign Operation[11] = ((ALUOp == 2'b01) && (Func3 == 3'b100)); // BLT
    assign Operation[12] = ((ALUOp == 2'b01) && (Func3 == 3'b101)); // BGE
    assign Operation[13] = ((ALUOp == 2'b11) && (opcode == 7'b1101111)); // JAL
    assign Operation[14] = ((ALUOp == 2'b11) && (opcode == 7'b1100111)); // JALR
    assign Operation[15] = ((ALUOp == 2'b11) && (opcode == 7'b0110111)); // LUI
    assign Operation[16] = ((ALUOp == 2'b00) && (Func3 == 3'b010) && (opcode == 7'b0000011)); // LW
    assign Operation[17] = ((ALUOp == 2'b00) && (Func3 == 3'b010) && (opcode == 7'b0100011)); // SW
    assign Operation[18] = ((ALUOp == 2'b00) && (Func3 == 3'b000) && (opcode == 7'b0000011)); // LB
    assign Operation[19] = ((ALUOp == 2'b00) && (Func3 == 3'b001) && (opcode == 7'b0000011)); // LH
    assign Operation[20] = ((ALUOp == 2'b00) && (Func3 == 3'b100) && (opcode == 7'b0000011)); // LBU
    assign Operation[21] = ((ALUOp == 2'b00) && (Func3 == 3'b000) && (opcode == 7'b0100011)); // SB
    assign Operation[22] = ((ALUOp == 2'b00) && (Func3 == 3'b001) && (opcode == 7'b0100011)); // SH
  
      
endmodule
