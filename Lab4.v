module Lab4(A, B, cin, opcode, status, F);

input [31:0] A;
input [31:0] B;
input cin;
input [2:0] opcode;

output [3:0] status;
output [31:0] F;
wire [3:0] status;
wire [31:0] F;

wire [31:0] xout, andout, orout, norout;
wire [31:0] s;

assign xout = A^B;
assign andout = A&&B;
assign orout = A||B;
assign norout = ~A||B;
   
callAdder dd(A, B, cin, status[3], s);

assign status[0] = (F == 32'b0)?1:0;
assign status[1] = F[31];
assign status[2] = (~A[31] & ~B[31] & F[31]) ^ (A[31] & B[31] & ~F[31])?1:0;

wire [31:0] L, R;
wire [31:0] In8;

assign L = A << B;
assign R = A >> B;
	

mux8to1 mux( F,

  opcode,

  xout,
  
  andout,
  
  orout,

  norout,

  s,

  L,
  
  R,
  
  In8);

  
  endmodule
  
  