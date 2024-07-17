

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_RippleCarryAdder IS
END tb_RippleCarryAdder;
ARCHITECTURE RippleCarryAdder_arch OF tb_RippleCarryAdder IS
-- constants                                                 
-- signals                                                   
SIGNAL A0 : STD_LOGIC;
SIGNAL A1 : STD_LOGIC;
SIGNAL A2 : STD_LOGIC;
SIGNAL A3 : STD_LOGIC;
SIGNAL B0 : STD_LOGIC;
SIGNAL B1 : STD_LOGIC;
SIGNAL B2 : STD_LOGIC;
SIGNAL B3 : STD_LOGIC;
SIGNAL CO : STD_LOGIC;
SIGNAL SUM0 : STD_LOGIC;
SIGNAL SUM1 : STD_LOGIC;
SIGNAL SUM2 : STD_LOGIC;
SIGNAL SUM3 : STD_LOGIC;
COMPONENT RippleCarryAdder
	PORT (
	A0 : IN STD_LOGIC;
	A1 : IN STD_LOGIC;
	A2 : IN STD_LOGIC;
	A3 : IN STD_LOGIC;
	B0 : IN STD_LOGIC;
	B1 : IN STD_LOGIC;
	B2 : IN STD_LOGIC;
	B3 : IN STD_LOGIC;
	CO : OUT STD_LOGIC;
	SUM0 : OUT STD_LOGIC;
	SUM1 : OUT STD_LOGIC;
	SUM2 : OUT STD_LOGIC;
	SUM3 : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : RippleCarryAdder
	PORT MAP (
-- list connections between master ports and signals
	A0 => A0,
	A1 => A1,
	A2 => A2,
	A3 => A3,
	B0 => B0,
	B1 => B1,
	B2 => B2,
	B3 => B3,
	CO => CO,
	SUM0 => SUM0,
	SUM1 => SUM1,
	SUM2 => SUM2,
	SUM3 => SUM3
	);
p_input: PROCESS
    BEGIN
        A0 <= '1'; 
        A1 <= '1';
		  A2 <= '1';
        A3 <= '1';
		  
		  B0 <= '0';
        B1 <= '0';
		  B2 <= '0';
        B3 <= '0';
		  wait for 100 ns;
		  B0 <= '1';

		  wait;
    END PROCESS p_input;                                 
END RippleCarryAdder_arch;
