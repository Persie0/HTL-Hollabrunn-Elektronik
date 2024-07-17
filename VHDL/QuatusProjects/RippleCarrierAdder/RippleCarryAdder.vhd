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
-- CREATED		"Thu Apr 22 16:34:19 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY RippleCarryAdder IS 
	PORT
	(
		A0 :  IN  STD_LOGIC;
		B0 :  IN  STD_LOGIC;
		A1 :  IN  STD_LOGIC;
		B1 :  IN  STD_LOGIC;
		A2 :  IN  STD_LOGIC;
		B2 :  IN  STD_LOGIC;
		A3 :  IN  STD_LOGIC;
		B3 :  IN  STD_LOGIC;
		SUM0 :  OUT  STD_LOGIC;
		SUM1 :  OUT  STD_LOGIC;
		SUM2 :  OUT  STD_LOGIC;
		SUM3 :  OUT  STD_LOGIC;
		CO :  OUT  STD_LOGIC
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

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_0 <= '0';



b2v_inst : fulladder
PORT MAP(CI => SYNTHESIZED_WIRE_0,
		 A => A0,
		 B => B0,
		 SUM => SUM0,
		 CO => SYNTHESIZED_WIRE_1);


b2v_inst2 : fulladder
PORT MAP(CI => SYNTHESIZED_WIRE_1,
		 A => A1,
		 B => B1,
		 SUM => SUM1,
		 CO => SYNTHESIZED_WIRE_2);


b2v_inst3 : fulladder
PORT MAP(CI => SYNTHESIZED_WIRE_2,
		 A => A2,
		 B => B2,
		 SUM => SUM2,
		 CO => SYNTHESIZED_WIRE_3);


b2v_inst4 : fulladder
PORT MAP(CI => SYNTHESIZED_WIRE_3,
		 A => A3,
		 B => B3,
		 SUM => SUM3,
		 CO => CO);



END bdf_type;