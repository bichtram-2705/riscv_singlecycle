module datapath(
    input clk,
    input rst_n,
    output [31:0] PC,
    input [31:0] Instr,
    output [31:0] ALUResult,
    output [31:0] WriteData,
    input [31:0] ReadData,
    input RegWrite,
    input [1:0] ImmSrc,
    input ALUSrc,
    input [2:0] ALUControl,
    input [1:0] ResultSrc,
    input PCSrc,
    output Zero
);
wire [31:0] PCNext;
wire [31:0] PCPlus4, PCTarget;
wire [31:0] ImmExt;
wire [31:0] RD1, RD2;

wire [31:0] SrcA, SrcB, Result;

mux mux_pc(
    .sel(PCSrc),
    .in0(PCPlus4),
    .in1(PCTarget),
    .mux_out(PCNext)
);

adder adder_PC(
    .a(PC),
    .b(32'd4),
    .y(PCPlus4)
);

adder adder_PCTarget(
    .a(PC),
    .b(ImmExt),
    .y(PCTarget)
);

PC PC_ints(
    .clk(clk),
    .rst_n(rst_n),
    .PCNext(PCNext),
    .PC(PC)  
);

extend extend_inst(
    .instr(Instr[31:7]),
    .immsrc(ImmSrc),
    .immext(ImmExt)
);

mux mux_imm(
    .sel(ALUSrc),
    .in0(RD2),
    .in1(ImmExt),
    .mux_out(SrcB)
);

regfile rf_inst(
    .clk(clk),
    .rst_n(rst_n),
    .A1(Instr[19:15]),
    .A2(Instr[24:20]),
    .A3(Instr[11:7]),
    .WD3(Result),
    .WE3(RegWrite),
    .RD1(SrcA),
    .RD2(RD2)
);

alu alu_inst(
    .SrcA(SrcA),
    .SrcB(SrcB),
    .ALUControl(ALUControl),
    .ALUResult(ALUResult),
    .Zero(Zero)
);

mux3 mux_result(
    .in0(ALUResult),
    .in1(ReadData),
    .in2(PCPlus4),
    .sel(ResultSrc),
    .mux_out(Result)
);

endmodule