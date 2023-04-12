-- 
-- Testbench file for entity ColaAutomat
-- @author  Marvin Perzi
-- @version 2020-11-12
--


LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_ColaAutomat IS
END tb_ColaAutomat;
ARCHITECTURE ColaAutomat_arch OF tb_ColaAutomat IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL E : STD_LOGIC;
SIGNAL F : STD_LOGIC;
SIGNAL K : STD_LOGIC;
SIGNAL nRES : STD_LOGIC;
COMPONENT ColaAutomat
	PORT (
	CLK : IN STD_LOGIC;
	E : IN STD_LOGIC;
	F : IN STD_LOGIC;
	K : OUT STD_LOGIC;
	nRES : IN STD_LOGIC
	);
END COMPONENT;

BEGIN
	i1 : ColaAutomat
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	E => E,
	F => F,
	K => K,
	nRES => nRES
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

                                        
p_muenzen : PROCESS                   
BEGIN
	E <= '0';
	F <= '0';
   wait for 130 ns;
	E <= '1';
	F <= '0';
   wait for 20 ns;                                                        
	E <= '0';
	F <= '0';
   wait for 20 ns;                                                        
	E <= '0';
	F <= '1';
   wait for 20 ns; 
	E <= '0';
	F <= '0';
   wait for 60 ns;
	E <= '0';
	F <= '1';
	wait for 20 ns; 
	E <= '0';
	F <= '0';
   wait for 20 ns;                                                        
	E <= '1';
	F <= '0';
	wait for 20 ns;
	E <= '0';
	F <= '0';
   wait;
END PROCESS p_muenzen;                                          
END ColaAutomat_arch;
