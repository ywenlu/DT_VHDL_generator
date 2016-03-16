LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

USE work.ADF.all;

ENTITY arbre2_comp_max IS
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
		en24x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en25x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en26x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en27x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en28x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en29x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en30x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en31x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en32x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en33x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en34x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en35x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en36x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en37x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en38x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en39x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en40x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en41x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en42x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en43x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en44x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en45x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en46x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en47x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en48x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en49x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en50x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en51x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en52x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en53x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en54x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en55x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en56x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en57x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en58x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en59x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en60x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en61x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en62x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		en63x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE max OF arbre2_comp_max IS
--	SIGNAL sortie_inter : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL compt_ex : INTEGER;  -- pour compter le temps d'execution pour chaque arbre
	SIGNAL enable : STD_LOGIC;  -- pour compter le temps d'execution pour chaque arbre
	SIGNAL compt_rom : INTEGER;
	SHARED VARIABLE elem : TAB(0 TO 62);
	SHARED VARIABLE max : INTEGER;

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
				elem(23) := TO_INTEGER(SIGNED(en24x));
				elem(24) := TO_INTEGER(SIGNED(en25x));
				elem(25) := TO_INTEGER(SIGNED(en26x));
				elem(26) := TO_INTEGER(SIGNED(en27x));
				elem(27) := TO_INTEGER(SIGNED(en28x));
				elem(28) := TO_INTEGER(SIGNED(en29x));
				elem(29) := TO_INTEGER(SIGNED(en30x));
				elem(30) := TO_INTEGER(SIGNED(en31x));
				elem(31) := TO_INTEGER(SIGNED(en32x));
				elem(32) := TO_INTEGER(SIGNED(en33x));
				elem(33) := TO_INTEGER(SIGNED(en34x));
				elem(34) := TO_INTEGER(SIGNED(en35x));
				elem(35) := TO_INTEGER(SIGNED(en36x));
				elem(36) := TO_INTEGER(SIGNED(en37x));
				elem(37) := TO_INTEGER(SIGNED(en38x));
				elem(38) := TO_INTEGER(SIGNED(en39x));
				elem(39) := TO_INTEGER(SIGNED(en40x));
				elem(40) := TO_INTEGER(SIGNED(en41x));
				elem(41) := TO_INTEGER(SIGNED(en42x));
				elem(42) := TO_INTEGER(SIGNED(en43x));
				elem(43) := TO_INTEGER(SIGNED(en44x));
				elem(44) := TO_INTEGER(SIGNED(en45x));
				elem(45) := TO_INTEGER(SIGNED(en46x));
				elem(46) := TO_INTEGER(SIGNED(en47x));
				elem(47) := TO_INTEGER(SIGNED(en48x));
				elem(48) := TO_INTEGER(SIGNED(en49x));
				elem(49) := TO_INTEGER(SIGNED(en50x));
				elem(50) := TO_INTEGER(SIGNED(en51x));
				elem(51) := TO_INTEGER(SIGNED(en52x));
				elem(52) := TO_INTEGER(SIGNED(en43x));
				elem(53) := TO_INTEGER(SIGNED(en44x));
				elem(54) := TO_INTEGER(SIGNED(en45x));
				elem(55) := TO_INTEGER(SIGNED(en46x));
				elem(56) := TO_INTEGER(SIGNED(en47x));
				elem(57) := TO_INTEGER(SIGNED(en48x));
				elem(58) := TO_INTEGER(SIGNED(en49x));
				elem(59) := TO_INTEGER(SIGNED(en50x));
				elem(60) := TO_INTEGER(SIGNED(en51x));
				elem(61) := TO_INTEGER(SIGNED(en52x));
				elem(62) := TO_INTEGER(SIGNED(en52x));
				max := elem(0);

				FOR i IN 0 TO 61 LOOP
					IF elem(i + 1) > max THEN
						max := elem(i + 1);
					END IF;
				END LOOP;
			END IF;
--			sortie_inter <= STD_LOGIC_VECTOR(TO_SIGNED(max, N));
			IF enable = '1' THEN
				sortie <= STD_LOGIC_VECTOR(TO_SIGNED(max, N));
			ELSE
				sortie <= (OTHERS => '0');
			END IF;
		END IF;
	END PROCESS;
	
	PROCESS (clk, reset, compt_ex, start) IS   --------generer le signal de enable, quand il faut recuperer la valeur
	BEGIN

		IF (reset = '1') THEN
			compt_ex <= 0;
			enable <= '0';
			compt_rom <= 0;

		ELSIF clk = '1' and clk'event THEN
			IF start = '1' THEN
				IF compt_rom = 2 THEN
					IF compt_ex = 33 THEN
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
	

--	PROCESS (enable) IS 
--	BEGIN
--		sortie_inter <= STD_LOGIC_VECTOR(TO_SIGNED(max, N));
--		IF enable = '1' THEN
--			sortie <= sortie_inter;
--		ELSE
--			sortie <= (OTHERS => '0');
--		END IF;
--	END PROCESS;
END ARCHITECTURE;