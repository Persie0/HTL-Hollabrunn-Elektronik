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
-- Generated on "11/28/2020 19:13:59"
                                                            
-- Vhdl Test Bench template for design  :  DLatchVSDFF
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY DLatchVSDFF_vhd_tst IS
END DLatchVSDFF_vhd_tst;
ARCHITECTURE DLatchVSDFF_arch OF DLatchVSDFF_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL D : STD_LOGIC;
SIGNAL EN_CLK : STD_LOGIC;
SIGNAL QFF : STD_LOGIC;
SIGNAL QL : STD_LOGIC;
SIGNAL Reset : STD_LOGIC;
COMPONENT DLatchVSDFF
	PORT (
	D : IN STD_LOGIC;
	EN_CLK : IN STD_LOGIC;
	QFF : OUT STD_LOGIC;
	QL : OUT STD_LOGIC;
	Reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : DLatchVSDFF
	PORT MAP (
-- list connections between master ports and signals
	D => D,
	EN_CLK => EN_CLK,
	QFF => QFF,
	QL => QL,
	Reset => Reset
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END DLatchVSDFF_arch;
