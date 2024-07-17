-- Author:  Marvin Perzi
-- Version: 2020-11-13


library IEEE;

use IEEE.std_logic_1164.all;

entity BinTo7SegV2 is
	port(
		b3, b2, b1, b0			: in std_logic; 	
		a, b, c, d, e, f, g	: out std_logic  
	);
end entity BinTo7SegV2;


architecture BinTo7Seg_archV2 of BinTo7SegV2 is
	signal inputs : std_logic_vector(3 downto 0);
	signal segments : std_logic_vector(6 downto 0);
begin
	inputs <= b3 & b2 & b1 & b0;
	segments <= "1111110" when inputs = "0000" else -- 0
					"0110000" when inputs = "0001" else -- 1....
					"1101101" when inputs = "0010" else
					"1111001" when inputs = "0011" else
					"0110011" when inputs = "0100" else
					"1011011" when inputs = "0101" else
					"1011111" when inputs = "0110" else
					"1110000" when inputs = "0111" else
					"1111111" when inputs = "1000" else
					"1111011" when inputs = "1001" else
					"1110111" when inputs = "1010" else -- A
					"0011111" when inputs = "1011" else
					"1001110" when inputs = "1100" else
					"0111101" when inputs = "1101" else
					"1001111" when inputs = "1110" else
					"1001111" when inputs = "1111" else
					"0000000";
	a <= segments(6);
	b <= segments(5);
	c <= segments(4);
	d <= segments(3);
	e <= segments(2);
	f <= segments(1);
	g <= segments(0);
end architecture BinTo7Seg_archV2;
