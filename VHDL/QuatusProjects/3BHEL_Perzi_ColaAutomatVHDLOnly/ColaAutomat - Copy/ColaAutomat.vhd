--Marvin Perzi
--8.1.2021

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ColaAutomat IS 
	PORT
	(
		CLk :  IN  STD_LOGIC;
		nRES :  IN  STD_LOGIC;
		E :  IN  STD_LOGIC;
		F :  IN  STD_LOGIC;
		K :  OUT  STD_LOGIC
	);
END ColaAutomat;

architecture ColaAutomat_arch of ColaAutomat is
    type state_type is (
        s00EUR,
        s05EUR,
        s10EUR,
		  s15EUR
    );
    signal curState, nextState : state_type;
	 
--register process
begin

    p_register : process (CLK, nRES)
    begin
        if nRES = '0' then
            curState <= s00EUR;
        elsif CLK'event and CLK = '1' then
            curState <= nextState;
        end if;
    end process p_register;
	 
--NSL
    p_nextstate : process (curState, E, F)
    begin
        nextState <= curState; -- Default-Anweisung

        case curState is
            when s15EUR =>
                nextState <= s00EUR;

            when s00EUR =>
                if (E = '1') then
                    nextState <= s10EUR;
					 elsif (F = '1') then
                    nextState <= s05EUR;
                end if;

            when s05EUR =>
                if (E = '1') then
                    nextState <= s15EUR;
					 elsif (F = '1') then
                    nextState <= s10EUR;
                end if;
					 
				when s10EUR =>
                if (E = '1' or F = '1') then
                    nextState <= s15EUR;
                end if;
            when others =>
                nextState <= s00EUR;
        end case;
    end process p_nextstate;
	 
--Ausgangslogik
    p_outputlogic : process(curState)
    begin
        if curState = s15EUR then
            K <= '1';
        else 
				K <= '0';
        end if;
    end process p_outputlogic;

end architecture ColaAutomat_arch;
