
# create modelsim working library

vlib work

# compile all the Verilog sources

vlog ../../tone_gen.v
vlog ../tone_gen_tb.v

set top=tone_gen_tb
# open the testbench module for simulation

vsim -novopt work.tone_gen_tb

# add all testbench signals to time diagram


add wave -radix bin sim:/tone_gen_tb/clk
add wave -radix bin sim:/tone_gen_tb/rst_n
add wave -radix bin sim:/tone_gen_tb/tone_freq

# run the simulation

run -all

# expand the signals time diagram

