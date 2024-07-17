--
-- Perzi Marvin
-- 10.03.2021
--

library IEEE;

use IEEE.std_logic_1164.all;


entity FullAdder is
    port(
        CI     : in std_logic;
        A       : in std_logic;
		  B       : in std_logic;
        SUM : out std_logic;
        CO : out std_logic
    );
end entity FullAdder;

architecture FullAdder_arch of FullAdder is
    signal G : std_logic;
	 signal P : std_logic;
	 signal R : std_logic;
begin
	G <= A and B after 6 ns;
	P <= A xor B after 6 ns;
	R <= CI and P after 6 ns;
	CO <= R or G after 6 ns;
	SUM <= CI and P after 6 ns;

end architecture FullAdder_arch;
