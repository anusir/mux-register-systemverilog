module mux_register (
  input  logic clk,
  input  logic a,
  input  logic b,
  input  logic sel,
  output logic mux_y,
  output logic q
);
  assign mux_y = sel ? b : a;

  always_ff @(posedge clk)
    q <= mux_y;
endmodule
