module testbench();

reg [11:0]localidad;
wire [7:0]respuesta;

memoriaROM b(localidad,respuesta);

initial begin
  #1
  $display("   Localidad   | Respuesta");
  $display("--------------------------");
  $monitor("   %b | %b", localidad, respuesta);
    localidad = 12'b000000000000;
  #1localidad = 12'b000000000001;
  #1localidad = 12'b000000000010;
  #1localidad = 12'b000000000011;
  #1localidad = 12'b000000000100;
  #1localidad = 12'b000000000101;
  #1localidad = 12'b000000000110;
  #1localidad = 12'b000000000111;
  #1localidad = 12'b000000001000;
  #1localidad = 12'b000000001001;

end

initial
  #11 $finish;

initial begin
  $dumpfile("Alejandro-Duarte-19446-21-memoria_tb.vcd");
  $dumpvars(0, testbench);
end


endmodule
