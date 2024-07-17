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
	S <= S1 & S0;
	Y <= A when S="00" else
		  B when S="01" else
		  C when S="10" else
		  D;
end arch_Mux4to1;