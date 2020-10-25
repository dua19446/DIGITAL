module testbench();

reg clk,reset,En,load;
reg [11:0]load2;
wire [11:0]q;

contador a(clk,reset,En,load,load2,q);

always
  #1 clk = ~clk;

initial begin
  #1
  $display(" reset En load load2 | q");
  $display("-------------------------------------");
  $monitor("   %b  %b  %b   %b   | %b", reset,En,load,load2, q);
    clk = 0; reset = 0; En = 0; load = 0; load2 = 12'b000000000000;
    #2 reset = 1;
    #2 reset = 0; En = 1;
    #2 reset = 0; En = 1;
    #2 reset = 0; En = 1;
    #2 reset = 0; En = 1;
    #2 reset = 0; En = 1;
    #2 reset = 0; En = 1;
    #2 reset = 0; En = 1;
    #2 reset = 0; En = 1;
    #2 reset = 0; En = 1;
    #2 reset = 0; En = 1;
    #2 reset = 0; En = 1;
    #2 reset = 0; En = 1; load = 1; load2 = 12'b000000010010;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 0; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 0; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 0; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 0; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 0; load = 0; load2 = 12'b000000000000;
    #2 reset = 1; En = 0; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 0; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 1; load2 = 12'b000000001100;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 1; load = 0; load2 = 12'b000000000000;
    #2 reset = 0; En = 0; load = 0; load2 = 12'b000000000000;

end

initial
  #100 $finish;

initial begin
  $dumpfile("Alejandro-Duarte-19446-seccion21-contador_tb.vcd");
  $dumpvars(0, testbench);
end
endmodule //testbench
