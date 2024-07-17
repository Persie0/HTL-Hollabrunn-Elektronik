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
-- CREATED		"Sat Nov 28 19:41:36 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY DLatchVSDFF IS 
	PORT
	(
		D :  IN  STD_LOGIC;
		EN_CLK :  IN  STD_LOGIC;
		Reset :  IN  STD_LOGIC;
		QL :  OUT  STD_LOGIC;
		QFF :  OUT  STD_LOGIC
	);
END DLatchVSDFF;

ARCHITECTURE bdf_type OF DLatchVSDFF IS 

COMPONENT d_ff
	PORT(D : IN STD_LOGIC;
		 nRes : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 QFF : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT d_latch
	PORT(D : IN STD_LOGIC;
		 nRes : IN STD_LOGIC;
		 EN : IN STD_LOGIC;
		 QL : OUT STD_LOGIC
	);
END COMPONENT;



BEGIN 



b2v_inst : d_ff
PORT MAP(D => D,
		 nRes => Reset,
		 CLK => EN_CLK,
		 QFF => QFF);


b2v_inst6 : d_latch
PORT MAP(D => D,
		 nRes => Reset,
		 EN => EN_CLK,
		 QL => QL);


END bdf_type;