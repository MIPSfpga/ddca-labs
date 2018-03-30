#!/usr/bin/env bash
SIM_DIR="sim/"
## Create simulation directory
echo "################################################"
echo "Recreate a temp folder for all simulation files"
echo "################################################"
rm -rf  ${SIM_DIR}
mkdir   ${SIM_DIR}
cd      ${SIM_DIR}


iverilog -o crc_ser.out -s crc_ser_tb ../../crc_ser.v ../crc_ser_tb.v
vvp -l crc_ser.log -n crc_ser.out
gtkwave -T ../../../common/cfg.tcl dump.vcd
