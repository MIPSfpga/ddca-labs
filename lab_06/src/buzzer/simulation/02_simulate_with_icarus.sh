#!/usr/bin/env bash
SIM_DIR="sim/"
## Create simulation directory
echo "################################################"
echo "Recreate a temp folder for all simulation files"
echo "################################################"
rm -rf  ${SIM_DIR}
mkdir   ${SIM_DIR}
cd      ${SIM_DIR}


iverilog -o tone_gen.out -s tone_gen_tb ../../tone_gen.v ../tone_gen_tb.v
vvp -l tone_gen.log -n tone_gen.out
gtkwave -T ../../../common/cfg.tcl dump.vcd
