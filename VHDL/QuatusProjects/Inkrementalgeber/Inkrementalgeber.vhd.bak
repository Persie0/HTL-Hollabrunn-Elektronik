--
-- Perzi Marvin
-- 20.01.2021
--

library IEEE;

use IEEE.std_logic_1164.all;


entity SimpleStateMachine is
    port(
        CLK     : in std_logic;
        nRES    : in std_logic;
        S       : in std_logic;
        WHEEL_L : out std_logic;
        WHEEL_R : out std_logic
    );
end entity SimpleStateMachine;

architecture SimpleStateMachine_arch of SimpleStateMachine is
    type state_type is (
        sSTOP,
        sDRIVE,
        sLEFT
    );
    signal curState, nextState : state_type;
	 
--register process
begin

    p_register : process (CLK, nRES)
    begin
        if nRES = '0' then
            curState <= sSTOP;
        elsif CLK'event and CLK = '1' then
            curState <= nextState;
        end if;
    end process p_register;
	 
--NSL
    p_nextstate : process (curState, S)
    begin
        nextState <= curState; -- Default-Anweisung

        case curState is
            when sSTOP =>
                nextState <= sDRIVE;

            when sDRIVE =>
                if (S = '0') then
                    nextState <= sDRIVE;
                else
                    nextState <= sLEFT;
                end if;

            when sLEFT =>
                if (S = '1') then
                    nextState <= sLEFT;
                else
                    nextState <= sDRIVE;
                end if;

            when others =>
                nextState <= sSTOP;
        end case;
    end process p_nextstate;
	 
--Ausgangslogik
    p_outputlogic : process(curState)
    begin
        if curState = sSTOP then
            WHEEL_L <= '0';
            WHEEL_R <= '0';
        elsif curState = sDRIVE then
            WHEEL_L <= '1';
            WHEEL_R <= '1';
        elsif curState = sLEFT then
            WHEEL_L <= '0';
            WHEEL_R <= '1';
        else -- Should never be reached
        end if;
    end process p_outputlogic;

end architecture SimpleStateMachine_arch;
