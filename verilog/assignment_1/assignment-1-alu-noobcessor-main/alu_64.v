module alu_64 (x, y, cs, z);

input [63:0] x,y;
input [3:0] cs;
output [63:0] z;

`include "add_64.v"
`include "sub_64.v"
`include "and_64.v"
`include "xor_64.v"

always@(*)
begin
    case(cs)
    2'b00:
        z = add_64 (x,y);
    2'b01:
        z = sub_64(x,y);
    2'b10:
        z = and_64(x,y);
    2'b11:
        z = xor_64(x,y);
    endcase
end

endmodule