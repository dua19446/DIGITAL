module testbench();

// variables globlales
reg clk;
reg reset;
reg D, I, N;
reg [1:0]T;
wire [3:0]LCD;
wire [1:0]Gen;
wire LV, LR;

FSM_COM C(ckl, reset, D, I, N, [1:0]T, [3:0]LCD, [1:0]Gen, LV, LR);

always
  begin
    clk <= 1; #1 clk <= ~clk; #1;


initial begin
  $display("D  I  N  TO T1 | LCD0 LCD1 LCD2 LCD3  Gen0 Gen1  LV  LD");
  $display("-------------------");
  $monitor("%b %b %b %b %b |  %b   %b   %b   %b    %b   %b   %b  %b", D, I, N, T[1], T[0], [3]LCD, [2]LCD, [1]LCD, [0]LCD, [1]Gen, [0]Gen, LV, LR);
   clk = 0; reset = 0; D = 0; I = 0; N = 0; T0 = 0; T1 = 0;
   #1 reset = 1;
   #1 reset = 0;
   #1 D = 0;  I = 0;  N = 0;   T0 = 0; T1 = 1;
   #1 D = 0;  I = 0;  N = 0;   T0 = 0; T1 = 0;
   #10 D = 0;  I = 0;  N = 0;   T0 = 0; T1 = 0;
   #1 D = 0;  I = 0;  N = 1;   T0 = 0; T1 = 0;
   #20 D = 0;  I = 0;  N = 1;   T0 = 0; T1 = 0;
   #10 D = 0;  I = 0;  N = 0;   T0 = 0; T1 = 0;
end
