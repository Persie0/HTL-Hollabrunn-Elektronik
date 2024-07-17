-- 
-- A simple Multiplexer
-- @author Marvin Perzi
-- @version 2020-11-08
--

library IEEE;

use IEEE.std_logic_1164.all;

-- entity declaration
entity Mux4to1 is
	port(
		A, B, C, D : in std_logic; -- data in ports
		S0, S1 : in std_logic; 		-- select pins
		Y : out std_logic 			-- data output
	);
end Mux4to1;

-- architecture declaration
architecture arch_Mux4to1 of Mux4to1 is
begin
	Y <= A when S0='0' and S1='1'else
		  B when S0='1' and S1='0'else
		  C when S0='0' and S1='1'else
		  D;
end arch_Mux4to1;