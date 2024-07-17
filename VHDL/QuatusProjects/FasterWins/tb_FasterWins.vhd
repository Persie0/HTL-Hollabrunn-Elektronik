

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
p_reset : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
      ROT_BTN <= '1';
		wait for 25 ns;
		ROT_BTN <= '0';
		wait for 25 ns;
		ROT_BTN <= '1';
		wait for 750 ns;
      ROT_BTN <= '1';
		wait for 25 ns;
		ROT_BTN <= '0';
		wait for 25 ns;                                 
END PROCESS p_reset;  

p_ein : PROCESS                                               
-- variable declarations                                     
BEGIN                 
		wait for 65 ns;                                       
      S1 <= '1';
		wait for 45 ns;
		S1 <= '0';
		S2 <= '1';
		wait for 45 ns;
		S1 <= '1';
		S2 <= '0';
		wait for 45 ns;
		S1 <= '0';
		S2 <= '0';
		wait for 45 ns;
		S1 <= '1';
		S2 <= '0';
		wait for 45 ns;
		S1 <= '0';
		S2 <= '0';
		wait for 45 ns;
		S1 <= '1';
		S2 <= '0';
		wait for 45 ns;
		S1 <= '0';
		S2 <= '0';
		wait for 45 ns;
		S1 <= '1';
		S2 <= '0';
		wait for 45 ns;
		S1 <= '0';
		S2 <= '0';
		wait for 45 ns;
		S1 <= '1';
		S2 <= '0';
		wait for 45 ns;
		S1 <= '0';
		S2 <= '0';
		wait for 45 ns;
		S1 <= '1';
		S2 <= '0';
		wait for 45 ns;
		S1 <= '0';
		S2 <= '0';
		wait for 45 ns;
		S1 <= '1';
		S2 <= '0';
		wait for 45 ns;
		S1 <= '0';
		S2 <= '0';
		wait for 45 ns;
		S1 <= '0';
		S2 <= '1';
		wait;	--wait forever
                                                  
END PROCESS p_ein;  


--generate clock signal                                         
P_clk : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        CLK12M <= '0';
		  wait for 10 ns;
		  CLK12M <= '1';
		  wait for 10 ns;                                                  
END PROCESS p_clk;                                           
                                         
END FasterWins_arch;
