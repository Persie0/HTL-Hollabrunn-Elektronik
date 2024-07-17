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
-- Generated on "01/12/2021 21:45:04"
                                                            
-- Vhdl Test Bench template for design  :  EdgeDetection
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_EdgeDetection IS
END tb_EdgeDetection;
ARCHITECTURE EdgeDetection_arch OF tb_EdgeDetection IS
-- constants                                                 
-- signals                                                   
SIGNAL CLk : STD_LOGIC;
SIGNAL nRES : STD_LOGIC;
SIGNAL pulseOut : STD_LOGIC;
SIGNAL sigIn : STD_LOGIC;
COMPONENT EdgeDetection
	PORT (
	CLk : IN STD_LOGIC;
	nRES : IN STD_LOGIC;
	pulseOut : OUT STD_LOGIC;
	sigIn : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : EdgeDetection
	PORT MAP (
-- list connections between master ports and signals
	CLk => CLk,
	nRES => nRES,
	pulseOut => pulseOut,
	sigIn => sigIn
	);
init : PROCESS
BEGIN
 nRES <= '1';
 wait for 20 ns;
 nRES <= '0';
 wait for 50 ns;
 nRES <= '1';
 wait;
END PROCESS init;
                                         
always : PROCESS
BEGIN
 CLK <= '0';
 wait for 10 ns;
 CLK <= '1';
 wait for 10 ns;
END PROCESS always;

sIn : PROCESS
BEGIN
 sigIn <= '0';
 wait for 90 ns;
 sigIN <= '1';
 wait for 150 ns;
END PROCESS sIn;
                                     
END EdgeDetection_arch;
