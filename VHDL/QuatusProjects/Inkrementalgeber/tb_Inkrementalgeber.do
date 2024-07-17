#
# Perzi Marvin
# 20.01.2021
#

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


# Name of test bench entity
set TestBench "tb_Inkrementalgeber"

# Add 
vcom -93 -work work {Inkrementalgeber.vhd}
vcom -93 -work work {tb_Inkrementalgeber.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  $TestBench

#add wave *
add wave -label "nRES" nRES
add wave -label "CLK" CLK
add wave -label "A" A
add wave -label "B" B
add wave -label "TL" TL
add wave -label "TR" TR


view structure
view signals
run 400 ns

wave zoom full
