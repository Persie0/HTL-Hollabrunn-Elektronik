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
-- CREATED		"Wed Oct 21 09:17:32 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY SimpleCounter IS 
	PORT
	(
		CLk :  IN  STD_LOGIC;
		RESET :  IN  STD_LOGIC;
		Q1 :  OUT  STD_LOGIC;
		Q0 :  OUT  STD_LOGIC
	);
END SimpleCounter;

ARCHITECTURE bdf_type OF SimpleCounter IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	DFF_D1 :  STD_LOGIC;


BEGIN 
Q1 <= DFF_D1;
Q0 <= SYNTHESIZED_WIRE_4;
SYNTHESIZED_WIRE_1 <= '1';
SYNTHESIZED_WIRE_3 <= '1';



PROCESS(CLk,RESET,SYNTHESIZED_WIRE_1)
BEGIN
IF (RESET = '0') THEN
	SYNTHESIZED_WIRE_4 <= '0';
ELSIF (SYNTHESIZED_WIRE_1 = '0') THEN
	SYNTHESIZED_WIRE_4 <= '1';
ELSIF (RISING_EDGE(CLk)) THEN
	SYNTHESIZED_WIRE_4 <= SYNTHESIZED_WIRE_0;
END IF;
END PROCESS;


PROCESS(CLk,RESET,SYNTHESIZED_WIRE_3)
BEGIN
IF (RESET = '0') THEN
	DFF_D1 <= '0';
ELSIF (SYNTHESIZED_WIRE_3 = '0') THEN
	DFF_D1 <= '1';
ELSIF (RISING_EDGE(CLk)) THEN
	DFF_D1 <= SYNTHESIZED_WIRE_2;
END IF;
END PROCESS;


SYNTHESIZED_WIRE_2 <= SYNTHESIZED_WIRE_4 XOR DFF_D1;


SYNTHESIZED_WIRE_0 <= NOT(SYNTHESIZED_WIRE_4);





END bdf_type;