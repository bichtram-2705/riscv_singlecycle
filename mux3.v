module mux3(
    input [31:0] in0,
    input [31:0] in1,
    input [31:0] in2,
    input [1:0] sel,
    output [31:0] mux_out
);
assign mux_out = (sel == 2'b00) ? in0 : 
                 (sel == 2'b01) ? in1 : in2;    
endmodule

