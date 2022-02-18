`include "fullAdder.v"

module sub_64(x, y, z);

input [63:0] x, y;
reg [63:0] w;
output [63:0] z;

//the following code is for taking twos complement of y
reg c[0:63];
wire d[0:64]; 
assign d[0] = 0; 

genvar i; 
generate for (i = 0; i < 64; i = i + 1) begin
  assign c[i] = 0; 
end
assign c[63] = 1;

endgenerate 
 
generate for (i = 0; i < 64; i=i+1) begin
        assign y[i] = ~y[i];
    end
endgenerate

generate for (i = 0; i < 64; i=i+1) begin
  fullAdder adder(
      .c_in(d[i]),
      .a(y[i])
      .b(c[i]),
      .sum(w[i]),
      .c_out(d[i+1])
  );
end
//finally the twos complement is generated and stored in w
//now add x and twos complement of y

assign d[0] = 0;  
generate for (i = 0; i < 64; i=i+1) begin
  fullAdder adder(
      .c_in(d[i]),
      .a(y[i])
      .b(x[i]),
      .sum(z[i]),
      .c_out(d[i+1])
  );
end
endmodule