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
virtual signal {A3 & A2 & A1 & A0} A
add wave -label "A" A

add wave -label "B3" B3
add wave -label "B2" B2
add wave -label "B1" B1
add wave -label "B0" B0
virtual signal {B3 & B2 & B1 & B0} B
add wave -label "B" B

add wave -label "CO" CO
add wave -label "SUM3" SUM3
add wave -label "SUM2" SUM2
add wave -label "SUM1" SUM1
add wave -label "SUM0" SUM0

virtual signal { CO & SUM3 & SUM2 & SUM1 & SUM0} SUM
add wave -label "SUM" SUM

view structure
view signals
run 180 ns

wave zoom full
