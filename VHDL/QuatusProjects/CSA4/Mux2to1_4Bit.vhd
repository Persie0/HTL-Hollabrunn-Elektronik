-- 
-- A simple Multiplexer
-- @author Marvin Perzi
-- @version 2020-11-08
--

library IEEE;

use IEEE.std_logic_1164.all;

-- entity declaration
entity Mux2to1_4Bit is
	port(
		A, B: in std_logic_vector(3 downto 0); -- data in ports
		SET : in std_logic; 		-- select pins
		Y : out std_logic_vector(3 downto 0) 	-- data output
	);
end Mux2to1_4Bit;

-- architecture declaration
architecture arch_Mux2to1_4Bit of Mux2to1_4Bit is
begin
	Y <= A when SET='0' else
		  B after 6 ns;
end arch_Mux2to1_4Bit;