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
-- CREATED		"Wed Apr 28 11:13:26 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY FasterWins IS 
	PORT
	(
		CLK12M :  IN  STD_LOGIC;
		ROT_BTN :  IN  STD_LOGIC;
		S1 :  IN  STD_LOGIC;
		S2 :  IN  STD_LOGIC;
		LED :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END FasterWins;

ARCHITECTURE bdf_type OF FasterWins IS 

COMPONENT syncchain
	PORT(D : IN STD_LOGIC;
		 nRes : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 Q : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT gamelogic
	PORT(L : IN STD_LOGIC;
		 R : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 nRES : IN STD_LOGIC;
		 LED : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;


BEGIN 



b2v_inst : syncchain
PORT MAP(D => S1,
		 nRes => SYNTHESIZED_WIRE_5,
		 CLK => CLK12M,
		 Q => SYNTHESIZED_WIRE_3);


SYNTHESIZED_WIRE_5 <= NOT(ROT_BTN);



b2v_inst4 : syncchain
PORT MAP(D => S2,
		 nRes => SYNTHESIZED_WIRE_5,
		 CLK => CLK12M,
		 Q => SYNTHESIZED_WIRE_2);


b2v_inst5 : gamelogic
PORT MAP(L => SYNTHESIZED_WIRE_2,
		 R => SYNTHESIZED_WIRE_3,
		 CLK => CLK12M,
		 nRES => SYNTHESIZED_WIRE_5,
		 LED => LED);


END bdf_type;