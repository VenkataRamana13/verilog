`include "fullAdder.v";

module twos_complement(x, z);

input [63:0] x;

reg c[0:63];
wire d[0:64]; 
assign d[0] = 0; 

genvar i; 
generate for (i = 0; i < 64; i = i + 1) begin
  c[i] = 0; 
end
assign c[63] = 1;

endgenerate 

genvar j; 
generate for (j = 0; j < 64; j=j+1) begin
        x[j] = ~x[j];
    end
endgenerate

genvar k;
generate for (k = 0; k < 64; k=k+1) begin
  fullAdder adder(
      .c_in(d[i]),
      .a(x[i])
      .b(c[i]),
      .sum(z[i]),
      .c_out(d[i+1])
  );
end
    
endgenerate


endmodule