#
# Template: A very simple ModelSim Do-File
#           (prepared for "schematic entry" FPGA design process)
#
# Author:  WIH
# Version: 2019-10-22
# 

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


# Name of test bench entity
set TestBench "tb_SimpleCounter"

# Add 
vcom -93 -work work {SimpleCounter.vhd}
vcom -93 -work work {tb_SimpleCounter.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  $TestBench

#add wave *
add wave -label "RESET" RESET
add wave -label "CLK" CLK
add wave -label "Q1" Q1
add wave -label "Q0" Q0

view structure
view signals
run 200 ns
wave zoom full
