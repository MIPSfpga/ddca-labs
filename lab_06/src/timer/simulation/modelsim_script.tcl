
# create modelsim working library

vlib work

# compile all the Verilog sources

vlog ../../timer.v
vlog ../timer_tb.v

set top=timer_tb
# open the testbench module for simulation

vsim -novopt work.timer_tb

# add all testbench signals to time diagram


add wave -radix bin sim:/timer_tb/clk
add wave -radix bin sim:/timer_tb/rst_n
add wave -radix hex sim:/timer_tb/seconds
add wave -radix hex sim:/timer_tb/minuts

# run the simulation

run -all

# expand the signals time diagram

