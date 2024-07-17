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
-- CREATED		"Wed May 26 11:12:54 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY CSA4 IS 
	PORT
	(
		CO_IN :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		CO :  OUT  STD_LOGIC;
		SUM :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END CSA4;

ARCHITECTURE bdf_type OF CSA4 IS 

COMPONENT ripplecarryadder
	PORT(CI : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 CO : OUT STD_LOGIC;
		 SUM : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux2to1
	PORT(A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 SET : IN STD_LOGIC;
		 Y : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT mux2to1_4bit
	PORT(SET : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(3 DOWNTO 0);


BEGIN 
SYNTHESIZED_WIRE_0 <= '0';
SYNTHESIZED_WIRE_1 <= '1';



b2v_inst : ripplecarryadder
PORT MAP(CI => SYNTHESIZED_WIRE_0,
		 A => A,
		 B => B,
		 CO => SYNTHESIZED_WIRE_2,
		 SUM => SYNTHESIZED_WIRE_4);


b2v_inst1 : ripplecarryadder
PORT MAP(CI => SYNTHESIZED_WIRE_1,
		 A => A,
		 B => B,
		 CO => SYNTHESIZED_WIRE_3,
		 SUM => SYNTHESIZED_WIRE_5);


b2v_inst2 : mux2to1
PORT MAP(A => SYNTHESIZED_WIRE_2,
		 B => SYNTHESIZED_WIRE_3,
		 SET => CO_IN,
		 Y => CO);


b2v_inst3 : mux2to1_4bit
PORT MAP(SET => CO_IN,
		 A => SYNTHESIZED_WIRE_4,
		 B => SYNTHESIZED_WIRE_5,
		 Y => SUM);




END bdf_type;