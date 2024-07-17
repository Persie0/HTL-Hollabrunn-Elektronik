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
-- Generated on "05/18/2021 20:26:06"
                                                            
-- Vhdl Test Bench template for design  :  CSA4
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_CSA4 IS
END tb_CSA4;
ARCHITECTURE CSA4_arch OF tb_CSA4 IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL CO : STD_LOGIC;
SIGNAL CO_IN : STD_LOGIC;
SIGNAL SUM : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT CSA4
	PORT (
	A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	CO : OUT STD_LOGIC;
	CO_IN : IN STD_LOGIC;
	SUM : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : CSA4
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	CO => CO,
	CO_IN => CO_IN,
	SUM => SUM
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
      
		A <= "1111";
		B <= "0000";
		CO_IN <= '0';
		wait for 100 ns;
		B <= "0001";
		wait;
WAIT;                                                       
END PROCESS init;                                           
                              
END CSA4_arch;
