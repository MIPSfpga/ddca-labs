rem recreate a temp folder for all the simulation files

rd /s /q sim
md sim
cd sim

rem compile verilog files for simulation

iverilog -o crc32.out -s crc32_tb ../../crc32.v ../crc32_tb.v

rem run the simulation and finish on $stop

vvvp -l crc32.log -n crc32.out

rem show the simulation results in GTKwave

gtkwave -T ../../../common/cfg.tcl dump.vcd

rem return to the parent folder

cd ..
