module ff_d_1(input clk, reset, D, output reg Q);
  always @ ( posedge clk, posedge reset) begin
    if (reset)
      Q <= 0;
    else
      Q <= D;
  end
  always @ ( posedge clk) begin
    if(set) begin
      Q <= 1'b1;
  end
endmodule

module ff_d_4(input clk, reset,set, input [3:0] D, output reg [3:0] Q);
 ff_d_1 U1(clk, reset, D[3], Q[3]);
 ff_d_1 U1(clk, reset, D[2], Q[2]);
 ff_d_1 U1(clk, reset, D[1], Q[1]);
 ff_d_1 U1(clk, reset, D[0], Q[0]);
 
endmodule
