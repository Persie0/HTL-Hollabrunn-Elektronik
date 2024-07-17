--
-- Perzi Marvin
-- 20.01.2021
--

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_SimpleStateMachine IS
END tb_SimpleStateMachine;

ARCHITECTURE tb_SimpleStateMachine_arch OF tb_SimpleStateMachine IS
	-- constants                                                 
	-- signals                                                   
	SIGNAL CLK : STD_LOGIC;
	SIGNAL nRES : STD_LOGIC;
	SIGNAL S : STD_LOGIC;
	SIGNAL WHEEL_L : STD_LOGIC;
	SIGNAL WHEEL_R : STD_LOGIC;
	COMPONENT SimpleStateMachine
		PORT (
		CLK : IN STD_LOGIC;
		nRES : IN STD_LOGIC;
		S : IN STD_LOGIC;
		WHEEL_L : OUT STD_LOGIC;
		WHEEL_R : OUT STD_LOGIC
		);
	END COMPONENT;
BEGIN
	i1 : SimpleStateMachine
	PORT MAP (
		CLK => CLK,
		nRES => nRES,
		S => S,
		WHEEL_L => WHEEL_L,
		WHEEL_R => WHEEL_R
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
		S <= '0';
		wait for 80 ns;
		S <= '1';
		wait for 30 ns;
		S <= '0';
		wait for 30 ns;
		S <= '1';
		wait for 30 ns;
		S <= '0';
	end process p_sensor;
	
END tb_SimpleStateMachine_arch;
