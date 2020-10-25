module memoriaROM(input wire [11:0]localidad, output wire [7:0]respuesta);

reg [7:0] cerebro [0:4095];

  initial begin
    $readmemb("memory.list", cerebro);
  end

assign respuesta = cerebro[localidad];

endmodule
