
# create modelsim working library
vlib work

# compile all the Verilog sources
vlog  ../*.v ../../*.v 

# open the testbench module for simulation
vsim work.testbench

# add all testbench signals to time diagram
add wave -radix hex sim:/testbench/*
add wave -radix hex sim:/testbench/als/*

# run the simulation
run -all

# expand the signals time diagram
wave zoom full
