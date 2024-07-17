-- 
-- Testbench file for entity DLatchVSDFF
-- @author  Marvin Perzi
-- @version 2020-11-28
--

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_DLatchVSDFF IS
END tb_DLatchVSDFF;

ARCHITECTURE DLatchVSDFF_arch OF tb_DLatchVSDFF IS
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
	
	
p_reset : PROCESS
BEGIN
 Reset <= '1';
 wait for 30 ns;
 Reset <= '0';
 wait for 80 ns;
 Reset <= '1';
 wait; 
END PROCESS p_reset;   

                                      
p_clock : PROCESS
BEGIN
 EN_CLK <= '0';
 wait for 20 ns;
 EN_CLK <= '1';
 wait for 20 ns;
END PROCESS p_clock;  


p_d : PROCESS
BEGIN
 D <= '0';
 wait for 135 ns;
 D <= '1';
 wait for 75 ns;
 D <= '0';
 wait for 25 ns;
 D <= '1';
 wait for 75 ns;
 D <= '0';
 wait for 30 ns;
 D <= '1';
 wait for 55 ns;
END PROCESS p_d;  

                                     
END DLatchVSDFF_arch;
