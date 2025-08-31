module dmem(
    input clk,
    input [31:0] A,
    input [31:0] WD,
    input WE,
    output [31:0] RD
);
reg [31:0] ram[63:0];
assign RD = ram[A[31:2]];
always@(posedge clk) begin
    if(WE) ram[A[31:2]] <= WD;
    //else ram[A] <= ram[A];
end
initial begin
    ram[0] = 32'hdeadbeef;
    ram[1] = 32'hdeadbeef;
    ram[2] = 32'hdeadbeef;
    ram[3] = 32'hdeadbeef;
    ram[4] = 32'hdeadbeef;
    ram[5] = 32'hdeadbeef;
    ram[6] = 32'hdeadbeef;
    ram[7] = 32'hdeadbeef;
    ram[8] = 32'hdeadbeef;
end

endmodule