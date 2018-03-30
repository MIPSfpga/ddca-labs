rem recreate a temp folder for all the simulation files

rd /s /q sim
md sim
cd sim

rem compile verilog files for simulation

iverilog -o gray_cnt.out -s gray_cnt_out ../../gray_cnt.v ../gray_cnt_tb.v

rem run the simulation and finish on $stop

vvp -l gray_cnt.log -n gray_cnt.out

rem show the simulation results in GTKwave

gtkwave -T ../../../common/cfg.tcl dump.vcd

rem return to the parent folder

cd ..
