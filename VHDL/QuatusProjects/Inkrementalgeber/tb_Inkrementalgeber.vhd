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
-- Generated on "03/24/2021 10:53:01"
                                                            
-- Vhdl Test Bench template for design  :  Inkrementalgeber
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_Inkrementalgeber IS
END tb_Inkrementalgeber;
ARCHITECTURE tb_Inkrementalgeber_arch OF tb_Inkrementalgeber IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC;
SIGNAL B : STD_LOGIC;
SIGNAL CLK : STD_LOGIC;
SIGNAL nRES : STD_LOGIC;
SIGNAL TL : STD_LOGIC;
SIGNAL TR : STD_LOGIC;
COMPONENT Inkrementalgeber
	PORT (
	A : IN STD_LOGIC;
	B : IN STD_LOGIC;
	CLK : IN STD_LOGIC;
	nRES : IN STD_LOGIC;
	TL : OUT STD_LOGIC;
	TR : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Inkrementalgeber
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	CLK => CLK,
	nRES => nRES,
	TL => TL,
	TR => TR
	);

p_reset: process
	begin
		nRES <= '1';
		wait for 10 ns;
		nRES <= '0';
		wait for 30 ns;
		nRES <= '1';
		wait;
	end process p_reset;
	
	p_clk: process
	begin
		CLK <= '0';
		wait for 15 ns;
		CLK <= '1';
		wait for 15 ns;
	end process p_clk;
	
	p_sensor: process
	begin
		A <= '0';
		B <= '0';
		wait for 80 ns;
		A <= '1';
		wait for 60 ns;
		B <= '1';
		wait for 30 ns;
		A <= '0';
		B <= '0';
		wait for 60 ns;
		B <= '1';
	end process p_sensor;

	
END tb_Inkrementalgeber_arch;
