-- Testbench file for entity counter
-- @autor m p
-- @version 20.10.2020

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_SimpleCounter IS
END tb_SimpleCounter;
ARCHITECTURE tb_SimpleCounter_arch OF tb_SimpleCounter IS
-- constants                                                 
-- signals                                                   
SIGNAL CLk : STD_LOGIC;
SIGNAL Q0 : STD_LOGIC;
SIGNAL Q1 : STD_LOGIC;
SIGNAL RESET : STD_LOGIC;
COMPONENT SimpleCounter
	PORT (
	CLk : IN STD_LOGIC;
	Q0 : OUT STD_LOGIC;
	Q1 : OUT STD_LOGIC;
	RESET : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : SimpleCounter
	PORT MAP (
-- list connections between master ports and signals
	CLk => CLk,
	Q0 => Q0,
	Q1 => Q1,
	RESET => RESET
	);
	
--generate reset signal
p_reset : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
      RESET <= '1';
		wait for 15 ns;
		RESET <= '0';
		wait for 80 ns;
		RESET <= '1';
		wait;	--wait forever
                                                  
END PROCESS p_reset;  

--generate clock signal                                         
P_clk : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        CLK <= '0';
		  wait for 20 ns;
		  CLK <= '1';
		  wait for 20 ns;                                                  
END PROCESS p_clk;   
                                       
END tb_SimpleCounter_arch;
