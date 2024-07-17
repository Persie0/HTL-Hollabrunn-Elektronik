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
-- Generated on "02/17/2021 11:31:36"
                                                            
-- Vhdl Test Bench template for design  :  T_FlipFlop
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_T_FlipFlop IS
END tb_T_FlipFlop;
ARCHITECTURE T_FlipFlop_arch OF tb_T_FlipFlop IS
-- constants                                                 
-- signals                                                   
SIGNAL CLk : STD_LOGIC;
SIGNAL nRES : STD_LOGIC;
SIGNAL Q : STD_LOGIC;
SIGNAL T : STD_LOGIC;
COMPONENT T_FlipFlop
	PORT (
	CLk : IN STD_LOGIC;
	nRES : IN STD_LOGIC;
	Q : OUT STD_LOGIC;
	T : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : T_FlipFlop
	PORT MAP (
-- list connections between master ports and signals
	CLk => CLk,
	nRES => nRES,
	Q => Q,
	T => T
	);
	
p_reset : PROCESS
BEGIN
 nRES <= '1';
 wait for 50 ns;
 nRES <= '0';
 wait for 60 ns;
 nRES <= '1';
 wait; 
END PROCESS p_reset;  
	
p_clock : PROCESS
BEGIN
 CLK <= '0';
 wait for 20 ns;
 CLK <= '1';
 wait for 20 ns;
END PROCESS p_clock;  
                   
p_eingang : PROCESS
BEGIN
 T <= '0';
 wait for 130 ns;
 T <= '1';
 wait for 230 ns;
 T <= '0';
END PROCESS p_eingang; 
						 
END T_FlipFlop_arch;
