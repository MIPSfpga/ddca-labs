
# create modelsim working library

vlib work

# compile all the Verilog sources

vlog ../../crc_ser.v
vlog ../crc_ser_tb.v

set top=crc_ser_tb
# open the testbench module for simulation

vsim -novopt work.crc_ser_tb

# add all testbench signals to time diagram


add wave -radix bin sim:/crc_ser_tb/clk
add wave -radix bin sim:/crc_ser_tb/rst_n
add wave -radix bin sim:/crc_ser_tb/crc_en
add wave -radix bin sim:/crc_ser_tb/data
add wave -radix hex sim:/crc_ser_tb/buff
add wave -radix hex sim:/crc_ser_tb/crc5


# run the simulation

run -all

# expand the signals time diagram

