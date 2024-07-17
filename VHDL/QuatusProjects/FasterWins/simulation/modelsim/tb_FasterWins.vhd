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
-- Generated on "04/28/2021 10:43:14"
                                                            
-- Vhdl Test Bench template for design  :  FasterWins
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY FasterWins_vhd_tst IS
END FasterWins_vhd_tst;
ARCHITECTURE FasterWins_arch OF FasterWins_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK12M : STD_LOGIC;
SIGNAL LED : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ROT_BTN : STD_LOGIC;
SIGNAL S1 : STD_LOGIC;
SIGNAL S2 : STD_LOGIC;
COMPONENT FasterWins
	PORT (
	CLK12M : IN STD_LOGIC;
	LED : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	ROT_BTN : IN STD_LOGIC;
	S1 : IN STD_LOGIC;
	S2 : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : FasterWins
	PORT MAP (
-- list connections between master ports and signals
	CLK12M => CLK12M,
	LED => LED,
	ROT_BTN => ROT_BTN,
	S1 => S1,
	S2 => S2
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
END FasterWins_arch;
