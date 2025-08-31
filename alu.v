module alu(
    input [31:0] SrcA, SrcB,
    input [2:0] ALUControl,
    output reg Zero,
    output Carry, OverFlow, Zero, Negative;
    output reg [31:0] ALUResult
);

// wire Cout;
// wire [31:0] Sum;
// assign {Cout, Sum} = (ALUControl[0] == 1'b0) ? A + B : (A + (~B) + 1);
// assign ALUResult = (ALUControl == 3'b000) ? Sum :
//                    (ALUControl == 3'b001) ? Sum :
//                    (ALUControl == 3'b010) ? A & B :
//                    (ALUControl == 3'b011) ? A | B :
//                    (ALUControl == 3'b101) ? {{31{1'b0}},(Sum[31])} : {32{1'b0}};

// assign

always @(*) begin
    case(ALUControl)
        3'b000: ALUResult = SrcA + SrcB;              // ADD
        3'b001: ALUResult = SrcA - SrcB;              // SUB
        3'b010: ALUResult = SrcA & SrcB;              // AND
        3'b011: ALUResult = SrcA | SrcB;              // OR
        3'b101: ALUResult = ($signed(SrcA) < $signed(SrcB)) ? 32'b1 : 32'b0;  // SLT
        default: ALUResult = 32'b0;
    endcase
end
always @(*) begin
    if(ALUResult == 32'h0) begin
        Zero = 1'b1;
    end
    else begin
        Zero = 1'b0; 
    end
end
endmodule