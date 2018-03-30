#!/usr/bin/env bash
SIM_DIR="sim/"
## Create simulation directory
echo "################################################"
echo "Recreate a temp folder for all simulation files"
echo "################################################"
rm -rf  ${SIM_DIR}
mkdir   ${SIM_DIR}
cd      ${SIM_DIR}


iverilog -o hcsr04.out -s hcsr04_tb ../../hcsr04.v ../hcsr04_tb.v
vvp -l hcsr04.log -n hcsr04.out
gtkwave dump.vcd
