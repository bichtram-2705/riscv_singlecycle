module PC #(
    parameter PC_WIDTH = 32
)(
    input clk,
    input rst_n,
    input [PC_WIDTH-1:0] PCNext,
    output reg [PC_WIDTH-1:0] PC
);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        PC <= 32'b0;
    end
    else begin
        PC <= PCNext;
    end
end
endmodule