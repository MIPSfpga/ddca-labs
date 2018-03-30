rem recreate a temp folder for all the simulation files

rd /s /q sim
md sim
cd sim

rem compile verilog files for simulation

iverilog -o tone_gen.out -s tone_gen_tb ../../tone_gen.v ../tone_gen_tb.v

rem run the simulation and finish on $stop

vvvp -l tone_gen.log -n tone_gen.out

rem show the simulation results in GTKwave

gtkwave -T ../../../common/cfg.tcl dump.vcd

rem return to the parent folder

cd ..
