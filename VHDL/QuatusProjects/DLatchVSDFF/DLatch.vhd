-- 
-- DLatch
-- @author Marvin Perzi
-- @version 2020-11-27
--

library IEEE;

use IEEE.std_logic_1164.all;

-- entity declaration
entity D_Latch is
	port(
		D, nRes, EN : in std_logic; 		
		QL : out std_logic 		
	);
end D_Latch;

architecture arch_DLatch of D_Latch is
begin
	dLatch_p : process (D, nRes, EN)
	begin
	if(nRes='0') then
		QL <= '0';
	elsif(EN='1') then
		QL<=D;
	end if;
	end process dLatch_p;
end arch_DLatch;