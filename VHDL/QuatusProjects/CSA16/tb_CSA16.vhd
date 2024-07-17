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

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "05/31/2021 17:17:24"
                                                            
-- Vhdl Test Bench template for design  :  CSA16
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_CSA16 IS
END tb_CSA16;
ARCHITECTURE CSA16_arch OF tb_CSA16 IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL CI : STD_LOGIC;
SIGNAL CO : STD_LOGIC;
SIGNAL SUM : STD_LOGIC_VECTOR(15 DOWNTO 0);
COMPONENT CSA16
	PORT (
	A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	CI : IN STD_LOGIC;
	CO : OUT STD_LOGIC;
	SUM : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : CSA16
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	CI => CI,
	CO => CO,
	SUM => SUM
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
    	A <= "1111111111111111";
		B <= "0000000000000000";
		CI <= '0';
		wait for 100 ns;
		B <= "0000000000000001";
		wait;                 
WAIT;                                                       
END PROCESS init;                                           
                                           
                                         
END CSA16_arch;
