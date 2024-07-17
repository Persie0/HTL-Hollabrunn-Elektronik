#Marvin Perzi
#20.03.2021

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


# Name of test bench entity
set TestBench "tb_LedLogic"

# Add 
vcom -93 -work work {LedLogic.vhd}
vcom -93 -work work {tb_LedLogic.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  $TestBench

#add wave *
add wave -label "nRES" nRES
add wave -label "CLK" CLK
add wave -label "L" L
add wave -label "R" R
add wave -label "LED" LED
#add wave -label "curState" /tb_SimpleStateMachine/i1/curState

view structure
view signals
run 470 ns

wave zoom full
