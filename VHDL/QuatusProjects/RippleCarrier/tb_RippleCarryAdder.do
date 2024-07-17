#Marvin Perzi
#20.03.2021

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


# Name of test bench entity
set TestBench "tb_RippleCarryAdder"

# Add 
vcom -93 -work work {tb_RippleCarryAdder.vhd}
vcom -93 -work work {RippleCarryAdder.vhd}
vcom -93 -work work {FullAdder.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  $TestBench

#add wave *
add wave -label "A3" A3
add wave -label "A2" A2
add wave -label "A1" A1
add wave -label "A0" A0
add wave -label "B3" B3
add wave -label "B2" B2
add wave -label "B1" B1
add wave -label "B0" B0
add wave -label "SUM3" SUM3
add wave -label "SUM2" SUM2
add wave -label "SUM1" SUM1
add wave -label "SUM0" SUM0
add wave -label "CO" CO
#add wave -label "curState" /tb_SimpleStateMachine/i1/curState

view structure
view signals
run 60 ns

wave zoom full
