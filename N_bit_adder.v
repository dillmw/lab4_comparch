

module full_adder(x,y,c_out,c_in,s);
   input x,y,c_in;
   output s,c_out;
 assign s = (x^y) ^ c_in;
 assign c_out = (y&c_in)| (x&y) | (x&c_in);
endmodule // full_adder



module callAdder(A, B, cin, cout, s);
wire[31:0] carry;
input [31:0]A;
input [31:0]B;
output [31:0]s;
genvar i;
input cin;
output cout;

assign carry[0] = cin;
assign cout = carry[31];

generate

for(i=0; i<31; i=i+1) begin: full_adder

full_adder inst(A[i], B[i], carry[i+1], carry[i], s[i]);


end
endgenerate
endmodule


