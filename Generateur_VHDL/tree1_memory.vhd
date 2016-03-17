LIBRARY IEEE;	--! Bibliotheque standard IEEE
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tree1_memory IS
	GENERIC (
		N : INTEGER := 16	--! Taille des bus d'entree et sortie
	);
	PORT (
		data_in : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
		we : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		clk : IN STD_LOGIC;
		Gdrmn : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gdrmn, address 0x00
		Gdrmx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gdrmx, address 0x01
		Gmaxx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gmaxx, address 0x02
		Gminx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gminx, address 0x03
		Gpsdd : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gpsdd, address 0x04
		Gpsdq : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gpsdq, address 0x05
		Gpsdt : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gpsdt, address 0x06
		Gpsdu : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gpsdu, address 0x07
		Gstdx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gstdx, address 0x08
		Hdrmn : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hdrmn, address 0x09
		Hdrmx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hdrmx, address 0x0A
		Hmaxx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hmaxx, address 0x0B
		Hminx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hminx, address 0x0C
		Hpsdd : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hpsdd, address 0x0D
		Hpsdq : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hpsdq, address 0x0E
		Hpsdt : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hpsdt, address 0x0F
		Hpsdu : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hpsdu, address 0x10
		Hstdx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hstdx, address 0x11
		Rdrmn : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rdrmn, address 0x12
		Rdrmx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rdrmx, address 0x13
		Rmaxx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rmaxx, address 0x14
		Rminx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rminx, address 0x15
		Rpsdd : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rpsdd, address 0x16
		Rpsdq : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rpsdq, address 0x17
		Rpsdt : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rpsdt, address 0x18
		Rpsdu : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rpsdu, address 0x19
		Rstdx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rstdx, address 0x1A
		uEDA : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal uEDA, address 0x1B
		uHR : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal uHR, address 0x1C
		uRR : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)	--! Signal uRR, address 0x1D
		);
END ENTITY;

ARCHITECTURE lec_ecr OF tree1_memory IS
	TYPE DATA1 IS ARRAY(1 TO 30) of STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL reg_in, reg_out : DATA1;

TYPE DATA2 IS ARRAY(1 TO 29) of STD_LOGIC;
	SIGNAL mux_sel : DATA2;
	SIGNAL compt, compt_rom : INTEGER;

	COMPONENT mux_1to2
		GENERIC (
			N : INTEGER
		);
		PORT(
			sel : IN STD_LOGIC;
			d : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			y1 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			y2 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

BEGIN
	mux1 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(1),
		d => reg_out(1),
		y1 => reg_in(2),
		y2 => Hpsdq
	);
	mux2 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(2),
		d => reg_out(2),
		y1 => reg_in(3),
		y2 => Rpsdq
	);
	mux3 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(3),
		d => reg_out(3),
		y1 => reg_in(4),
		y2 => Gpsdq
	);
	mux4 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(4),
		d => reg_out(4),
		y1 => reg_in(5),
		y2 => Hpsdt
	);
	mux5 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(5),
		d => reg_out(5),
		y1 => reg_in(6),
		y2 => Rpsdt
	);
	mux6 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(6),
		d => reg_out(6),
		y1 => reg_in(7),
		y2 => Gpsdt
	);
	mux7 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(7),
		d => reg_out(7),
		y1 => reg_in(8),
		y2 => Hpsdd
	);
	mux8 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(8),
		d => reg_out(8),
		y1 => reg_in(9),
		y2 => Rpsdd
	);
	mux9 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(9),
		d => reg_out(9),
		y1 => reg_in(10),
		y2 => Gpsdd
	);
	mux10 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(10),
		d => reg_out(10),
		y1 => reg_in(11),
		y2 => Hpsdu
	);
	mux11 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(11),
		d => reg_out(11),
		y1 => reg_in(12),
		y2 => Rpsdu
	);
	mux12 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(12),
		d => reg_out(12),
		y1 => reg_in(13),
		y2 => Gpsdu
	);
	mux13 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(13),
		d => reg_out(13),
		y1 => reg_in(14),
		y2 => Hdrmx
	);
	mux14 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(14),
		d => reg_out(14),
		y1 => reg_in(15),
		y2 => Rdrmx
	);
	mux15 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(15),
		d => reg_out(15),
		y1 => reg_in(16),
		y2 => Gdrmx
	);
	mux16 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(16),
		d => reg_out(16),
		y1 => reg_in(17),
		y2 => Hdrmn
	);
	mux17 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(17),
		d => reg_out(17),
		y1 => reg_in(18),
		y2 => Rdrmn
	);
	mux18 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(18),
		d => reg_out(18),
		y1 => reg_in(19),
		y2 => Gdrmn
	);
	mux19 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(19),
		d => reg_out(19),
		y1 => reg_in(20),
		y2 => Hstdx
	);
	mux20 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(20),
		d => reg_out(20),
		y1 => reg_in(21),
		y2 => Rstdx
	);
	mux21 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(21),
		d => reg_out(21),
		y1 => reg_in(22),
		y2 => Gstdx
	);
	mux22 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(22),
		d => reg_out(22),
		y1 => reg_in(23),
		y2 => Hminx
	);
	mux23 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(23),
		d => reg_out(23),
		y1 => reg_in(24),
		y2 => Rminx
	);
	mux24 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(24),
		d => reg_out(24),
		y1 => reg_in(25),
		y2 => Gminx
	);
	mux25 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(25),
		d => reg_out(25),
		y1 => reg_in(26),
		y2 => Hmaxx
	);
	mux26 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(26),
		d => reg_out(26),
		y1 => reg_in(27),
		y2 => Rmaxx
	);
	mux27 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(27),
		d => reg_out(27),
		y1 => reg_in(28),
		y2 => Gmaxx
	);
	mux28 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(28),
		d => reg_out(28),
		y1 => reg_in(29),
		y2 => uHR
	);
	mux29 : mux_1to2
	GENERIC MAP(
		N => 16
	)
	PORT MAP(
		sel => mux_sel(29),
		d => reg_out(29),
		y1 => reg_in(30),
		y2 => uRR
	);

	PROCESS (clk, reset, we, compt, data_in, reg_out(30)) IS
	BEGIN
		reg_in(1) <= data_in;
		uEDA <= reg_out(30);
		IF (reset = '1') THEN
			compt <= 0;
			compt_rom <= 0;
		ELSIF clk = '1' and clk'event THEN
				IF (we = '1') THEN
					FOR i IN 1 TO 29 LOOP
						reg_out(i) <= reg_in(i);
					END LOOP;
					IF compt_rom = 2 THEN
						IF compt = 30 THEN
							FOR i IN 1 TO 29 LOOP
								mux_sel(i) <= '1';
							END LOOP;
							reg_out(30) <= reg_in(30);
							compt <= 1;
						ELSE
							reg_out(30) <= (OTHERS => '0');
							FOR i IN 1 TO 29 LOOP
								mux_sel(i) <= '0';
							END LOOP;
							compt <= compt + 1;
						END IF;
					ELSE
						compt_rom <= compt_rom + 1;
					END IF;
				END IF;
			END IF;
	END PROCESS;

END ARCHITECTURE;