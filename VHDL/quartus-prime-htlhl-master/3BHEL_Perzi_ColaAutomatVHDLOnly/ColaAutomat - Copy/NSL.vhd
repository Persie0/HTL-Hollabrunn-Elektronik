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
-- VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
-- CREATED		"Thu Nov 12 09:11:40 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY NSL IS 
	PORT
	(
		E :  IN  STD_LOGIC;
		F :  IN  STD_LOGIC;
		Z1v :  IN  STD_LOGIC;
		Z0v :  IN  STD_LOGIC;
		Z1n :  OUT  STD_LOGIC;
		Z0n :  OUT  STD_LOGIC
	);
END NSL;

ARCHITECTURE bdf_type OF NSL IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_3 <= Z1v AND SYNTHESIZED_WIRE_0;


SYNTHESIZED_WIRE_9 <= NOT(E);



SYNTHESIZED_WIRE_15 <= NOT(E);



SYNTHESIZED_WIRE_16 <= NOT(Z1v);



SYNTHESIZED_WIRE_10 <= NOT(Z1v);



SYNTHESIZED_WIRE_11 <= NOT(Z1v);



SYNTHESIZED_WIRE_12 <= NOT(F);



SYNTHESIZED_WIRE_17 <= NOT(Z0v);



SYNTHESIZED_WIRE_18 <= NOT(F);



SYNTHESIZED_WIRE_13 <= NOT(Z0v);



SYNTHESIZED_WIRE_14 <= NOT(E);



SYNTHESIZED_WIRE_0 <= NOT(Z0v);



Z1n <= SYNTHESIZED_WIRE_1 OR SYNTHESIZED_WIRE_2 OR SYNTHESIZED_WIRE_3;


Z0n <= SYNTHESIZED_WIRE_4 OR SYNTHESIZED_WIRE_5 OR SYNTHESIZED_WIRE_6 OR SYNTHESIZED_WIRE_7;


SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_8 AND F AND SYNTHESIZED_WIRE_9;


SYNTHESIZED_WIRE_4 <= SYNTHESIZED_WIRE_10 AND E AND Z0v;


SYNTHESIZED_WIRE_7 <= SYNTHESIZED_WIRE_11 AND Z0v AND SYNTHESIZED_WIRE_12;


SYNTHESIZED_WIRE_6 <= SYNTHESIZED_WIRE_13 AND SYNTHESIZED_WIRE_14 AND F;


SYNTHESIZED_WIRE_2 <= SYNTHESIZED_WIRE_15 AND F AND SYNTHESIZED_WIRE_16 AND Z0v;


SYNTHESIZED_WIRE_5 <= Z1v AND SYNTHESIZED_WIRE_17 AND SYNTHESIZED_WIRE_18 AND E;


SYNTHESIZED_WIRE_8 <= NOT(Z1v);



END bdf_type;