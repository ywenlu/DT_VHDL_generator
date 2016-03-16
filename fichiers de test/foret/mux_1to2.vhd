LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY mux_1to2 IS
	GENERIC(
		N : INTEGER := 32
	);
	PORT(
		sel : IN STD_LOGIC;
		d: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		y1 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		y2 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
END ENTITY;

ARCHITECTURE appartenance OF mux_1to2 IS

signal temp : std_logic_vector(N-1 DOWNTO 0);

BEGIN

	temp <= d;

	PROCESS(sel, temp) IS
	BEGIN
		IF sel = '0' THEN
			y1 <= temp;	
			y2 <= (others=>'0');
		ELSE
			y2 <= temp;
			y1 <= (others=>'0');
		END IF;

	END PROCESS;
END ARCHITECTURE;