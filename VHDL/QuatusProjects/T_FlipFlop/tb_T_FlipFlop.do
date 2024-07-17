#
# --Marvin Perzi
# --8.1.2021
# 

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


# Name of test bench entity
set TestBench "tb_T_FlipFlop"

# Add 
vcom -93 -work work {T_FlipFlop.vhd}
vcom -93 -work work {tb_T_FlipFlop.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  $TestBench

#add wave *
add wave -label "nRES" nRES
add wave -label "CLK" CLK
add wave -label "T" T
add wave -label "Q" Q

view structure
view signals
run 600 ns

wave zoom full
