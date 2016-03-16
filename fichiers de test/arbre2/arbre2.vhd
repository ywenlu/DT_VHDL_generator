LIBRARY IEEE;
USE ieee.std_logic_1164.all;

USE ieee.numeric_std.all;LIBRARY work;

ENTITY arbre2 is
	GENERIC (
		N : integer := 16
	);
	PORT (
		clk : IN STD_LOGIC;
		start : IN STD_LOGIC;
		reset : IN STD_LOGIC;
--		data_in : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
--		sortie : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
		pourcent1 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
		pourcent2 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
	);
end ENTITY;

ARCHITECTURE generate_arbre of arbre2 is

	COMPONENT arbre2_memory
		GENERIC (
			N : INTEGER
		);
		PORT(
			we : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			clk : IN STD_LOGIC;
			data_in : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Gdrmn : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Gdrmx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Gmaxx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Gminx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Gpsdd : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Gpsdq : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Gpsdt : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Gpsdu : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Gstdx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Hdrmn : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Hdrmx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Hmaxx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Hminx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Hpsdd : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Hpsdq : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Hpsdt : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Hpsdu : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Hstdx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Rdrmn : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Rdrmx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Rmaxx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Rminx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Rpsdd : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Rpsdq : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Rpsdt : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Rpsdu : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			Rstdx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			uEDA : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			uHR : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			uRR : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT arbre2_comp_min5
		GENERIC (
			N : INTEGER
		);
		PORT(
			clk : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			en1x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en2x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en3x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en4x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en5x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en6x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT arbre2_comp_min7
		GENERIC (
			N : INTEGER
		);
		PORT(
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
	END COMPONENT;

	COMPONENT arbre2_comp_min6
		GENERIC (
			N : INTEGER
		);
		PORT(
			clk : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			en1x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en2x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en3x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en4x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en5x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en6x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en7x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT arbre2_comp_min8
		GENERIC (
			N : INTEGER
		);
		PORT(
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
			en9x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT arbre2_comp_min9
		GENERIC (
			N : INTEGER
		);
		PORT(
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
			en9x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en10x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT arbre2_comp_min10
		GENERIC (
			N : INTEGER
		);
		PORT(
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
			en9x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en10x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en11x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT arbre2_comp_min2
		GENERIC (
			N : INTEGER
		);
		PORT(
			clk : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			en1x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en2x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en3x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT arbre2_comp_max
		GENERIC (
			N : INTEGER
		);
		PORT(
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
	END COMPONENT;

	COMPONENT arbre2_mu_A
		GENERIC (
			a : INTEGER;
			b : INTEGER;
			max : INTEGER;
			min : INTEGER;
			N : INTEGER
		);
		PORT (
			clk : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			donnees : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			great_sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			less_sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT rom_1					--------------------------------------------------------------
--		GENERIC (
--			N : INTEGER
--		);
		PORT (
			clock : IN STD_LOGIC;
			address : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
			q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;		
	
	SIGNAL Gdrmn : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Gdrmx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Gmaxx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Gminx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Gpsdd : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Gpsdq : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Gpsdt : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Gpsdu : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Gstdx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Hdrmn : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Hdrmx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Hmaxx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Hminx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Hpsdd : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Hpsdq : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Hpsdt : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Hpsdu : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Hstdx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Rdrmn : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Rdrmx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Rmaxx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Rminx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Rpsdd : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Rpsdq : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Rpsdt : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Rpsdu : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL Rstdx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL uEDA : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL uHR : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL uRR : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL data_inter : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sortie : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL compt		: unsigned (11 downto 0);	     ---------------------------
	SIGNAL num, ligne, compt_ex, compt_rom, compt_pr1, compt_pr2		: integer;	
	SIGNAL addr_inter : STD_LOGIC_VECTOR(11 DOWNTO 0); 
	SIGNAL enable : STD_LOGIC;	
	SIGNAL s11 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1111101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1111100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11111011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11111010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1111011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1111010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11110111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11110110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111101111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111101110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1111001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1111000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11110011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11110010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111100101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111100100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11110001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11110000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111100011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111100010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1111000101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1111000100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11110001001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11110001000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11101001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11101000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111010011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111010010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110100111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110100110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110100101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110100100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11100111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11100110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111001111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111001110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110011111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110011110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11100101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11100100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11100011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11100010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1101111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1101110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11011101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11011100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110111001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110111000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1101101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1101100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11011011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11011010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11011001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11011000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110110001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110110000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1101011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1101010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11010101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11010100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1101001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1101000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11010001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11010000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11000111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11000110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110001101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110001100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11000101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11000100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110001011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110001010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100010111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100010110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11000101111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11000101110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100010101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100010100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out1  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux1 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out2  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux2 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out3  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux3 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out4  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux4 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out5  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux5 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out6  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux6 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out7  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux7 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out8  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux8 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out9  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux9 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out10  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux10 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out11  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux11 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out12  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux12 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out13  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux13 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out14  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux14 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out15  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux15 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out16  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux16 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out17  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux17 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out18  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux18 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out19  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux19 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out20  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux20 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out21  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux21 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out22  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux22 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out23  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux23 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out24  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux24 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out25  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux25 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out26  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux26 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out27  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux27 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out28  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux28 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out29  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux29 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out30  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux30 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out31  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux31 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out32  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux32 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out33  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux33 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out34  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux34 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out35  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux35 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out36  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux36 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out37  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux37 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out38  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux38 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out39  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux39 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out40  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux40 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out41  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux41 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out42  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux42 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out43  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux43 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out44  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux44 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out45  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux45 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out46  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux46 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out47  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux47 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out48  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux48 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out49  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux49 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out50  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux50 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out51  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux51 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out52  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux52 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out53  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux53 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out54  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux54 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out55  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux55 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out56  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux56 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out57  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux57 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out58  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux58 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out59  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux59 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out60  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux60 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out61  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux61 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out62  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux62 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_out63  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL sig_taux63 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	
BEGIN

	sig_taux1 <= STD_LOGIC_VECTOR(TO_SIGNED(33,N));
	sig_taux2 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux3 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux4 <= STD_LOGIC_VECTOR(TO_SIGNED(90,N));
	sig_taux5 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux6 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux7 <= STD_LOGIC_VECTOR(TO_SIGNED(94,N));
	sig_taux8 <= STD_LOGIC_VECTOR(TO_SIGNED(16,N));
	sig_taux9 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux10 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux11 <= STD_LOGIC_VECTOR(TO_SIGNED(84,N));
	sig_taux12 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux13 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux14 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux15 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux16 <= STD_LOGIC_VECTOR(TO_SIGNED(3,N));
	sig_taux17 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux18 <= STD_LOGIC_VECTOR(TO_SIGNED(11,N));
	sig_taux19 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux20 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux21 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux22 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux23 <= STD_LOGIC_VECTOR(TO_SIGNED(40,N));
	sig_taux24 <= STD_LOGIC_VECTOR(TO_SIGNED(40,N));
	sig_taux25 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux26 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux27 <= STD_LOGIC_VECTOR(TO_SIGNED(81,N));
	sig_taux28 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux29 <= STD_LOGIC_VECTOR(TO_SIGNED(6,N));
	sig_taux30 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux31 <= STD_LOGIC_VECTOR(TO_SIGNED(5,N));
	sig_taux32 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux33 <= STD_LOGIC_VECTOR(TO_SIGNED(6,N));
	sig_taux34 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux35 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux36 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux37 <= STD_LOGIC_VECTOR(TO_SIGNED(20,N));
	sig_taux38 <= STD_LOGIC_VECTOR(TO_SIGNED(92,N));
	sig_taux39 <= STD_LOGIC_VECTOR(TO_SIGNED(66,N));
	sig_taux40 <= STD_LOGIC_VECTOR(TO_SIGNED(90,N));
	sig_taux41 <= STD_LOGIC_VECTOR(TO_SIGNED(75,N));
	sig_taux42 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux43 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux44 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux45 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux46 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux47 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux48 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux49 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux50 <= STD_LOGIC_VECTOR(TO_SIGNED(12,N));
	sig_taux51 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux52 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux53 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux54 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux55 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux56 <= STD_LOGIC_VECTOR(TO_SIGNED(80,N));
	sig_taux57 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux58 <= STD_LOGIC_VECTOR(TO_SIGNED(60,N));
	sig_taux59 <= STD_LOGIC_VECTOR(TO_SIGNED(8,N));
	sig_taux60 <= STD_LOGIC_VECTOR(TO_SIGNED(75,N));
	sig_taux61 <= STD_LOGIC_VECTOR(TO_SIGNED(75,N));
	sig_taux62 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux63 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	
	data_m : arbre2_memory
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		we => start,
		reset => reset,
		clk => clk,
		data_in => data_inter,
		Gdrmn => Gdrmn,
		Gdrmx => Gdrmx,
		Gmaxx => Gmaxx,
		Gminx => Gminx,
		Gpsdd => Gpsdd,
		Gpsdq => Gpsdq,
		Gpsdt => Gpsdt,
		Gpsdu => Gpsdu,
		Gstdx => Gstdx,
		Hdrmn => Hdrmn,
		Hdrmx => Hdrmx,
		Hmaxx => Hmaxx,
		Hminx => Hminx,
		Hpsdd => Hpsdd,
		Hpsdq => Hpsdq,
		Hpsdt => Hpsdt,
		Hpsdu => Hpsdu,
		Hstdx => Hstdx,
		Rdrmn => Rdrmn,
		Rdrmx => Rdrmx,
		Rmaxx => Rmaxx,
		Rminx => Rminx,
		Rpsdd => Rpsdd,
		Rpsdq => Rpsdq,
		Rpsdt => Rpsdt,
		Rpsdu => Rpsdu,
		Rstdx => Rstdx,
		uEDA => uEDA,
		uHR => uHR,
		uRR => uRR
	);

	func1 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 1117,
		min => 0,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gpsdq,
		great_sortie => s10,
		less_sortie => s11
	);

	func11 : arbre2_mu_A
	GENERIC MAP (
		a => 8,
		b => -59520,
		max => 7453,
		min => 7440,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hstdx,
		great_sortie => s110,
		less_sortie => s111
	);

	func111 : arbre2_mu_A
	GENERIC MAP (
		a => 6,
		b => -84096,
		max => 14033,
		min => 14016,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hminx,
		great_sortie => s1110,
		less_sortie => s1111
	);

	func1111 : arbre2_mu_A
	GENERIC MAP (
		a => 100,
		b => -5700,
		max => 58,
		min => 57,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hpsdd,
		great_sortie => s11110,
		less_sortie => s11111
	);

	func11111 : arbre2_mu_A
	GENERIC MAP (
		a => 4,
		b => -12200,
		max => 3073,
		min => 3050,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hstdx,
		great_sortie => s111110,
		less_sortie => s111111
	);

	func111110 : arbre2_mu_A
	GENERIC MAP (
		a => 6,
		b => -732,
		max => 140,
		min => 122,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gpsdu,
		great_sortie => s1111100,
		less_sortie => s1111101
	);

	func1111101 : arbre2_mu_A
	GENERIC MAP (
		a => 1,
		b => -15531,
		max => 15627,
		min => 15531,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => uEDA,
		great_sortie => s11111010,
		less_sortie => s11111011
	);

	func11110 : arbre2_mu_A
	GENERIC MAP (
		a => 25,
		b => -375800,
		max => 15036,
		min => 15032,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gmaxx,
		great_sortie => s111100,
		less_sortie => s111101
	);

	func111101 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 17988,
		min => 17313,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => uRR,
		great_sortie => s1111010,
		less_sortie => s1111011
	);

	func1111011 : arbre2_mu_A
	GENERIC MAP (
		a => 100,
		b => -23400,
		max => 235,
		min => 234,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rpsdu,
		great_sortie => s11110110,
		less_sortie => s11110111
	);

	func11110111 : arbre2_mu_A
	GENERIC MAP (
		a => 9,
		b => -1854,
		max => 217,
		min => 206,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rpsdu,
		great_sortie => s111101110,
		less_sortie => s111101111
	);

	func111100 : arbre2_mu_A
	GENERIC MAP (
		a => 11,
		b => -166639,
		max => 15158,
		min => 15149,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gminx,
		great_sortie => s1111000,
		less_sortie => s1111001
	);

	func1111001 : arbre2_mu_A
	GENERIC MAP (
		a => 4,
		b => -62464,
		max => 15639,
		min => 15616,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => uRR,
		great_sortie => s11110010,
		less_sortie => s11110011
	);

	func11110010 : arbre2_mu_A
	GENERIC MAP (
		a => 1,
		b => -69,
		max => 191,
		min => 69,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gpsdd,
		great_sortie => s111100100,
		less_sortie => s111100101
	);

	func1111000 : arbre2_mu_A
	GENERIC MAP (
		a => 3,
		b => -18423,
		max => 6175,
		min => 6141,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hstdx,
		great_sortie => s11110000,
		less_sortie => s11110001
	);

	func11110001 : arbre2_mu_A
	GENERIC MAP (
		a => 1,
		b => -452,
		max => 619,
		min => 452,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hpsdu,
		great_sortie => s111100010,
		less_sortie => s111100011
	);

	func111100010 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 1060,
		min => 737,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hpsdu,
		great_sortie => s1111000100,
		less_sortie => s1111000101
	);

	func1111000100 : arbre2_mu_A
	GENERIC MAP (
		a => 1,
		b => -1584,
		max => 1679,
		min => 1584,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hpsdu,
		great_sortie => s11110001000,
		less_sortie => s11110001001
	);

	func1110 : arbre2_mu_A
	GENERIC MAP (
		a => 2,
		b => -29264,
		max => 14692,
		min => 14632,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gminx,
		great_sortie => s11100,
		less_sortie => s11101
	);

	func11101 : arbre2_mu_A
	GENERIC MAP (
		a => 25,
		b => -1650,
		max => 70,
		min => 66,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gpsdd,
		great_sortie => s111010,
		less_sortie => s111011
	);

	func111011 : arbre2_mu_A
	GENERIC MAP (
		a => 100,
		b => 0,
		max => 1,
		min => 0,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gpsdd,
		great_sortie => s1110110,
		less_sortie => s1110111
	);

	func111010 : arbre2_mu_A
	GENERIC MAP (
		a => 100,
		b => -5500,
		max => 56,
		min => 55,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rpsdt,
		great_sortie => s1110100,
		less_sortie => s1110101
	);

	func1110100 : arbre2_mu_A
	GENERIC MAP (
		a => 50,
		b => -819550,
		max => 16393,
		min => 16391,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gdrmn,
		great_sortie => s11101000,
		less_sortie => s11101001
	);

	func11101001 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 3756,
		min => 3356,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hstdx,
		great_sortie => s111010010,
		less_sortie => s111010011
	);

	func111010011 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 15319,
		min => 15038,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hminx,
		great_sortie => s1110100110,
		less_sortie => s1110100111
	);

	func111010010 : arbre2_mu_A
	GENERIC MAP (
		a => 1,
		b => -18438,
		max => 18598,
		min => 18438,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hdrmx,
		great_sortie => s1110100100,
		less_sortie => s1110100101
	);

	func11100 : arbre2_mu_A
	GENERIC MAP (
		a => 4,
		b => -1612,
		max => 426,
		min => 403,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rpsdd,
		great_sortie => s111000,
		less_sortie => s111001
	);

	func111001 : arbre2_mu_A
	GENERIC MAP (
		a => 33,
		b => -18645,
		max => 568,
		min => 565,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hpsdt,
		great_sortie => s1110010,
		less_sortie => s1110011
	);

	func1110011 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 21459,
		min => 20931,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => uHR,
		great_sortie => s11100110,
		less_sortie => s11100111
	);

	func11100111 : arbre2_mu_A
	GENERIC MAP (
		a => 33,
		b => -541530,
		max => 16413,
		min => 16410,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gdrmx,
		great_sortie => s111001110,
		less_sortie => s111001111
	);

	func111001111 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 15928,
		min => 15344,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => uHR,
		great_sortie => s1110011110,
		less_sortie => s1110011111
	);

	func1110010 : arbre2_mu_A
	GENERIC MAP (
		a => 1,
		b => -19364,
		max => 19434,
		min => 19364,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => uHR,
		great_sortie => s11100100,
		less_sortie => s11100101
	);

	func111000 : arbre2_mu_A
	GENERIC MAP (
		a => 5,
		b => -38275,
		max => 7675,
		min => 7655,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rstdx,
		great_sortie => s1110000,
		less_sortie => s1110001
	);

	func1110001 : arbre2_mu_A
	GENERIC MAP (
		a => 2,
		b => -14738,
		max => 7430,
		min => 7369,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rstdx,
		great_sortie => s11100010,
		less_sortie => s11100011
	);

	func110 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 16409,
		min => 14805,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gminx,
		great_sortie => s1100,
		less_sortie => s1101
	);

	func1101 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 12692,
		min => 12149,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rstdx,
		great_sortie => s11010,
		less_sortie => s11011
	);

	func11011 : arbre2_mu_A
	GENERIC MAP (
		a => 20,
		b => -1440,
		max => 77,
		min => 72,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hpsdd,
		great_sortie => s110110,
		less_sortie => s110111
	);

	func110111 : arbre2_mu_A
	GENERIC MAP (
		a => 1,
		b => -14345,
		max => 14467,
		min => 14345,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => uHR,
		great_sortie => s1101110,
		less_sortie => s1101111
	);

	func1101110 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 16002,
		min => 15368,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gmaxx,
		great_sortie => s11011100,
		less_sortie => s11011101
	);

	func11011100 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 17390,
		min => 16348,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gmaxx,
		great_sortie => s110111000,
		less_sortie => s110111001
	);

	func110110 : arbre2_mu_A
	GENERIC MAP (
		a => 2,
		b => -28178,
		max => 14137,
		min => 14089,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => uEDA,
		great_sortie => s1101100,
		less_sortie => s1101101
	);

	func1101101 : arbre2_mu_A
	GENERIC MAP (
		a => 1,
		b => 0,
		max => 109,
		min => 0,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gpsdq,
		great_sortie => s11011010,
		less_sortie => s11011011
	);

	func1101100 : arbre2_mu_A
	GENERIC MAP (
		a => 3,
		b => -3195,
		max => 1102,
		min => 1065,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hpsdq,
		great_sortie => s11011000,
		less_sortie => s11011001
	);

	func11011000 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 14987,
		min => 13995,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rminx,
		great_sortie => s110110000,
		less_sortie => s110110001
	);

	func11010 : arbre2_mu_A
	GENERIC MAP (
		a => 1,
		b => -18340,
		max => 18506,
		min => 18340,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hdrmx,
		great_sortie => s110100,
		less_sortie => s110101
	);

	func110101 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 17679,
		min => 16571,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gmaxx,
		great_sortie => s1101010,
		less_sortie => s1101011
	);

	func1101010 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 20522,
		min => 19042,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gmaxx,
		great_sortie => s11010100,
		less_sortie => s11010101
	);

	func110100 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 11532,
		min => 11017,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hstdx,
		great_sortie => s1101000,
		less_sortie => s1101001
	);

	func1101000 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 14946,
		min => 14051,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hstdx,
		great_sortie => s11010000,
		less_sortie => s11010001
	);

	func1100 : arbre2_mu_A
	GENERIC MAP (
		a => 17,
		b => -10098,
		max => 600,
		min => 594,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hpsdq,
		great_sortie => s11000,
		less_sortie => s11001
	);

	func11001 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 18857,
		min => 18586,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hmaxx,
		great_sortie => s110010,
		less_sortie => s110011
	);

	func110010 : arbre2_mu_A
	GENERIC MAP (
		a => 17,
		b => -3689,
		max => 223,
		min => 217,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hpsdq,
		great_sortie => s1100100,
		less_sortie => s1100101
	);

	func11000 : arbre2_mu_A
	GENERIC MAP (
		a => 7,
		b => -273,
		max => 53,
		min => 39,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gpsdt,
		great_sortie => s110000,
		less_sortie => s110001
	);

	func110001 : arbre2_mu_A
	GENERIC MAP (
		a => 25,
		b => -380650,
		max => 15230,
		min => 15226,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => uHR,
		great_sortie => s1100010,
		less_sortie => s1100011
	);

	func1100011 : arbre2_mu_A
	GENERIC MAP (
		a => 25,
		b => -1525,
		max => 65,
		min => 61,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gpsdd,
		great_sortie => s11000110,
		less_sortie => s11000111
	);

	func11000110 : arbre2_mu_A
	GENERIC MAP (
		a => 17,
		b => -279055,
		max => 16421,
		min => 16415,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gdrmx,
		great_sortie => s110001100,
		less_sortie => s110001101
	);

	func1100010 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 22259,
		min => 21636,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => uHR,
		great_sortie => s11000100,
		less_sortie => s11000101
	);

	func11000101 : arbre2_mu_A
	GENERIC MAP (
		a => 5,
		b => -9865,
		max => 1994,
		min => 1973,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hpsdu,
		great_sortie => s110001010,
		less_sortie => s110001011
	);

	func110001011 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 6729,
		min => 5858,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rdrmx,
		great_sortie => s1100010110,
		less_sortie => s1100010111
	);

	func1100010111 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 5328,
		min => 4896,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rdrmx,
		great_sortie => s11000101110,
		less_sortie => s11000101111
	);

	func110001010 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 2522,
		min => 2167,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hpsdu,
		great_sortie => s1100010100,
		less_sortie => s1100010101
	);

	func10 : arbre2_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 1117,
		min => 756,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gpsdq,
		great_sortie => s100,
		less_sortie => s101
	);

	min111111 : arbre2_comp_min5
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11111,
		en5x => s111111,
		en6x => sig_taux1,
		sortie => sig_out1
	);

	min11111011 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11111,
		en5x => s111110,
		en6x => s1111101,
		en7x => s11111011,
		en8x => sig_taux2,
		sortie => sig_out2
	);

	min11111010 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11111,
		en5x => s111110,
		en6x => s1111101,
		en7x => s11111010,
		en8x => sig_taux3,
		sortie => sig_out3
	);

	min1111100 : arbre2_comp_min6
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11111,
		en5x => s111110,
		en6x => s1111100,
		en7x => sig_taux4,
		sortie => sig_out4
	);

	min111101111 : arbre2_comp_min8
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11110,
		en5x => s111101,
		en6x => s1111011,
		en7x => s11110111,
		en8x => s111101111,
		en9x => sig_taux5,
		sortie => sig_out5
	);

	min111101110 : arbre2_comp_min8
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11110,
		en5x => s111101,
		en6x => s1111011,
		en7x => s11110111,
		en8x => s111101110,
		en9x => sig_taux6,
		sortie => sig_out6
	);

	min11110110 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11110,
		en5x => s111101,
		en6x => s1111011,
		en7x => s11110110,
		en8x => sig_taux7,
		sortie => sig_out7
	);

	min1111010 : arbre2_comp_min6
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11110,
		en5x => s111101,
		en6x => s1111010,
		en7x => sig_taux8,
		sortie => sig_out8
	);

	min11110011 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11110,
		en5x => s111100,
		en6x => s1111001,
		en7x => s11110011,
		en8x => sig_taux9,
		sortie => sig_out9
	);

	min111100101 : arbre2_comp_min8
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11110,
		en5x => s111100,
		en6x => s1111001,
		en7x => s11110010,
		en8x => s111100101,
		en9x => sig_taux10,
		sortie => sig_out10
	);

	min111100100 : arbre2_comp_min8
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11110,
		en5x => s111100,
		en6x => s1111001,
		en7x => s11110010,
		en8x => s111100100,
		en9x => sig_taux11,
		sortie => sig_out11
	);

	min111100011 : arbre2_comp_min8
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11110,
		en5x => s111100,
		en6x => s1111000,
		en7x => s11110001,
		en8x => s111100011,
		en9x => sig_taux12,
		sortie => sig_out12
	);

	min1111000101 : arbre2_comp_min9
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11110,
		en5x => s111100,
		en6x => s1111000,
		en7x => s11110001,
		en8x => s111100010,
		en9x => s1111000101,
		en10x => sig_taux13,
		sortie => sig_out13
	);

	min11110001001 : arbre2_comp_min10
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11110,
		en5x => s111100,
		en6x => s1111000,
		en7x => s11110001,
		en8x => s111100010,
		en9x => s1111000100,
		en10x => s11110001001,
		en11x => sig_taux14,
		sortie => sig_out14
	);

	min11110001000 : arbre2_comp_min10
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11110,
		en5x => s111100,
		en6x => s1111000,
		en7x => s11110001,
		en8x => s111100010,
		en9x => s1111000100,
		en10x => s11110001000,
		en11x => sig_taux15,
		sortie => sig_out15
	);

	min11110000 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => s11110,
		en5x => s111100,
		en6x => s1111000,
		en7x => s11110000,
		en8x => sig_taux16,
		sortie => sig_out16
	);

	min1110111 : arbre2_comp_min6
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11101,
		en5x => s111011,
		en6x => s1110111,
		en7x => sig_taux17,
		sortie => sig_out17
	);

	min1110110 : arbre2_comp_min6
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11101,
		en5x => s111011,
		en6x => s1110110,
		en7x => sig_taux18,
		sortie => sig_out18
	);

	min1110101 : arbre2_comp_min6
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11101,
		en5x => s111010,
		en6x => s1110101,
		en7x => sig_taux19,
		sortie => sig_out19
	);

	min1110100111 : arbre2_comp_min9
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11101,
		en5x => s111010,
		en6x => s1110100,
		en7x => s11101001,
		en8x => s111010011,
		en9x => s1110100111,
		en10x => sig_taux20,
		sortie => sig_out20
	);

	min1110100110 : arbre2_comp_min9
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11101,
		en5x => s111010,
		en6x => s1110100,
		en7x => s11101001,
		en8x => s111010011,
		en9x => s1110100110,
		en10x => sig_taux21,
		sortie => sig_out21
	);

	min1110100101 : arbre2_comp_min9
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11101,
		en5x => s111010,
		en6x => s1110100,
		en7x => s11101001,
		en8x => s111010010,
		en9x => s1110100101,
		en10x => sig_taux22,
		sortie => sig_out22
	);

	min1110100100 : arbre2_comp_min9
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11101,
		en5x => s111010,
		en6x => s1110100,
		en7x => s11101001,
		en8x => s111010010,
		en9x => s1110100100,
		en10x => sig_taux23,
		sortie => sig_out23
	);

	min11101000 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11101,
		en5x => s111010,
		en6x => s1110100,
		en7x => s11101000,
		en8x => sig_taux24,
		sortie => sig_out24
	);

	min1110011111 : arbre2_comp_min9
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11100,
		en5x => s111001,
		en6x => s1110011,
		en7x => s11100111,
		en8x => s111001111,
		en9x => s1110011111,
		en10x => sig_taux25,
		sortie => sig_out25
	);

	min1110011110 : arbre2_comp_min9
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11100,
		en5x => s111001,
		en6x => s1110011,
		en7x => s11100111,
		en8x => s111001111,
		en9x => s1110011110,
		en10x => sig_taux26,
		sortie => sig_out26
	);

	min111001110 : arbre2_comp_min8
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11100,
		en5x => s111001,
		en6x => s1110011,
		en7x => s11100111,
		en8x => s111001110,
		en9x => sig_taux27,
		sortie => sig_out27
	);

	min11100110 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11100,
		en5x => s111001,
		en6x => s1110011,
		en7x => s11100110,
		en8x => sig_taux28,
		sortie => sig_out28
	);

	min11100101 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11100,
		en5x => s111001,
		en6x => s1110010,
		en7x => s11100101,
		en8x => sig_taux29,
		sortie => sig_out29
	);

	min11100100 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11100,
		en5x => s111001,
		en6x => s1110010,
		en7x => s11100100,
		en8x => sig_taux30,
		sortie => sig_out30
	);

	min11100011 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11100,
		en5x => s111000,
		en6x => s1110001,
		en7x => s11100011,
		en8x => sig_taux31,
		sortie => sig_out31
	);

	min11100010 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11100,
		en5x => s111000,
		en6x => s1110001,
		en7x => s11100010,
		en8x => sig_taux32,
		sortie => sig_out32
	);

	min1110000 : arbre2_comp_min6
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => s11100,
		en5x => s111000,
		en6x => s1110000,
		en7x => sig_taux33,
		sortie => sig_out33
	);

	min1101111 : arbre2_comp_min6
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => s11011,
		en5x => s110111,
		en6x => s1101111,
		en7x => sig_taux34,
		sortie => sig_out34
	);

	min11011101 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => s11011,
		en5x => s110111,
		en6x => s1101110,
		en7x => s11011101,
		en8x => sig_taux35,
		sortie => sig_out35
	);

	min110111001 : arbre2_comp_min8
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => s11011,
		en5x => s110111,
		en6x => s1101110,
		en7x => s11011100,
		en8x => s110111001,
		en9x => sig_taux36,
		sortie => sig_out36
	);

	min110111000 : arbre2_comp_min8
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => s11011,
		en5x => s110111,
		en6x => s1101110,
		en7x => s11011100,
		en8x => s110111000,
		en9x => sig_taux37,
		sortie => sig_out37
	);

	min11011011 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => s11011,
		en5x => s110110,
		en6x => s1101101,
		en7x => s11011011,
		en8x => sig_taux38,
		sortie => sig_out38
	);

	min11011010 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => s11011,
		en5x => s110110,
		en6x => s1101101,
		en7x => s11011010,
		en8x => sig_taux39,
		sortie => sig_out39
	);

	min11011001 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => s11011,
		en5x => s110110,
		en6x => s1101100,
		en7x => s11011001,
		en8x => sig_taux40,
		sortie => sig_out40
	);

	min110110001 : arbre2_comp_min8
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => s11011,
		en5x => s110110,
		en6x => s1101100,
		en7x => s11011000,
		en8x => s110110001,
		en9x => sig_taux41,
		sortie => sig_out41
	);

	min110110000 : arbre2_comp_min8
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => s11011,
		en5x => s110110,
		en6x => s1101100,
		en7x => s11011000,
		en8x => s110110000,
		en9x => sig_taux42,
		sortie => sig_out42
	);

	min1101011 : arbre2_comp_min6
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => s11010,
		en5x => s110101,
		en6x => s1101011,
		en7x => sig_taux43,
		sortie => sig_out43
	);

	min11010101 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => s11010,
		en5x => s110101,
		en6x => s1101010,
		en7x => s11010101,
		en8x => sig_taux44,
		sortie => sig_out44
	);

	min11010100 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => s11010,
		en5x => s110101,
		en6x => s1101010,
		en7x => s11010100,
		en8x => sig_taux45,
		sortie => sig_out45
	);

	min1101001 : arbre2_comp_min6
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => s11010,
		en5x => s110100,
		en6x => s1101001,
		en7x => sig_taux46,
		sortie => sig_out46
	);

	min11010001 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => s11010,
		en5x => s110100,
		en6x => s1101000,
		en7x => s11010001,
		en8x => sig_taux47,
		sortie => sig_out47
	);

	min11010000 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => s11010,
		en5x => s110100,
		en6x => s1101000,
		en7x => s11010000,
		en8x => sig_taux48,
		sortie => sig_out48
	);

	min110011 : arbre2_comp_min5
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1100,
		en4x => s11001,
		en5x => s110011,
		en6x => sig_taux49,
		sortie => sig_out49
	);

	min1100101 : arbre2_comp_min6
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1100,
		en4x => s11001,
		en5x => s110010,
		en6x => s1100101,
		en7x => sig_taux50,
		sortie => sig_out50
	);

	min1100100 : arbre2_comp_min6
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1100,
		en4x => s11001,
		en5x => s110010,
		en6x => s1100100,
		en7x => sig_taux51,
		sortie => sig_out51
	);

	min11000111 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1100,
		en4x => s11000,
		en5x => s110001,
		en6x => s1100011,
		en7x => s11000111,
		en8x => sig_taux52,
		sortie => sig_out52
	);

	min110001101 : arbre2_comp_min8
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1100,
		en4x => s11000,
		en5x => s110001,
		en6x => s1100011,
		en7x => s11000110,
		en8x => s110001101,
		en9x => sig_taux53,
		sortie => sig_out53
	);

	min110001100 : arbre2_comp_min8
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1100,
		en4x => s11000,
		en5x => s110001,
		en6x => s1100011,
		en7x => s11000110,
		en8x => s110001100,
		en9x => sig_taux54,
		sortie => sig_out54
	);

	min11000101111 : arbre2_comp_min10
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1100,
		en4x => s11000,
		en5x => s110001,
		en6x => s1100010,
		en7x => s11000101,
		en8x => s110001011,
		en9x => s1100010111,
		en10x => s11000101111,
		en11x => sig_taux55,
		sortie => sig_out55
	);

	min11000101110 : arbre2_comp_min10
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1100,
		en4x => s11000,
		en5x => s110001,
		en6x => s1100010,
		en7x => s11000101,
		en8x => s110001011,
		en9x => s1100010111,
		en10x => s11000101110,
		en11x => sig_taux56,
		sortie => sig_out56
	);

	min1100010110 : arbre2_comp_min9
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1100,
		en4x => s11000,
		en5x => s110001,
		en6x => s1100010,
		en7x => s11000101,
		en8x => s110001011,
		en9x => s1100010110,
		en10x => sig_taux57,
		sortie => sig_out57
	);

	min1100010101 : arbre2_comp_min9
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1100,
		en4x => s11000,
		en5x => s110001,
		en6x => s1100010,
		en7x => s11000101,
		en8x => s110001010,
		en9x => s1100010101,
		en10x => sig_taux58,
		sortie => sig_out58
	);

	min1100010100 : arbre2_comp_min9
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1100,
		en4x => s11000,
		en5x => s110001,
		en6x => s1100010,
		en7x => s11000101,
		en8x => s110001010,
		en9x => s1100010100,
		en10x => sig_taux59,
		sortie => sig_out59
	);

	min11000100 : arbre2_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1100,
		en4x => s11000,
		en5x => s110001,
		en6x => s1100010,
		en7x => s11000100,
		en8x => sig_taux60,
		sortie => sig_out60
	);

	min110000 : arbre2_comp_min5
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1100,
		en4x => s11000,
		en5x => s110000,
		en6x => sig_taux61,
		sortie => sig_out61
	);

	min101 : arbre2_comp_min2
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s101,
		en3x => sig_taux62,
		sortie => sig_out62
	);

	min100 : arbre2_comp_min2
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => sig_taux63,
		sortie => sig_out63
	);

	max : arbre2_comp_max
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		start => start,
		en1x => sig_out1,
		en2x => sig_out2,
		en3x => sig_out3,
		en4x => sig_out4,
		en5x => sig_out5,
		en6x => sig_out6,
		en7x => sig_out7,
		en8x => sig_out8,
		en9x => sig_out9,
		en10x => sig_out10,
		en11x => sig_out11,
		en12x => sig_out12,
		en13x => sig_out13,
		en14x => sig_out14,
		en15x => sig_out15,
		en16x => sig_out16,
		en17x => sig_out17,
		en18x => sig_out18,
		en19x => sig_out19,
		en20x => sig_out20,
		en21x => sig_out21,
		en22x => sig_out22,
		en23x => sig_out23,
		en24x => sig_out24,
		en25x => sig_out25,
		en26x => sig_out26,
		en27x => sig_out27,
		en28x => sig_out28,
		en29x => sig_out29,
		en30x => sig_out30,
		en31x => sig_out31,
		en32x => sig_out32,
		en33x => sig_out33,
		en34x => sig_out34,
		en35x => sig_out35,
		en36x => sig_out36,
		en37x => sig_out37,
		en38x => sig_out38,
		en39x => sig_out39,
		en40x => sig_out40,
		en41x => sig_out41,
		en42x => sig_out42,
		en43x => sig_out43,
		en44x => sig_out44,
		en45x => sig_out45,
		en46x => sig_out46,
		en47x => sig_out47,
		en48x => sig_out48,
		en49x => sig_out49,
		en50x => sig_out50,
		en51x => sig_out51,
		en52x => sig_out52,
		en53x => sig_out53,
		en54x => sig_out54,
		en55x => sig_out55,
		en56x => sig_out56,
		en57x => sig_out57,
		en58x => sig_out58,
		en59x => sig_out59,
		en60x => sig_out60,
		en61x => sig_out61,
		en62x => sig_out62,
		en63x => sig_out63,
		sortie => sortie
	);

	rom : rom_1                       -------------N=32
	PORT MAP (
		clock => clk,
		address => addr_inter,               ------------------
		q => data_inter                      ----------------------------------------------------
	);	
	
	PROCESS(clk, reset, start, compt) IS    ---compteur pour rom
	BEGIN
		IF reset = '1' THEN
			compt <= (others => '0');	
		ELSIF clk = '1' and clk'event THEN
			IF start = '1' THEN
				addr_inter <= STD_LOGIC_VECTOR(compt);		
				IF compt = "101110111000" THEN
					compt <= (others => '0');
				ELSE
					compt <= compt +1;
				END IF;
			END IF;
		END IF;

	END PROCESS;
