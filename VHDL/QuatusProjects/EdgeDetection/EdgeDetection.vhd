--Marvin Perzi
--8.1.2021

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY EdgeDetection IS 
	PORT
	(
		CLk :  IN  STD_LOGIC;
		nRES :  IN  STD_LOGIC;
		sigIn :  IN  STD_LOGIC;
		pulseOut :  OUT  STD_LOGIC
	);
END EdgeDetection;

ARCHITECTURE EdgeDetection_arch OF EdgeDetection IS 
	signal puls: bit;
BEGIN
	PROCESS(CLk,nRES)
		BEGIN
		IF (nRES = '0') THEN
			pulseOut <= '0';
			puls <= '0';
		ELSIF (sigIn = '1' and puls = '0') THEN
			pulseOut <= '1';
			puls <= '1';
		ELSIF (sigIn = '1' and puls = '1') THEN
			pulseOut <= '0';
		ELSIF (sigIn = '0' and puls = '1') THEN
			puls <= '0';
		END IF;
	END PROCESS;
END ARCHITECTURE;