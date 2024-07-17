--Marvin Perzi
--8.1.2021

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY T_FlipFlop IS 
	PORT
	(
		CLk :  IN  STD_LOGIC;
		nRES :  IN  STD_LOGIC;
		T :  IN  STD_LOGIC;
		Q :  OUT  STD_LOGIC
	);
END T_FlipFlop;

architecture T_FlipFlop_arch of T_FlipFlop is
signal Ausgang: bit;
begin
    p_register : process (CLK, nRES)
    begin
        if nRES = '0' then
				Ausgang<='0';
        elsif CLK'event and CLK = '1' then
            if(Ausgang='1' and T= '1') then
				Q<='0';
				Ausgang<='0';
				elsif(Ausgang='0' and T= '1') then
				Q<='1';
				Ausgang<='1';
				end if;
        end if;
    end process p_register;
	 Q<=Ausgang;
end T_FlipFlop_arch;