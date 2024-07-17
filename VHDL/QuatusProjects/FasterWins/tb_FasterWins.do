#Marvin Perzi
#20.03.2021

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


# Name of test bench entity
set TestBench "tb_FasterWins"

# Add 
vcom -93 -work work {tb_FasterWins.vhd}
vcom -93 -work work {FasterWins.vhd}
vcom -93 -work work {GameLogic.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  $TestBench

#add wave *
add wave -label "CLK12M" CLK12M
add wave -label "LED" LED
add wave -label "ROT_BTN" ROT_BTN
add wave -label "S1" S1
add wave -label "S2" S2

view structure
view signals
run 900 ns

wave zoom full
