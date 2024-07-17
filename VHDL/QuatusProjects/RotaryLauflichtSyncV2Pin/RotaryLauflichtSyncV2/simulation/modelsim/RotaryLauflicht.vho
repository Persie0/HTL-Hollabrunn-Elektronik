-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "04/15/2021 08:09:42"

-- 
-- Device: Altera 10M16SAU169C8G Package UFBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_G1,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_F5,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_F6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_E7,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_C4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_C5,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	RotaryLauflicht IS
    PORT (
	LED : OUT std_logic_vector(7 DOWNTO 0);
	CLK12M : IN std_logic;
	ROT_BTN : IN std_logic;
	ROT_A : IN std_logic;
	ROT_B : IN std_logic
	);
END RotaryLauflicht;

-- Design Ports Information
-- LED[7]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[6]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[5]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[4]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[3]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[2]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[1]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[0]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK12M	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ROT_BTN	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ROT_A	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ROT_B	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF RotaryLauflicht IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LED : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_CLK12M : std_logic;
SIGNAL ww_ROT_BTN : std_logic;
SIGNAL ww_ROT_A : std_logic;
SIGNAL ww_ROT_B : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ROT_BTN~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLK12M~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \LED[7]~output_o\ : std_logic;
SIGNAL \LED[6]~output_o\ : std_logic;
SIGNAL \LED[5]~output_o\ : std_logic;
SIGNAL \LED[4]~output_o\ : std_logic;
SIGNAL \LED[3]~output_o\ : std_logic;
SIGNAL \LED[2]~output_o\ : std_logic;
SIGNAL \LED[1]~output_o\ : std_logic;
SIGNAL \LED[0]~output_o\ : std_logic;
SIGNAL \CLK12M~input_o\ : std_logic;
SIGNAL \CLK12M~inputclkctrl_outclk\ : std_logic;
SIGNAL \ROT_B~input_o\ : std_logic;
SIGNAL \ROT_BTN~input_o\ : std_logic;
SIGNAL \ROT_BTN~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst3|inst3~q\ : std_logic;
SIGNAL \inst3|inst4~feeder_combout\ : std_logic;
SIGNAL \inst3|inst4~q\ : std_logic;
SIGNAL \ROT_A~input_o\ : std_logic;
SIGNAL \inst4|inst3~q\ : std_logic;
SIGNAL \inst4|inst4~q\ : std_logic;
SIGNAL \inst|Selector4~2_combout\ : std_logic;
SIGNAL \inst|Selector0~1_combout\ : std_logic;
SIGNAL \inst|Selector0~0_combout\ : std_logic;
SIGNAL \inst|Selector0~2_combout\ : std_logic;
SIGNAL \inst|curState.sIdle~q\ : std_logic;
SIGNAL \inst|Selector1~2_combout\ : std_logic;
SIGNAL \inst|Selector1~3_combout\ : std_logic;
SIGNAL \inst|Selector1~4_combout\ : std_logic;
SIGNAL \inst|curState.sR1~q\ : std_logic;
SIGNAL \inst|Selector2~0_combout\ : std_logic;
SIGNAL \inst|curState.sR2~q\ : std_logic;
SIGNAL \inst|Selector3~0_combout\ : std_logic;
SIGNAL \inst|curState.sTR~q\ : std_logic;
SIGNAL \inst|Selector1~1_combout\ : std_logic;
SIGNAL \inst|Selector4~3_combout\ : std_logic;
SIGNAL \inst|Selector4~4_combout\ : std_logic;
SIGNAL \inst|curState.sL1~q\ : std_logic;
SIGNAL \inst|Selector5~0_combout\ : std_logic;
SIGNAL \inst|curState.sL2~q\ : std_logic;
SIGNAL \inst|Selector1~0_combout\ : std_logic;
SIGNAL \inst|curState.sTL~q\ : std_logic;
SIGNAL \inst2|LED_temp[0]~0_combout\ : std_logic;
SIGNAL \inst2|LED_temp[0]~8_combout\ : std_logic;
SIGNAL \inst2|LED_temp~7_combout\ : std_logic;
SIGNAL \inst2|LED_temp~6_combout\ : std_logic;
SIGNAL \inst2|LED_temp~5_combout\ : std_logic;
SIGNAL \inst2|LED_temp~4_combout\ : std_logic;
SIGNAL \inst2|LED_temp~3_combout\ : std_logic;
SIGNAL \inst2|LED_temp~2_combout\ : std_logic;
SIGNAL \inst2|LED_temp[7]~1_combout\ : std_logic;
SIGNAL \inst2|LED_temp\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst2|ALT_INV_LED_temp\ : std_logic_vector(7 DOWNTO 7);
SIGNAL \ALT_INV_ROT_BTN~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

