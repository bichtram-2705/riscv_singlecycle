module regfile(
    input clk, rst_n,
    input [4:0] A1, 
    input [4:0] A2, 
    input [4:0] A3,
    input [31:0] WD3,
    input WE3,
    output [31:0] RD1, RD2
);

reg [31:0] Reg[31:0];
assign RD1 = Reg[A1];
assign RD2 = Reg[A2];

always@(posedge clk or negedge rst_n) begin
    if(WE3) begin
        Reg[A3] <= WD3;
    end
end

initial begin
    Reg[0] = 32'd0;
    Reg[1] = 32'd1;
    Reg[2] = 32'd0;
    Reg[3] = 32'd12;
    Reg[4] = 32'd7;
    Reg[5] = 32'd6;
    Reg[6] = 32'd3;
    Reg[7] = 32'd3;
    Reg[8] = 32'd1;
    Reg[9] = 32'd0;
    Reg[10] = 32'd9;
    Reg[11] = 32'd8;
    Reg[12] = 32'd7;
    Reg[13] = 32'd6;
    
end
// always @(*) begin
//     Reg[0] = 32'd9;
//     Reg[1] = 32'd8;
//     Reg[2] = 32'd7;
//     Reg[3] = 32'd6;
//     Reg[4] = 32'd5;
//     Reg[5] = 32'd4;
//     Reg[6] = 32'd3;
//     Reg[7] = 32'd2;
//     Reg[8] = 32'd1;
// end
endmodule