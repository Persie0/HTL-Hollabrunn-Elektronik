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
-- Generated on "12/21/2020 16:37:58"
                                                            
-- Vhdl Test Bench template for design  :  BinTo7SegV2
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY BinTo7SegV2_vhd_tst IS
END BinTo7SegV2_vhd_tst;
ARCHITECTURE BinTo7SegV2_arch OF BinTo7SegV2_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC;
SIGNAL b : STD_LOGIC;
SIGNAL b0 : STD_LOGIC;
SIGNAL b1 : STD_LOGIC;
SIGNAL b2 : STD_LOGIC;
SIGNAL b3 : STD_LOGIC;
SIGNAL c : STD_LOGIC;
SIGNAL d : STD_LOGIC;
SIGNAL e : STD_LOGIC;
SIGNAL f : STD_LOGIC;
SIGNAL g : STD_LOGIC;
COMPONENT BinTo7SegV2
	PORT (
	a : OUT STD_LOGIC;
	b : OUT STD_LOGIC;
	b0 : IN STD_LOGIC;
	b1 : IN STD_LOGIC;
	b2 : IN STD_LOGIC;
	b3 : IN STD_LOGIC;
	c : OUT STD_LOGIC;
	d : OUT STD_LOGIC;
	e : OUT STD_LOGIC;
	f : OUT STD_LOGIC;
	g : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : BinTo7SegV2
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	b => b,
	b0 => b0,
	b1 => b1,
	b2 => b2,
	b3 => b3,
	c => c,
	d => d,
	e => e,
	f => f,
	g => g
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
END BinTo7SegV2_arch;
