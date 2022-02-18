`include "fullAdder.v"

module add_64 (x, y, z);

input [63:0] x, y;
output [63:0] z;

wire c[0:64]; 
assign c[0] = 0; 

genvar i; 
generate for (i = 0; i <= 64; i=i+1) begin
        fullAdder adder(
            .c_in(c[i]),
            .a(x[i]),
            .b(y[i]),
            .sum(z[i]),
            .c_out(c[i+1])
        );
    end
endgenerate

endmodule