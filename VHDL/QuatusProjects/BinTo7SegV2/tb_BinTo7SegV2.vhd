-- Author:  Marvin Perzi
-- Version: 2020-12-21

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_BinTo7SegV2 IS
END tb_BinTo7SegV2;

ARCHITECTURE tb_BinTo7Seg_archV2 OF tb_BinTo7SegV2 IS
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
		a : BUFFER STD_LOGIC;
		b : BUFFER STD_LOGIC;
		b0 : IN STD_LOGIC;
		b1 : IN STD_LOGIC;
		b2 : IN STD_LOGIC;
		b3 : IN STD_LOGIC;
		c : BUFFER STD_LOGIC;
		d : BUFFER STD_LOGIC;
		e : BUFFER STD_LOGIC;
		f : BUFFER STD_LOGIC;
		g : BUFFER STD_LOGIC
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

	p_counter : PROCESS
	BEGIN                                                         
		b3 <= '0';
		b2 <= '0';
		b1 <= '0';
		b0 <= '0';
		wait for 20 ns;
		b3 <= '0';
		b2 <= '0';
		b1 <= '0';
		b0 <= '1';
		wait for 20 ns;
		b3 <= '0';
		b2 <= '0';
		b1 <= '1';
		b0 <= '0';
		wait for 20 ns;
		b3 <= '0';
		b2 <= '0';
		b1 <= '1';
		b0 <= '1';
		wait for 20 ns;
		b3 <= '0';
		b2 <= '1';
		b1 <= '0';
		b0 <= '0';
		wait for 20 ns;
		b3 <= '0';
		b2 <= '1';
		b1 <= '0';
		b0 <= '1';
		wait for 20 ns;
		b3 <= '0';
		b2 <= '1';
		b1 <= '1';
		b0 <= '0';
		wait for 20 ns;
		b3 <= '0';
		b2 <= '1';
		b1 <= '1';
		b0 <= '1';
		wait for 20 ns;
		b3 <= '1';
		b2 <= '0';
		b1 <= '0';
		b0 <= '0';
		wait for 20 ns;
		b3 <= '1';
		b2 <= '0';
		b1 <= '0';
		b0 <= '1';
		wait for 20 ns;--
		b3 <= '1';
		b2 <= '0';
		b1 <= '1';
		b0 <= '0';
		wait for 20 ns;
		b3 <= '1';
		b2 <= '0';
		b1 <= '1';
		b0 <= '1';
		wait for 20 ns;
		b3 <= '1';
		b2 <= '1';
		b1 <= '0';
		b0 <= '0';
		wait for 20 ns;
		b3 <= '1';
		b2 <= '1';
		b1 <= '0';
		b0 <= '1';
		wait for 20 ns;
		b3 <= '1';
		b2 <= '1';
		b1 <= '1';
		b0 <= '0';
		wait for 20 ns;
		b3 <= '1';
		b2 <= '1';
		b1 <= '1';
		b0 <= '1';
		wait;
	END PROCESS p_counter;                                          

END tb_BinTo7Seg_archV2;
