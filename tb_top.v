`timescale 1ns/1ps

module tb_top;
    reg clk;
    reg rst_n;

    initial begin
        clk = 0;
        forever #5 clk=~clk;
    end

    initial begin
        rst_n = 0;
        #10;
        rst_n = 1;
    end
top dut(
    .clk(clk),
    .rst_n(rst_n)
);
endmodule