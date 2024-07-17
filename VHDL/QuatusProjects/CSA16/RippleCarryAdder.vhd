-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
-- CREATED		"Wed May 26 11:12:53 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY RippleCarryAdder IS 
	PORT
	(
		CI :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		CO :  OUT  STD_LOGIC;
		SUM :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END RippleCarryAdder;

ARCHITECTURE bdf_type OF RippleCarryAdder IS 

COMPONENT fulladder
	PORT(CI : IN STD_LOGIC;
		 A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 SUM : OUT STD_LOGIC;
		 CO : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SUM_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 



b2v_inst : fulladder
PORT MAP(CI => CI,
		 A => A(0),
		 B => B(0),
		 SUM => SUM_ALTERA_SYNTHESIZED(0),
		 CO => SYNTHESIZED_WIRE_0);


b2v_inst2 : fulladder
PORT MAP(CI => SYNTHESIZED_WIRE_0,
		 A => A(1),
		 B => B(1),
		 SUM => SUM_ALTERA_SYNTHESIZED(1),
		 CO => SYNTHESIZED_WIRE_1);


b2v_inst3 : fulladder
PORT MAP(CI => SYNTHESIZED_WIRE_1,
		 A => A(2),
		 B => B(2),
		 SUM => SUM_ALTERA_SYNTHESIZED(2),
		 CO => SYNTHESIZED_WIRE_2);


b2v_inst4 : fulladder
PORT MAP(CI => SYNTHESIZED_WIRE_2,
		 A => A(3),
		 B => B(3),
		 SUM => SUM_ALTERA_SYNTHESIZED(3),
		 CO => CO);

SUM <= SUM_ALTERA_SYNTHESIZED;

END bdf_type;