LED <= ww_LED;
ww_CLK12M <= CLK12M;
ww_ROT_BTN <= ROT_BTN;
ww_ROT_A <= ROT_A;
ww_ROT_B <= ROT_B;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\ROT_BTN~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \ROT_BTN~input_o\);

\CLK12M~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLK12M~input_o\);
\inst2|ALT_INV_LED_temp\(7) <= NOT \inst2|LED_temp\(7);
\ALT_INV_ROT_BTN~inputclkctrl_outclk\ <= NOT \ROT_BTN~inputclkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X26_Y19_N12
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X50_Y22_N16
\LED[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|ALT_INV_LED_temp\(7),
	devoe => ww_devoe,
	o => \LED[7]~output_o\);

-- Location: IOOBUF_X50_Y21_N9
\LED[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|LED_temp\(6),
	devoe => ww_devoe,
	o => \LED[6]~output_o\);

-- Location: IOOBUF_X50_Y21_N2
\LED[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|LED_temp\(5),
	devoe => ww_devoe,
	o => \LED[5]~output_o\);

-- Location: IOOBUF_X50_Y22_N9
\LED[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|LED_temp\(4),
	devoe => ww_devoe,
	o => \LED[4]~output_o\);

-- Location: IOOBUF_X50_Y24_N16
\LED[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|LED_temp\(3),
	devoe => ww_devoe,
	o => \LED[3]~output_o\);

-- Location: IOOBUF_X50_Y22_N2
\LED[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|LED_temp\(2),
	devoe => ww_devoe,
	o => \LED[2]~output_o\);

-- Location: IOOBUF_X50_Y22_N23
\LED[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|LED_temp\(1),
	devoe => ww_devoe,
	o => \LED[1]~output_o\);

-- Location: IOOBUF_X50_Y24_N9
\LED[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|LED_temp\(0),
	devoe => ww_devoe,
	o => \LED[0]~output_o\);

-- Location: IOIBUF_X0_Y8_N15
\CLK12M~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK12M,
	o => \CLK12M~input_o\);

-- Location: CLKCTRL_G3
\CLK12M~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLK12M~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLK12M~inputclkctrl_outclk\);

-- Location: IOIBUF_X50_Y21_N15
\ROT_B~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ROT_B,
	o => \ROT_B~input_o\);

-- Location: IOIBUF_X0_Y8_N22
\ROT_BTN~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ROT_BTN,
	o => \ROT_BTN~input_o\);

-- Location: CLKCTRL_G4
\ROT_BTN~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \ROT_BTN~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \ROT_BTN~inputclkctrl_outclk\);

-- Location: FF_X38_Y21_N25
\inst3|inst3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	asdata => \ROT_B~input_o\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|inst3~q\);

-- Location: LCCOMB_X38_Y21_N22
\inst3|inst4~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst3|inst4~feeder_combout\ = \inst3|inst3~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst3|inst3~q\,
	combout => \inst3|inst4~feeder_combout\);

-- Location: FF_X38_Y21_N23
\inst3|inst4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	d => \inst3|inst4~feeder_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|inst4~q\);

-- Location: IOIBUF_X50_Y21_N23
\ROT_A~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ROT_A,
	o => \ROT_A~input_o\);

-- Location: FF_X38_Y21_N27
\inst4|inst3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	asdata => \ROT_A~input_o\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|inst3~q\);

-- Location: FF_X38_Y21_N9
\inst4|inst4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	asdata => \inst4|inst3~q\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|inst4~q\);

-- Location: LCCOMB_X38_Y21_N10
\inst|Selector4~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Selector4~2_combout\ = (!\inst|curState.sTL~q\ & !\inst|curState.sTR~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|curState.sTL~q\,
	datad => \inst|curState.sTR~q\,
	combout => \inst|Selector4~2_combout\);

-- Location: LCCOMB_X38_Y21_N24
\inst|Selector0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Selector0~1_combout\ = ((!\inst3|inst4~q\ & !\inst4|inst4~q\)) # (!\inst|curState.sIdle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|inst4~q\,
	datab => \inst|curState.sIdle~q\,
	datad => \inst4|inst4~q\,
	combout => \inst|Selector0~1_combout\);

-- Location: LCCOMB_X38_Y21_N0
\inst|Selector0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Selector0~0_combout\ = ((!\inst|curState.sIdle~q\ & (\inst4|inst4~q\ $ (!\inst3|inst4~q\)))) # (!\inst|Selector4~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst4~q\,
	datab => \inst|curState.sIdle~q\,
	datac => \inst3|inst4~q\,
	datad => \inst|Selector4~2_combout\,
	combout => \inst|Selector0~0_combout\);

-- Location: LCCOMB_X38_Y21_N18
\inst|Selector0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Selector0~2_combout\ = (!\inst|Selector0~0_combout\ & (((!\inst|curState.sL1~q\ & !\inst|curState.sR1~q\)) # (!\inst|Selector0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|curState.sL1~q\,
	datab => \inst|curState.sR1~q\,
	datac => \inst|Selector0~1_combout\,
	datad => \inst|Selector0~0_combout\,
	combout => \inst|Selector0~2_combout\);

-- Location: FF_X38_Y21_N19
\inst|curState.sIdle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	d => \inst|Selector0~2_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|curState.sIdle~q\);

-- Location: LCCOMB_X38_Y21_N12
\inst|Selector1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Selector1~2_combout\ = (\inst|curState.sR1~q\ & ((\inst|curState.sL2~q\))) # (!\inst|curState.sR1~q\ & (\inst|curState.sR2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|curState.sR2~q\,
	datac => \inst|curState.sL2~q\,
	datad => \inst|curState.sR1~q\,
	combout => \inst|Selector1~2_combout\);

