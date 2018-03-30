
# create modelsim working library

vlib work

# compile all the Verilog sources

vlog ../../gray_cnt.v
vlog ../gray_cnt_tb.v

set top=gray_cnt_tb
# open the testbench module for simulation

vsim -novopt work.gray_cnt_tb

# add all testbench signals to time diagram


add wave -radix bin sim:/gray_cnt_tb/clk
add wave -radix bin sim:/gray_cnt_tb/rst_n
add wave -radix bin sim:/gray_cnt_tb/enable
add wave -radix bin sim:/gray_cnt_tb/gray

# run the simulation

run -all

# expand the signals time diagram

