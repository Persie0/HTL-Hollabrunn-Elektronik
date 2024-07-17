--
-- Perzi Marvin
-- 10.03.2021
--

library IEEE;

use IEEE.std_logic_1164.all;


entity Inkrementalgeber is
    port(
        CLK     : in std_logic;
        nRES    : in std_logic;
        A       : in std_logic;
		  B       : in std_logic;
        TL : out std_logic;
        TR : out std_logic
    );
end entity Inkrementalgeber;

architecture Inkrementalgeber_arch of Inkrementalgeber is
    type state_type is (
        sIdle,
        sR1,
        sR2,
		  sTR,
		  sL1,
        sL2,
		  sTL
    );
    signal curState, nextState : state_type;
	 
--register process
begin

    p_register : process (CLK, nRES)
    begin
        if nRES = '0' then
            curState <= sIdle;
        elsif CLK'event and CLK = '1' then
            curState <= nextState;
        end if;
    end process p_register;
	 
--NSL
    p_nextstate : process (curState, A, B)
    begin
        nextState <= curState; -- Default-Anweisung

        case curState is

            when sIdle =>
                if (A = '1' and B = '0') then
                    nextState <= sR1;
                elsif (A = '0' and B = '1') then
                    nextState <= sL1;
                end if;
					 
					 
				when sR1 =>
                if (A = '0' and B = '0') then
                    nextState <= sIdle;
                 elsif (A = '1' and B = '1') then
                    nextState <= sR2;
                end if;

				when sR2 =>
                if (A = '0' and B = '0') then
                    nextState <= sTR;
                 elsif (A = '1' and B = '0') then
                    nextState <= sR1;
                end if;
					 
					 
					 
				when sL1 =>
                if (A = '0' and B = '0') then
                    nextState <= sIdle;
                 elsif (A = '1' and B = '1') then
                    nextState <= sL2;
                end if;
					 
					 	when sL2 =>
                if (A = '0' and B = '0') then
                    nextState <= sTL;
                 elsif (A = '0' and B = '1') then
                    nextState <= sL1;
                end if;



					 
            when others =>
                nextState <= sIdle;
        end case;
    end process p_nextstate;
	 
--Ausgangslogik
    p_outputlogic : process(curState)
    begin
        if curState = sTR then
            TL <= '0';
            TR <= '1';
			elsif curState = sTL then
            TL <= '1';
            TR <= '0';
			
        else
				TL <= '0';
				TR <= '0';
        end if;
    end process p_outputlogic;

end architecture Inkrementalgeber_arch;
