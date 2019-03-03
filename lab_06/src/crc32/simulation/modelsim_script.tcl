
# create modelsim working library

vlib work

# compile all the Verilog sources

vlog ../../crc32.v
vlog ../crc32_tb.v

set top=crc32_tb
# open the testbench module for simulation

vsim -novopt work.crc32_tb

# add all testbench signals to time diagram


add wave -radix bin sim:/crc32_tb/clk
add wave -radix bin sim:/crc32_tb/rst_n
add wave -radix bin sim:/crc32_tb/crc_en
add wave -radix hex sim:/crc32_tb/crc32
add wave -radix hex sim:/crc32_tb/crc_out
add wave -radix hex sim:/crc32_tb/data
add wave -radix hex sim:/crc32_tb/rand_data

# run the simulation

run -all

# expand the signals time diagram

