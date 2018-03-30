#!/usr/bin/env bash
SIM_DIR="sim/"
## Create simulation directory
echo "################################################"
echo "Recreate a temp folder for all simulation files"
echo "################################################"
rm -rf  ${SIM_DIR}
mkdir   ${SIM_DIR}
cd      ${SIM_DIR}


iverilog -o crc32.out -s crc32_tb ../../crc32.v ../crc32_tb.v
vvp -l crc32.log -n crc32.out
gtkwave -T ../../../common/cfg.tcl dump.vcd
