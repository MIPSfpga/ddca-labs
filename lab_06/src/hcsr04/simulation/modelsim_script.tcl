
# create modelsim working library

vlib work

# compile all the Verilog sources

vlog ../../hcsr04.v
vlog ../hcsr04_tb.v

set top=hcsr04_tb
# open the testbench module for simulation

vsim -novopt work.hcsr04_tb

# add all testbench signals to time diagram


add wave -radix bin sim:/hcsr04_tb/clk
add wave -radix bin sim:/hcsr04_tb/rst_n
add wave -radix bin sim:/hcsr04_tb/trig
add wave -radix bin sim:/hcsr04_tb/echo
add wave -radix hex sim:/hcsr04_tb/distance

# run the simulation

run -all

# expand the signals time diagram

