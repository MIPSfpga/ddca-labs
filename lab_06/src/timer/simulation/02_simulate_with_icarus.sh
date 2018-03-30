#!/usr/bin/env bash
SIM_DIR=sim/;
## Create simulation directory
echo "################################################"
echo "Recreate a temp folder for all simulation files"
echo "################################################"
rm -rf  ${SIM_DIR}
mkdir   ${SIM_DIR}
cd      ${SIM_DIR}


iverilog -o timer.out -s timer_tb ../../timer.v ../timer_tb.v
vvp -l timer.log -n timer.out
gtkwave dump.vcd
