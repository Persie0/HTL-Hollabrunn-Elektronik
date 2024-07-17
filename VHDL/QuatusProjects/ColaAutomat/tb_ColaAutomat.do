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
vcom -93 -work work {NSL.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  $TestBench

#add wave *
add wave -label "Reset" Reset
add wave -label "CLK" CLK
add wave -label "E" E
add wave -label "F" F
add wave -label "K" K


view structure
view signals
run 400 ns
wave zoom full
