module flip_flop(input clk, reset,En, D, output reg Q);
  always @ (posedge clk or posedge reset)begin
    if (reset)
      Q <= 1'b0;
    else if (En)
      Q <= D;
  end
endmodule
