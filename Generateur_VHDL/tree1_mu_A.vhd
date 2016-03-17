LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tree1_mu_A IS
	GENERIC(
		N : INTEGER := 16;
		a : INTEGER := 0;
		b : INTEGER := 0;
		min : INTEGER := 0;
		max : INTEGER := 0
	);
	PORT(
		clk : IN STD_LOGIC;
		reset: IN STD_LOGIC;
		donnees: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		great_sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		less_sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
END ENTITY;

ARCHITECTURE appartenance OF tree1_mu_A IS

BEGIN
	PROCESS(clk, reset, donnees) IS
		VARIABLE less_y : INTEGER;
		VARIABLE great_y : INTEGER;
	BEGIN
		IF reset = '1' THEN
			great_y := 0;
			less_y := 0;
		ELSE
			IF (clk'EVENT AND clk = '1') THEN
				great_y := a * TO_INTEGER(SIGNED(donnees)) + b;
				IF TO_INTEGER(SIGNED(donnees)) <= min THEN
					great_y := 0;
				ELSIF TO_INTEGER(SIGNED(donnees)) > max THEN
					great_y := 100;
				END IF;
				less_y := 100 - great_y;
			END IF;
		END IF;
		great_sortie <= STD_LOGIC_VECTOR(TO_SIGNED(great_y, N));
		less_sortie <= STD_LOGIC_VECTOR(TO_SIGNED(less_y, N));
	END PROCESS;
END ARCHITECTURE;
