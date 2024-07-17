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
-- CREATED		"Mon May 31 17:25:06 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY CSA16 IS 
	PORT
	(
		CI :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		CO :  OUT  STD_LOGIC;
		SUM :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END CSA16;

ARCHITECTURE bdf_type OF CSA16 IS 

COMPONENT csa4
	PORT(CO_IN : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 CO : OUT STD_LOGIC;
		 SUM : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SUM_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 



b2v_inst : csa4
PORT MAP(CO_IN => CI,
		 A => A(3 DOWNTO 0),
		 B => B(3 DOWNTO 0),
		 CO => SYNTHESIZED_WIRE_0,
		 SUM => SUM_ALTERA_SYNTHESIZED(3 DOWNTO 0));


b2v_inst1 : csa4
PORT MAP(CO_IN => SYNTHESIZED_WIRE_0,
		 A => A(7 DOWNTO 4),
		 B => B(7 DOWNTO 4),
		 CO => SYNTHESIZED_WIRE_1,
		 SUM => SUM_ALTERA_SYNTHESIZED(7 DOWNTO 4));


b2v_inst2 : csa4
PORT MAP(CO_IN => SYNTHESIZED_WIRE_1,
		 A => A(11 DOWNTO 8),
		 B => B(11 DOWNTO 8),
		 CO => SYNTHESIZED_WIRE_2,
		 SUM => SUM_ALTERA_SYNTHESIZED(11 DOWNTO 8));


b2v_inst3 : csa4
PORT MAP(CO_IN => SYNTHESIZED_WIRE_2,
		 A => A(15 DOWNTO 12),
		 B => B(15 DOWNTO 12),
		 CO => CO,
		 SUM => SUM_ALTERA_SYNTHESIZED(15 DOWNTO 12));

SUM <= SUM_ALTERA_SYNTHESIZED;

END bdf_type;