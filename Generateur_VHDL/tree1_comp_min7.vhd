LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

USE work.ADF.all;

ENTITY tree1_comp_min7 IS
	GENERIC (
		N : INTEGER := 16
	);
	PORT (
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		en1x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en2x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en3x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en4x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en5x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en6x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en7x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en8x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE min7 OF tree1_comp_min7 IS

BEGIN
	PROCESS (reset, clk) IS
		VARIABLE elem : TAB(0 TO 7);
		VARIABLE min : INTEGER;

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
				min := elem(0);

				FOR i IN 0 TO 6 LOOP
					IF elem(i + 1) < min THEN
						min := elem(i + 1);
					END IF;
				END LOOP;
				sortie <= STD_LOGIC_VECTOR(TO_SIGNED(min, N));
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE;