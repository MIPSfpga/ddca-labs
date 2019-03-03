#!/usr/bin/env bash
SIM_DIR="sim/"
## Create simulation directory
echo "################################################"
echo "Recreate a temp folder for all simulation files"
echo "################################################"
rm -rf  ${SIM_DIR}
mkdir   ${SIM_DIR}
cd      ${SIM_DIR}


iverilog -o gray_cnt.out -s gray_cnt_tb ../../gray_cnt.v ../gray_cnt_tb.v
vvp -l gray_cnt.log -n gray_cnt.out
gtkwave -T ../../../common/cfg.tcl dump.vcd
