module and_64(x, y, z); 

input [63:0] x, y;
output [63:0] z;

for (integer i = 0; i < 64; i++) begin
    z[i] = x[i] ^ y[i];
end

endmodule