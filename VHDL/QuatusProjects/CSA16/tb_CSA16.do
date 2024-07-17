#Marvin Perzi
#20.03.2021

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


# Name of test bench entity
set TestBench "tb_CSA16"

# Add 
vcom -93 -work work {CSA16.vhd}
vcom -93 -work work {CSA4.vhd}
vcom -93 -work work {RippleCarryAdder.vhd}
vcom -93 -work work {FullAdder.vhd}
vcom -93 -work work {Mux2to1_4Bit.vhd}
vcom -93 -work work {tb_CSA16.vhd}
vcom -93 -work work {Mux2to1.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  $TestBench

#add wave *
add wave -label "A" A
add wave -label "B" B
add wave -label "SUM" SUM
add wave -label "CO" CO
add wave -label "CI" CI

view structure
view signals
run 300 ns

wave zoom full
