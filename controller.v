module controller(
    input [6:0] op,
    input [2:0] funct3,
    input funct7b5,
    input Zero,
    output PCSrc,
    output [1:0] ResultSrc,
    output MemWrite,
    output [1:0] ImmSrc,
    output RegWrite,
    output [2:0] ALUControl,
    output ALUSrc
);
    wire [1:0] ALUOp;
    wire Branch;

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
    .ALUOp(ALUOp),
    .Branch(Branch)
);

aludec ad(
    .funct3(funct3),
    .funct7b5(funct7b5),
    .opb5(op[5]),
    .ALUOp(ALUOp),
    .ALUControl(ALUControl)
);

//assign PCSrc = Branch & Zero | Jump;
assign PCSrc = Branch & Zero;
endmodule