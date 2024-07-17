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
set TestBench "tb_EdgeDetection"

# Add 
vcom -93 -work work {EdgeDetection.vhd}
vcom -93 -work work {tb_EdgeDetection.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  $TestBench

#add wave *
add wave -label "nRES" nRES
add wave -label "CLk" CLk
add wave -label "sigIn" sigIn
add wave -label "pulseOut" pulseOut

view structure
view signals
run 500 ns
wave zoom full
