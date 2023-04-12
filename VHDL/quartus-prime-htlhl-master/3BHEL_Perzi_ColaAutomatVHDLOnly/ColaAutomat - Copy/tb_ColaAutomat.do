#
# Template: A very simple ModelSim Do-File
#           (prepared for "schematic entry" FPGA design process)
#
# @author  Marvin Perzi
# @version 2020-11-12
# 

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


# Name of test bench entity
set TestBench "tb_ColaAutomat"

# Add 
vcom -93 -work work {ColaAutomat.vhd}
vcom -93 -work work {tb_ColaAutomat.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  $TestBench

#add wave *
add wave -label "nRes" nRes
add wave -label "CLK" CLK
add wave -label "E" E
add wave -label "F" F
add wave -label "K" K
add wave -label "curState" tb_colaautomat/i1/curState
add wave -label "nextState" tb_colaautomat/i1/nextState

view structure
view signals
run 640 ns
wave zoom full
