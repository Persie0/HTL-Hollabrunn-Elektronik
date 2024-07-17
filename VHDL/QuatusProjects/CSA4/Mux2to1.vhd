-- 
-- A simple Multiplexer
-- @author Marvin Perzi
-- @version 2020-11-08
--

library IEEE;

use IEEE.std_logic_1164.all;

-- entity declaration
entity Mux2to1 is
	port(
		A, B: in std_logic; -- data in ports
		SET : in std_logic; 		-- select pins
		Y : out std_logic 			-- data output
	);
end Mux2to1;

-- architecture declaration
architecture arch_Mux2to1 of Mux2to1 is
begin
	Y <= A when SET='0' else
		  B after 6 ns;
		 
end arch_Mux2to1;