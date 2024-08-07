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
-- CREATED		"Mon Nov 23 10:06:12 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ColaAutomat IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		Reset :  IN  STD_LOGIC;
		E :  IN  STD_LOGIC;
		F :  IN  STD_LOGIC;
		K :  OUT  STD_LOGIC
	);
END ColaAutomat;

ARCHITECTURE bdf_type OF ColaAutomat IS 

COMPONENT nsl
	PORT(E : IN STD_LOGIC;
		 F : IN STD_LOGIC;
		 Z1v : IN STD_LOGIC;
		 Z0v : IN STD_LOGIC;
		 Z1n : OUT STD_LOGIC;
		 Z0n : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_1 <= '1';
SYNTHESIZED_WIRE_3 <= '1';



PROCESS(CLK,Reset,SYNTHESIZED_WIRE_1)
BEGIN
IF (Reset = '0') THEN
	SYNTHESIZED_WIRE_4 <= '0';
ELSIF (SYNTHESIZED_WIRE_1 = '0') THEN
	SYNTHESIZED_WIRE_4 <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	SYNTHESIZED_WIRE_4 <= SYNTHESIZED_WIRE_0;
END IF;
END PROCESS;


PROCESS(CLK,Reset,SYNTHESIZED_WIRE_3)
BEGIN
IF (Reset = '0') THEN
	SYNTHESIZED_WIRE_5 <= '0';
ELSIF (SYNTHESIZED_WIRE_3 = '0') THEN
	SYNTHESIZED_WIRE_5 <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	SYNTHESIZED_WIRE_5 <= SYNTHESIZED_WIRE_2;
END IF;
END PROCESS;


b2v_inst3 : nsl
PORT MAP(E => E,
		 F => F,
		 Z1v => SYNTHESIZED_WIRE_4,
		 Z0v => SYNTHESIZED_WIRE_5,
		 Z1n => SYNTHESIZED_WIRE_0,
		 Z0n => SYNTHESIZED_WIRE_2);


K <= SYNTHESIZED_WIRE_4 AND SYNTHESIZED_WIRE_5;




END bdf_type;