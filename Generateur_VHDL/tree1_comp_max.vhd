LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

USE work.ADF.all;

ENTITY tree1_comp_max IS
	GENERIC (
		N : INTEGER := 16
	);
	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		start : IN STD_LOGIC;
		en1x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en2x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en3x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en4x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en5x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en6x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en7x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en8x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en9x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en10x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en11x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en12x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en13x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en14x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en15x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en16x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en17x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en18x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en19x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en20x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en21x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en22x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en23x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE max OF tree1_comp_max IS

	SHARED VARIABLE elem : TAB(0 TO 22);
	SHARED VARIABLE max : INTEGER;
	SIGNAL compt_ex : INTEGER; --pour compter le temps d'execution pour chaque arbre
	SIGNAL enable : STD_LOGIC;
	SIGNAL compt_rom : INTEGER;
	BEGIN
	PROCESS (reset, clk, enable) IS
		BEGIN
		IF reset = '1' THEN
			sortie <= (OTHERS => '0');
		ELSE
			IF clk = '1' AND clk'EVENT THEN
				elem(0) := TO_INTEGER(SIGNED(en1x));
				elem(1) := TO_INTEGER(SIGNED(en2x));
				elem(2) := TO_INTEGER(SIGNED(en3x));
				elem(3) := TO_INTEGER(SIGNED(en4x));
				elem(4) := TO_INTEGER(SIGNED(en5x));
				elem(5) := TO_INTEGER(SIGNED(en6x));
				elem(6) := TO_INTEGER(SIGNED(en7x));
				elem(7) := TO_INTEGER(SIGNED(en8x));
				elem(8) := TO_INTEGER(SIGNED(en9x));
				elem(9) := TO_INTEGER(SIGNED(en10x));
				elem(10) := TO_INTEGER(SIGNED(en11x));
				elem(11) := TO_INTEGER(SIGNED(en12x));
				elem(12) := TO_INTEGER(SIGNED(en13x));
				elem(13) := TO_INTEGER(SIGNED(en14x));
				elem(14) := TO_INTEGER(SIGNED(en15x));
				elem(15) := TO_INTEGER(SIGNED(en16x));
				elem(16) := TO_INTEGER(SIGNED(en17x));
				elem(17) := TO_INTEGER(SIGNED(en18x));
				elem(18) := TO_INTEGER(SIGNED(en19x));
				elem(19) := TO_INTEGER(SIGNED(en20x));
				elem(20) := TO_INTEGER(SIGNED(en21x));
				elem(21) := TO_INTEGER(SIGNED(en22x));
				elem(22) := TO_INTEGER(SIGNED(en23x));
				max := elem(0);

				FOR i IN 0 TO 21 LOOP
					IF elem(i + 1) > max THEN
						max := elem(i + 1);
					END IF;
				END LOOP;
			END IF;
			IF enable = '1' THEN
				sortie <= STD_LOGIC_VECTOR(TO_SIGNED(max, N));
			ELSE
				sortie <= (OTHERS => '0');
			END IF;
		END IF;
	END PROCESS;

	PROCESS (reset, clk, compt_ex, start) IS
	BEGIN
		IF (reset = '1') THEN
			compt_ex <= 0;
			compt_rom <= 0;
			enable <= '0';
		ELSIF clk = '1' and clk'event THEN
			IF start= '1' THEN
				IF compt_rom = 2 THEN
					IF compt_ex <= 33 THEN
						enable <= '1';
						compt_ex <= 4;
					ELSE
						enable <= '0';
						compt_ex <= compt_ex + 1;
					END IF;
				ELSE
					compt_rom <= compt_rom + 1;
				END IF;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE;