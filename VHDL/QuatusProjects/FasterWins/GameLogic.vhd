--Marvin Perzi
--20.03.2021

library ieee;
use ieee.std_logic_1164.all;

entity GameLogic is
	port(
		L : in std_logic;
		R : in std_logic;
		CLK : in std_logic;
      nRES : in std_logic;
      LED : out std_logic_vector(7 downto 0)
	);
end entity GameLogic;

architecture GameLogic_arch of GameLogic is
    signal LED_temp : std_logic_vector(7 downto 0);
	 signal stop: std_logic;
begin

    p_logic: process(nRES, CLK)
    begin
        if (nRES = '0') then
            LED_temp <= "00011000";
				stop <= '0';
        elsif (CLK'event and CLK = '1' and (L = '1' or R = '1')) then
            if (L = '1' and LED_temp(7) = '0' and stop = '0') then
                LED_temp <= LED_temp(6 downto 0) & '0';
				elsif(L = '1' and LED_temp(7) = '1' and LED_temp(6) = '1' and stop = '0')then
					LED_temp <= LED_temp(6 downto 0) & '0';
					stop <= '1';
            elsif (R = '1' and LED_temp(0) = '0' and stop = '0') then
                LED_temp <=  '0' & LED_temp(7 downto 1);
				elsif(L = '1' and LED_temp(0) = '1' and LED_temp(1) = '1' and stop = '0')then
					LED_temp <=  '0' & LED_temp(7 downto 1);
					stop <= '1';
            end if;
        end if;
    end process p_logic;

    LED <= LED_temp;

end architecture GameLogic_arch;