-- affecter une des valeurs a la sortie

	PROCESS(clk, reset, start, ligne, enable, num) IS    ---compteur pour pourcentage
	BEGIN
		IF reset = '1' THEN
			compt_pr1 <= 0;
			compt_pr2 <= 0;	
			ligne <= 0;
			pourcent1 <= (others => '0');
			pourcent2 <= (others => '0');
		ELSIF clk = '1' and clk'event THEN
			num <= TO_INTEGER(UNSIGNED(sortie));
			IF start = '1' THEN
				IF ligne = 100 THEN
					pourcent1 <= STD_LOGIC_VECTOR(TO_UNSIGNED(compt_pr1, 7));
					pourcent2 <= STD_LOGIC_VECTOR(TO_UNSIGNED(compt_pr2, 7));
				ELSIF ligne > 50 and ligne < 100 THEN
					IF enable = '1' THEN
						IF num > 50 THEN
							compt_pr2 <= compt_pr2 + 1;
						END IF;
						ligne <= ligne +1;
					END IF;
				ELSIF ligne < 51 THEN
					IF enable = '1' THEN
						IF num < 50 THEN
							compt_pr1 <= compt_pr1 + 1;
						END IF;
						ligne <= ligne +1;
					END IF;
				END IF;
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
					IF compt_ex = 34 THEN
						enable <= '1';
						compt_ex <= 5;
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
