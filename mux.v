module mux(
    input [31:0] in0,
    input [31:0] in1,
    input sel,
    output reg [31:0] mux_out
);

always @(*) begin
    if(sel == 1) mux_out = in1;
    else mux_out = in0;
end
endmodule

