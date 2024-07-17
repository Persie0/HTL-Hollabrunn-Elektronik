library IEEE;

use IEEE.std_logic_1164.all;

entity BinTo7Seg is
	port(
		b3, b2, b1, b0			: in std_logic; 	-- Binary Inputs
		a, b, c, d, e, f, g	: out std_logic   -- 7 Segment Output
	);
end entity BinTo7Seg;


architecture BinTo7Seg_arch of BinTo7Seg is
begin
	A <= (b3 or b2 or b1 or not(b0)) and (b3 or not(b2) or b1 or b0);
	B <= (b3 or not(b2) or b1 or not(b0)) and (b3 or not(b2) or not(b1) or b0);
	C <= (b3 or b2 or not(b1) or b0);
	D <= (b3 or b2 or b1 or not(b0)) and (b3 or not(b2) or b1 or b0) and (b3 or not(b2) or not(b1) or not(b0));
	E <= (not(b3) and not(b2) and not(b1) and not(b0)) or (not(b3) and not(b2) and b1 and not(b0)) or (not(b3) and b2 and b1 and not(b0)) or (b3 and not(b2) and not(b1) and not(b0));
	F <= (b3 or b2 or b1 or not(b0)) and (b3 or b2 or not(b1) or b0) and (b3 or b2 or not(b1) or not(b0)) and (b3 or not(b2) or not(b1) or not(b0));
	G <= (b3 or b2 or b1 or b0) and (b3 or b2 or b1 or not(b0)) and (b3 or not(b2) or not(b1) or not(b0));
end architecture BinTo7Seg_arch;
