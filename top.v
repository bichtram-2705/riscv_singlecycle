module top(
    input clk,
    input rst_n
);
wire [31:0] PC;
wire [31:0] Instr;
wire [31:0] ReadData;
wire [31:0] WriteData;
wire MemWrite;
wire [31:0] DataAdr;


riscvsingle riscv_single_inst(
    .clk(clk),
    .rst_n(rst_n),
    .PC(PC),
    .Instr(Instr),
    .MemWrite(MemWrite),
    .DataAdr(DataAdr),
    .WriteData(WriteData),
    .ReadData(ReadData)
);

imem imem_ints(
    .A(PC),
    .RD(Instr)
);

dmem dmem_inst(
    .clk(clk),
    .WE(MemWrite),
    .A(DataAdr),
    .WD(WriteData),
    .RD(ReadData)
);
endmodule