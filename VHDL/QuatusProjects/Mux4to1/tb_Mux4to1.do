#
# Template: A very simple ModelSim Do-File
#           (prepared for "schematic entry" FPGA design process)
#
# @author  Marvin Perzi
# @version 2020-11-08
# 

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


# Name of test bench entity
set TestBench "tb_Mux4to1"

# Add 
vcom -93 -work work {Mux4to1.vhd}
vcom -93 -work work {tb_Mux4to1.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  $TestBench

#add wave *
add wave -label "A" A
add wave -label "B" B
add wave -label "C" C
add wave -label "D" D
add wave -label "S0" S0
add wave -label "S1" S1
add wave -label "Y" Y

view structure
view signals
run 400 ns
wave zoom full
