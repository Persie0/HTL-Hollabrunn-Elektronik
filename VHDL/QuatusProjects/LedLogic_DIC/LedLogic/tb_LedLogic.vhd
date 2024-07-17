--Marvin Perzi
--20.03.2021

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_LedLogic IS
END tb_LedLogic;

ARCHITECTURE tb_LedLogic_arch OF tb_LedLogic IS
    -- constants                                                 
    -- signals                                                   
    SIGNAL CLK : STD_LOGIC;
    SIGNAL L : STD_LOGIC;
    SIGNAL LED : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL nRES : STD_LOGIC;
    SIGNAL R : STD_LOGIC;
    COMPONENT LedLogic
        PORT (
            CLK : IN STD_LOGIC;
            L : IN STD_LOGIC;
            LED : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
            nRES : IN STD_LOGIC;
            R : IN STD_LOGIC
        );
    END COMPONENT;
 BEGIN
	  i1 : LedLogic
	  PORT MAP (
		-- list connections between master ports and signals
		  CLK => CLK,
		  L => L,
		  LED => LED,
		  nRES => nRES,
		  R => R
	  );
                                           
	p_clk: PROCESS
	BEGIN                                                         
        CLK <= '0';
        wait for 15 ns;
        CLK <= '1';
        wait for 15 ns;
    END PROCESS p_clk;

	p_reset: PROCESS
	BEGIN                                                         
        nRES <= '1';
        wait for 20 ns;
        nRES <= '0';
        wait for 35 ns;
        nRES <= '1';
        wait;
    END PROCESS p_reset;

    p_input: PROCESS
    BEGIN
        L <= '0';
        R <= '0';
        wait for 75 ns;
        R <= '1';
        wait for 285 ns;
        R <= '0';
		  wait for 25 ns;
        L <= '1';
        wait for 100 ns;
        L <= '0';
        wait;
    END PROCESS p_input;

END tb_LedLogic_arch;
