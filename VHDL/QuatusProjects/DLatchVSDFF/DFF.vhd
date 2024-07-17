-- 
-- DLatch
-- @author Marvin Perzi
-- @version 2020-11-27
--

library IEEE;

use IEEE.std_logic_1164.all;

entity D_FF is
	port(
		D, nRes, CLK : in std_logic; 		
		QFF : out std_logic 		
	);
end D_FF;

architecture arch_DFF of D_FF is
begin
	DFF_p : process (D, nRes, CLK)
	begin
	if(nRes='0') then
		QFF <= '0';
	elsif(CLK'event and CLK='1') then
		QFF<=D;
	end if;
	end process DFF_p;
end arch_DFF;