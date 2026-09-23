# Combinational and Sequential Logic

This example connects a 2-to-1 multiplexer to a rising-edge D flip-flop. The MUX output represents combinational logic: it responds to the current data and select inputs. The flip-flop output represents sequential logic: it stores the MUX value sampled at a rising clock edge.

## Files

- `rtl/mux_register.sv`: synthesizable MUX and flip-flop.
- `tb/tb_mux_register.sv`: self-checking timing sequence.
- `files.f`: source paths relative to this folder.
- `expected.txt`: expected success message.

## Run with Icarus Verilog

Run these commands from this folder:

```text
iverilog -g2012 -s tb -o mux_register.vvp -f files.f
vvp mux_register.vvp
```

The testbench first captures `0`, changes the MUX output to `1` between clock edges, confirms that `q` still holds `0`, and then confirms that `q` captures `1` at the next rising edge. It also creates `mux_register.vcd` for waveform viewing.

## Expected result

```text
PASS: combinational output reacts and sequential output stores
```

These HDL files have not been compiled or simulated in the authoring environment. The success message above is expected output.
