-- 
-- Testbench file for entity SimpleCounter
--
-- @author  Daniel Schloegl
-- @version 2020-10-21
--

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_Mux4to1 IS
END tb_Mux4to1;

ARCHITECTURE Mux4to1_arch OF tb_Mux4to1 IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC;
SIGNAL B : STD_LOGIC;
SIGNAL C : STD_LOGIC;
SIGNAL D : STD_LOGIC;
SIGNAL S0 : STD_LOGIC;
SIGNAL S1 : STD_LOGIC;
SIGNAL Y : STD_LOGIC;

COMPONENT Mux4to1
	PORT (
		A : IN STD_LOGIC;
		B : IN STD_LOGIC;
		C : IN STD_LOGIC;
		D : IN STD_LOGIC;
		S0 : IN STD_LOGIC;
		S1 : IN STD_LOGIC;
		Y : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Mux4to1
	PORT MAP (
		-- list connections between master ports and signals
		A => A,
		B => B,
		C => C,
		D => D,
		S0 => S0,
		S1 => S1,
		Y => Y
	);

--
-- Generate reset signal
--	
p_datasig : PROCESS                                               
BEGIN                                                        
	A <= '0';
	B <= '0';
   C <= '0';
   D <= '0';
   wait for 20 ns;
	A <= '1';
	B <= '1';
   C <= '1';
   D <= '1';
   wait for 20 ns;                                                        
	A <= '0';
	B <= '1';
   C <= '1';
   D <= '1';
   wait for 20 ns;                                                        
	A <= '0';
	B <= '0';
   C <= '1';
   D <= '1';
   wait for 20 ns;
	A <= '0';
	B <= '0';
   C <= '0';
   D <= '1';
	wait for 20 ns;
END PROCESS p_datasig; 


--
-- Generates signal for Mux
--                                          
p_selectsig : PROCESS                   
BEGIN
	S1 <= '0';
	S0 <= '0';
   wait for 100 ns;
	S1 <= '0';
	S0 <= '1';
   wait for 100 ns;                                                        
	S1 <= '1';
	S0 <= '0';
   wait for 100 ns;                                                        
	S1 <= '1';
	S0 <= '1';
   wait for 100 ns;                                         
END PROCESS p_selectsig; 
                                       
END Mux4to1_arch;