-- Location: LCCOMB_X38_Y21_N6
\inst|Selector1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Selector1~3_combout\ = (\inst|curState.sIdle~q\ & (!\inst|Selector1~2_combout\ & (\inst|curState.sR1~q\ $ (\inst4|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|curState.sIdle~q\,
	datab => \inst|curState.sR1~q\,
	datac => \inst4|inst4~q\,
	datad => \inst|Selector1~2_combout\,
	combout => \inst|Selector1~3_combout\);

-- Location: LCCOMB_X38_Y21_N28
\inst|Selector1~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Selector1~4_combout\ = (\inst|Selector4~2_combout\ & ((\inst3|inst4~q\ & (!\inst4|inst4~q\ & \inst|Selector1~3_combout\)) # (!\inst3|inst4~q\ & (\inst4|inst4~q\ & !\inst|Selector1~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|inst4~q\,
	datab => \inst4|inst4~q\,
	datac => \inst|Selector4~2_combout\,
	datad => \inst|Selector1~3_combout\,
	combout => \inst|Selector1~4_combout\);

-- Location: FF_X38_Y21_N29
\inst|curState.sR1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	d => \inst|Selector1~4_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|curState.sR1~q\);

-- Location: LCCOMB_X38_Y21_N16
\inst|Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Selector2~0_combout\ = (\inst3|inst4~q\ & ((\inst|curState.sR2~q\) # ((\inst|curState.sR1~q\ & \inst4|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|inst4~q\,
	datab => \inst|curState.sR1~q\,
	datac => \inst|curState.sR2~q\,
	datad => \inst4|inst4~q\,
	combout => \inst|Selector2~0_combout\);

-- Location: FF_X38_Y21_N17
\inst|curState.sR2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	d => \inst|Selector2~0_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|curState.sR2~q\);

-- Location: LCCOMB_X39_Y21_N2
\inst|Selector3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Selector3~0_combout\ = (!\inst4|inst4~q\ & (!\inst3|inst4~q\ & (\inst|curState.sR2~q\ & \inst|Selector4~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|inst4~q\,
	datab => \inst3|inst4~q\,
	datac => \inst|curState.sR2~q\,
	datad => \inst|Selector4~2_combout\,
	combout => \inst|Selector3~0_combout\);

-- Location: FF_X39_Y21_N3
\inst|curState.sTR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	d => \inst|Selector3~0_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|curState.sTR~q\);

-- Location: LCCOMB_X38_Y21_N20
\inst|Selector1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Selector1~1_combout\ = (\inst3|inst4~q\ & (((\inst|curState.sL2~q\) # (!\inst|curState.sIdle~q\)))) # (!\inst3|inst4~q\ & ((\inst4|inst4~q\ & (\inst|curState.sL2~q\)) # (!\inst4|inst4~q\ & ((!\inst|curState.sIdle~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|inst4~q\,
	datab => \inst4|inst4~q\,
	datac => \inst|curState.sL2~q\,
	datad => \inst|curState.sIdle~q\,
	combout => \inst|Selector1~1_combout\);

-- Location: LCCOMB_X38_Y21_N2
\inst|Selector4~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Selector4~3_combout\ = (\inst|curState.sL1~q\ & ((\inst|Selector1~1_combout\) # (\inst3|inst4~q\ $ (\inst4|inst4~q\)))) # (!\inst|curState.sL1~q\ & (\inst3|inst4~q\ & (!\inst4|inst4~q\ & \inst|Selector1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|inst4~q\,
	datab => \inst4|inst4~q\,
	datac => \inst|curState.sL1~q\,
	datad => \inst|Selector1~1_combout\,
	combout => \inst|Selector4~3_combout\);

-- Location: LCCOMB_X38_Y21_N30
\inst|Selector4~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Selector4~4_combout\ = (!\inst|curState.sTL~q\ & (!\inst|curState.sTR~q\ & (!\inst|Selector1~0_combout\ & \inst|Selector4~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|curState.sTL~q\,
	datab => \inst|curState.sTR~q\,
	datac => \inst|Selector1~0_combout\,
	datad => \inst|Selector4~3_combout\,
	combout => \inst|Selector4~4_combout\);

-- Location: FF_X38_Y21_N31
\inst|curState.sL1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	d => \inst|Selector4~4_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|curState.sL1~q\);

-- Location: LCCOMB_X38_Y21_N4
\inst|Selector5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Selector5~0_combout\ = (\inst4|inst4~q\ & ((\inst|curState.sL2~q\) # ((\inst|curState.sL1~q\ & \inst3|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|curState.sL1~q\,
	datab => \inst3|inst4~q\,
	datac => \inst|curState.sL2~q\,
	datad => \inst4|inst4~q\,
	combout => \inst|Selector5~0_combout\);

-- Location: FF_X38_Y21_N5
\inst|curState.sL2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	d => \inst|Selector5~0_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|curState.sL2~q\);

-- Location: LCCOMB_X38_Y21_N26
\inst|Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Selector1~0_combout\ = (!\inst3|inst4~q\ & (\inst|curState.sL2~q\ & !\inst4|inst4~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|inst4~q\,
	datab => \inst|curState.sL2~q\,
	datad => \inst4|inst4~q\,
	combout => \inst|Selector1~0_combout\);

-- Location: FF_X39_Y21_N13
\inst|curState.sTL\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	asdata => \inst|Selector1~0_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|curState.sTL~q\);

-- Location: LCCOMB_X39_Y21_N0
\inst2|LED_temp[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|LED_temp[0]~0_combout\ = (\inst|curState.sTL~q\ & ((\inst2|LED_temp\(7)) # ((\inst|curState.sTR~q\ & !\inst2|LED_temp\(0))))) # (!\inst|curState.sTL~q\ & (\inst|curState.sTR~q\ & (!\inst2|LED_temp\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|curState.sTL~q\,
	datab => \inst|curState.sTR~q\,
	datac => \inst2|LED_temp\(0),
	datad => \inst2|LED_temp\(7),
	combout => \inst2|LED_temp[0]~0_combout\);

-- Location: LCCOMB_X39_Y21_N14
\inst2|LED_temp[0]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|LED_temp[0]~8_combout\ = (\inst2|LED_temp\(0) & (((!\inst2|LED_temp[0]~0_combout\)))) # (!\inst2|LED_temp\(0) & (\inst|curState.sTR~q\ & (\inst2|LED_temp\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|curState.sTR~q\,
	datab => \inst2|LED_temp\(1),
	datac => \inst2|LED_temp\(0),
	datad => \inst2|LED_temp[0]~0_combout\,
	combout => \inst2|LED_temp[0]~8_combout\);

-- Location: FF_X39_Y21_N15
\inst2|LED_temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	d => \inst2|LED_temp[0]~8_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|LED_temp\(0));

-- Location: LCCOMB_X39_Y21_N28
\inst2|LED_temp~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|LED_temp~7_combout\ = (\inst|curState.sTL~q\ & ((\inst2|LED_temp\(7) & ((\inst2|LED_temp\(0)))) # (!\inst2|LED_temp\(7) & (\inst2|LED_temp\(2))))) # (!\inst|curState.sTL~q\ & (\inst2|LED_temp\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|LED_temp\(2),
	datab => \inst|curState.sTL~q\,
	datac => \inst2|LED_temp\(0),
	datad => \inst2|LED_temp\(7),
	combout => \inst2|LED_temp~7_combout\);

-- Location: FF_X39_Y21_N29
\inst2|LED_temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	d => \inst2|LED_temp~7_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	ena => \inst2|LED_temp[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|LED_temp\(1));

-- Location: LCCOMB_X39_Y21_N10
\inst2|LED_temp~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|LED_temp~6_combout\ = (\inst|curState.sTL~q\ & ((\inst2|LED_temp\(7) & (\inst2|LED_temp\(1))) # (!\inst2|LED_temp\(7) & ((\inst2|LED_temp\(3)))))) # (!\inst|curState.sTL~q\ & (((\inst2|LED_temp\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|curState.sTL~q\,
	datab => \inst2|LED_temp\(1),
	datac => \inst2|LED_temp\(3),
	datad => \inst2|LED_temp\(7),
	combout => \inst2|LED_temp~6_combout\);

-- Location: FF_X39_Y21_N11
\inst2|LED_temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	d => \inst2|LED_temp~6_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	ena => \inst2|LED_temp[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|LED_temp\(2));

-- Location: LCCOMB_X39_Y21_N20
\inst2|LED_temp~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|LED_temp~5_combout\ = (\inst|curState.sTL~q\ & ((\inst2|LED_temp\(7) & ((\inst2|LED_temp\(2)))) # (!\inst2|LED_temp\(7) & (\inst2|LED_temp\(4))))) # (!\inst|curState.sTL~q\ & (\inst2|LED_temp\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|LED_temp\(4),
	datab => \inst|curState.sTL~q\,
	datac => \inst2|LED_temp\(2),
	datad => \inst2|LED_temp\(7),
	combout => \inst2|LED_temp~5_combout\);

-- Location: FF_X39_Y21_N21
\inst2|LED_temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	d => \inst2|LED_temp~5_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	ena => \inst2|LED_temp[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|LED_temp\(3));

-- Location: LCCOMB_X39_Y21_N30
\inst2|LED_temp~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|LED_temp~4_combout\ = (\inst|curState.sTL~q\ & ((\inst2|LED_temp\(7) & ((\inst2|LED_temp\(3)))) # (!\inst2|LED_temp\(7) & (\inst2|LED_temp\(5))))) # (!\inst|curState.sTL~q\ & (\inst2|LED_temp\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|curState.sTL~q\,
	datab => \inst2|LED_temp\(5),
	datac => \inst2|LED_temp\(3),
	datad => \inst2|LED_temp\(7),
	combout => \inst2|LED_temp~4_combout\);

-- Location: FF_X39_Y21_N31
\inst2|LED_temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	d => \inst2|LED_temp~4_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	ena => \inst2|LED_temp[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|LED_temp\(4));

-- Location: LCCOMB_X39_Y21_N8
\inst2|LED_temp~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|LED_temp~3_combout\ = (\inst|curState.sTL~q\ & ((\inst2|LED_temp\(7) & ((\inst2|LED_temp\(4)))) # (!\inst2|LED_temp\(7) & (\inst2|LED_temp\(6))))) # (!\inst|curState.sTL~q\ & (\inst2|LED_temp\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|LED_temp\(6),
	datab => \inst|curState.sTL~q\,
	datac => \inst2|LED_temp\(4),
	datad => \inst2|LED_temp\(7),
	combout => \inst2|LED_temp~3_combout\);

-- Location: FF_X39_Y21_N9
\inst2|LED_temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	d => \inst2|LED_temp~3_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	ena => \inst2|LED_temp[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|LED_temp\(5));

-- Location: LCCOMB_X39_Y21_N26
\inst2|LED_temp~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|LED_temp~2_combout\ = ((\inst|curState.sTL~q\ & \inst2|LED_temp\(5))) # (!\inst2|LED_temp\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|curState.sTL~q\,
	datab => \inst2|LED_temp\(5),
	datad => \inst2|LED_temp\(7),
	combout => \inst2|LED_temp~2_combout\);

-- Location: FF_X39_Y21_N27
\inst2|LED_temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	d => \inst2|LED_temp~2_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	ena => \inst2|LED_temp[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|LED_temp\(6));

-- Location: LCCOMB_X39_Y21_N16
\inst2|LED_temp[7]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|LED_temp[7]~1_combout\ = (\inst2|LED_temp\(7) & (((!\inst|curState.sTL~q\)) # (!\inst2|LED_temp\(6)))) # (!\inst2|LED_temp\(7) & (((\inst2|LED_temp[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|LED_temp\(6),
	datab => \inst|curState.sTL~q\,
	datac => \inst2|LED_temp\(7),
	datad => \inst2|LED_temp[0]~0_combout\,
	combout => \inst2|LED_temp[7]~1_combout\);

-- Location: FF_X39_Y21_N17
\inst2|LED_temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK12M~inputclkctrl_outclk\,
	d => \inst2|LED_temp[7]~1_combout\,
	clrn => \ALT_INV_ROT_BTN~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|LED_temp\(7));

-- Location: UNVM_X0_Y18_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X25_Y28_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

ww_LED(7) <= \LED[7]~output_o\;

ww_LED(6) <= \LED[6]~output_o\;

ww_LED(5) <= \LED[5]~output_o\;

ww_LED(4) <= \LED[4]~output_o\;

ww_LED(3) <= \LED[3]~output_o\;

ww_LED(2) <= \LED[2]~output_o\;

ww_LED(1) <= \LED[1]~output_o\;

ww_LED(0) <= \LED[0]~output_o\;
END structure;


