module controller(
    input [6:0] op,
    input [2:0] funct3,
    input funct7b5,
    output reg Zero,
    output PCSrc,
    output [1:0] ResultSrc,
    output MemWrite,
    output [1:0] ImmSrc,
    output RegWrite,
    output [2:0] ALUControl,
    output ALUSrc
);
    wire [1:0] ALUOp;
    reg Branch;

maindec md(
    .op(op),
    .Zero(Zero),
    .PCSrc(PCSrc), 
    .ALUSrc(ALUSrc),
    .ResultSrc(ResultSrc),
    .MemWrite(MemWrite),
    .ImmSrc(ImmSrc),
    .RegWrite(RegWrite), 
    .Jump(Jump),
    .ALUOp(ALUOp)
);

aludec ad(
    .funct3(funct3),
    .funct7b5(funct7b5),
    .opb5(opb5),
    .ALUOp(ALUOp),
    .ALUControl(ALUControl)
);

//assign PCSrc = Branch & Zero | Jump;
assign PCSrc = 1'b0;
endmodule