module tb;
  timeunit 1ns;
  timeprecision 1ps;

  logic clk;
  logic a;
  logic b;
  logic sel;
  logic mux_y;
  logic q;

  mux_register dut (.*);

  task automatic check(input logic expected_mux_y,
                       input logic expected_q,
                       input string step);
    #1ns;
    if (mux_y !== expected_mux_y || q !== expected_q)
      $fatal(1, "%s: mux_y=%b q=%b expected_mux_y=%b expected_q=%b",
             step, mux_y, q, expected_mux_y, expected_q);
  endtask

  initial begin
    $dumpfile("mux_register.vcd");
    $dumpvars(0, tb);

    clk = 0;
    a   = 0;
    b   = 1;
    sel = 0;
    #1ns;
    if (mux_y !== 0)
      $fatal(1, "MUX should select a when sel=0");

    clk = 1;
    check(0, 0, "first rising edge");
    clk = 0;
    #1ns;

    sel = 1;
    check(1, 0, "MUX changes before clock edge");

    clk = 1;
    check(1, 1, "second rising edge");

    $display("PASS: combinational output reacts and sequential output stores");
    $finish;
  end
endmodule
