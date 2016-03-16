LIBRARY IEEE;
USE ieee.std_logic_1164.all;

USE ieee.numeric_std.all;LIBRARY work;

ENTITY arbre1 is
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

ARCHITECTURE generate_arbre of arbre1 is

	COMPONENT arbre1_memory
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

	COMPONENT arbre1_comp_min3
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
			sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT arbre1_comp_min5
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

	COMPONENT arbre1_comp_min4
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
			sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT arbre1_comp_min7
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

	COMPONENT arbre1_comp_min6
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

	COMPONENT arbre1_comp_min9
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

	COMPONENT arbre1_comp_min8
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

	COMPONENT arbre1_comp_min10
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

	COMPONENT arbre1_comp_min11
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
			en12x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT arbre1_comp_min13
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
			en12x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en13x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en14x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT arbre1_comp_min12
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
			en12x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			en13x : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT arbre1_comp_max
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
			sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT arbre1_mu_A
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
	SIGNAL s11101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1101001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1101000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11010011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11010010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11001111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11001110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110011111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110011110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100111111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100111110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110011101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110011100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11001101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11001100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11001001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11001000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110010011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110010010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100100111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100100110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11001001111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11001001110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100100101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100100100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11001001001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11001001000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110010001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110010000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s100011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s100010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10001111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10001110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10001011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10001010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s100001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s100000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10000111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10000110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s100001101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s100001100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000011001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000011000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10000001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10000000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s100000011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s100000010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000000101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000000100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10000001011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10000001010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s100000010101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s100000010100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000000101001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000000101000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10000001010011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10000001010010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10000001001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10000001000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
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
	
BEGIN

	sig_taux1 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux2 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux3 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux4 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux5 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux6 <= STD_LOGIC_VECTOR(TO_SIGNED(12,N));
	sig_taux7 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux8 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux9 <= STD_LOGIC_VECTOR(TO_SIGNED(94,N));
	sig_taux10 <= STD_LOGIC_VECTOR(TO_SIGNED(87,N));
	sig_taux11 <= STD_LOGIC_VECTOR(TO_SIGNED(33,N));
	sig_taux12 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux13 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux14 <= STD_LOGIC_VECTOR(TO_SIGNED(84,N));
	sig_taux15 <= STD_LOGIC_VECTOR(TO_SIGNED(83,N));
	sig_taux16 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux17 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux18 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux19 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux20 <= STD_LOGIC_VECTOR(TO_SIGNED(92,N));
	sig_taux21 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux22 <= STD_LOGIC_VECTOR(TO_SIGNED(83,N));
	sig_taux23 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux24 <= STD_LOGIC_VECTOR(TO_SIGNED(91,N));
	sig_taux25 <= STD_LOGIC_VECTOR(TO_SIGNED(40,N));
	sig_taux26 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux27 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux28 <= STD_LOGIC_VECTOR(TO_SIGNED(18,N));
	sig_taux29 <= STD_LOGIC_VECTOR(TO_SIGNED(87,N));
	sig_taux30 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux31 <= STD_LOGIC_VECTOR(TO_SIGNED(20,N));
	sig_taux32 <= STD_LOGIC_VECTOR(TO_SIGNED(9,N));
	sig_taux33 <= STD_LOGIC_VECTOR(TO_SIGNED(66,N));
	sig_taux34 <= STD_LOGIC_VECTOR(TO_SIGNED(6,N));
	sig_taux35 <= STD_LOGIC_VECTOR(TO_SIGNED(20,N));
	sig_taux36 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux37 <= STD_LOGIC_VECTOR(TO_SIGNED(13,N));
	sig_taux38 <= STD_LOGIC_VECTOR(TO_SIGNED(85,N));
	sig_taux39 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux40 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux41 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux42 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux43 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux44 <= STD_LOGIC_VECTOR(TO_SIGNED(71,N));
	sig_taux45 <= STD_LOGIC_VECTOR(TO_SIGNED(7,N));
	sig_taux46 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux47 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux48 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux49 <= STD_LOGIC_VECTOR(TO_SIGNED(8,N));
	sig_taux50 <= STD_LOGIC_VECTOR(TO_SIGNED(85,N));
	sig_taux51 <= STD_LOGIC_VECTOR(TO_SIGNED(0,N));
	sig_taux52 <= STD_LOGIC_VECTOR(TO_SIGNED(85,N));
	
	data_m : arbre1_memory
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

	func1 : arbre1_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 15158,
		min => 14514,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gminx,
		great_sortie => s10,
		less_sortie => s11
	);

	func11 : arbre1_mu_A
	GENERIC MAP (
		a => 33,
		b => -2574,
		max => 81,
		min => 78,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rpsdu,
		great_sortie => s110,
		less_sortie => s111
	);

	func111 : arbre1_mu_A
	GENERIC MAP (
		a => 1,
		b => -13115,
		max => 13315,
		min => 13115,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hminx,
		great_sortie => s1110,
		less_sortie => s1111
	);

	func1110 : arbre1_mu_A
	GENERIC MAP (
		a => 5,
		b => -2960,
		max => 612,
		min => 592,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gpsdd,
		great_sortie => s11100,
		less_sortie => s11101
	);

	func11101 : arbre1_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 301,
		min => 69,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gpsdd,
		great_sortie => s111010,
		less_sortie => s111011
	);

	func110 : arbre1_mu_A
	GENERIC MAP (
		a => 2,
		b => -34446,
		max => 17289,
		min => 17223,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hdrmx,
		great_sortie => s1100,
		less_sortie => s1101
	);

	func1101 : arbre1_mu_A
	GENERIC MAP (
		a => 13,
		b => -390,
		max => 38,
		min => 30,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rpsdt,
		great_sortie => s11010,
		less_sortie => s11011
	);

	func11010 : arbre1_mu_A
	GENERIC MAP (
		a => 4,
		b => -184,
		max => 70,
		min => 46,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gpsdd,
		great_sortie => s110100,
		less_sortie => s110101
	);

	func110100 : arbre1_mu_A
	GENERIC MAP (
		a => 33,
		b => -462,
		max => 17,
		min => 14,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hpsdd,
		great_sortie => s1101000,
		less_sortie => s1101001
	);

	func1101001 : arbre1_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 19861,
		min => 19564,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rmaxx,
		great_sortie => s11010010,
		less_sortie => s11010011
	);

	func1100 : arbre1_mu_A
	GENERIC MAP (
		a => 25,
		b => -410150,
		max => 16410,
		min => 16406,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rdrmn,
		great_sortie => s11000,
		less_sortie => s11001
	);

	func11001 : arbre1_mu_A
	GENERIC MAP (
		a => 3,
		b => -44370,
		max => 14819,
		min => 14790,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rminx,
		great_sortie => s110010,
		less_sortie => s110011
	);

	func110011 : arbre1_mu_A
	GENERIC MAP (
		a => 1,
		b => -16671,
		max => 16857,
		min => 16671,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => uRR,
		great_sortie => s1100110,
		less_sortie => s1100111
	);

	func1100111 : arbre1_mu_A
	GENERIC MAP (
		a => 3,
		b => -2400,
		max => 830,
		min => 800,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gpsdd,
		great_sortie => s11001110,
		less_sortie => s11001111
	);

	func11001111 : arbre1_mu_A
	GENERIC MAP (
		a => 17,
		b => -17391,
		max => 1029,
		min => 1023,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gpsdu,
		great_sortie => s110011110,
		less_sortie => s110011111
	);

	func110011111 : arbre1_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 19463,
		min => 18495,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hmaxx,
		great_sortie => s1100111110,
		less_sortie => s1100111111
	);

	func11001110 : arbre1_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 2631,
		min => 1913,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gstdx,
		great_sortie => s110011100,
		less_sortie => s110011101
	);

	func1100110 : arbre1_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 12032,
		min => 11017,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hstdx,
		great_sortie => s11001100,
		less_sortie => s11001101
	);

	func110010 : arbre1_mu_A
	GENERIC MAP (
		a => 2,
		b => -29840,
		max => 14973,
		min => 14920,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rminx,
		great_sortie => s1100100,
		less_sortie => s1100101
	);

	func1100100 : arbre1_mu_A
	GENERIC MAP (
		a => 100,
		b => -1638200,
		max => 16383,
		min => 16382,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rdrmn,
		great_sortie => s11001000,
		less_sortie => s11001001
	);

	func11001001 : arbre1_mu_A
	GENERIC MAP (
		a => 25,
		b => -351550,
		max => 14066,
		min => 14062,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gminx,
		great_sortie => s110010010,
		less_sortie => s110010011
	);

	func110010011 : arbre1_mu_A
	GENERIC MAP (
		a => 1,
		b => -13309,
		max => 13448,
		min => 13309,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gminx,
		great_sortie => s1100100110,
		less_sortie => s1100100111
	);

	func1100100111 : arbre1_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 13197,
		min => 12806,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gminx,
		great_sortie => s11001001110,
		less_sortie => s11001001111
	);

	func110010010 : arbre1_mu_A
	GENERIC MAP (
		a => 2,
		b => -28538,
		max => 14314,
		min => 14269,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gminx,
		great_sortie => s1100100100,
		less_sortie => s1100100101
	);

	func1100100100 : arbre1_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 4742,
		min => 4430,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rdrmx,
		great_sortie => s11001001000,
		less_sortie => s11001001001
	);

	func11001000 : arbre1_mu_A
	GENERIC MAP (
		a => 1,
		b => -19065,
		max => 19240,
		min => 19065,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => uRR,
		great_sortie => s110010000,
		less_sortie => s110010001
	);

	func10 : arbre1_mu_A
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
		great_sortie => s100,
		less_sortie => s101
	);

	func101 : arbre1_mu_A
	GENERIC MAP (
		a => 1,
		b => -16402,
		max => 16571,
		min => 16402,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gmaxx,
		great_sortie => s1010,
		less_sortie => s1011
	);

	func1010 : arbre1_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 18335,
		min => 17734,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hdrmx,
		great_sortie => s10100,
		less_sortie => s10101
	);

	func100 : arbre1_mu_A
	GENERIC MAP (
		a => 50,
		b => 0,
		max => 2,
		min => 0,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rpsdq,
		great_sortie => s1000,
		less_sortie => s1001
	);

	func1001 : arbre1_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 20107,
		min => 19792,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hmaxx,
		great_sortie => s10010,
		less_sortie => s10011
	);

	func1000 : arbre1_mu_A
	GENERIC MAP (
		a => 1,
		b => -14345,
		max => 14414,
		min => 14345,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rminx,
		great_sortie => s10000,
		less_sortie => s10001
	);

	func10001 : arbre1_mu_A
	GENERIC MAP (
		a => 1,
		b => -3015,
		max => 3100,
		min => 3015,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gstdx,
		great_sortie => s100010,
		less_sortie => s100011
	);

	func100011 : arbre1_mu_A
	GENERIC MAP (
		a => 20,
		b => -327920,
		max => 16401,
		min => 16396,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gdrmx,
		great_sortie => s1000110,
		less_sortie => s1000111
	);

	func1000111 : arbre1_mu_A
	GENERIC MAP (
		a => 33,
		b => -540903,
		max => 16394,
		min => 16391,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gdrmx,
		great_sortie => s10001110,
		less_sortie => s10001111
	);

	func100010 : arbre1_mu_A
	GENERIC MAP (
		a => 2,
		b => -588,
		max => 348,
		min => 294,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gpsdd,
		great_sortie => s1000100,
		less_sortie => s1000101
	);

	func1000101 : arbre1_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 18802,
		min => 18533,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hmaxx,
		great_sortie => s10001010,
		less_sortie => s10001011
	);

	func10000 : arbre1_mu_A
	GENERIC MAP (
		a => 10,
		b => -4000,
		max => 410,
		min => 400,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hpsdt,
		great_sortie => s100000,
		less_sortie => s100001
	);

	func100001 : arbre1_mu_A
	GENERIC MAP (
		a => 10,
		b => -184770,
		max => 18487,
		min => 18477,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hdrmx,
		great_sortie => s1000010,
		less_sortie => s1000011
	);

	func1000011 : arbre1_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 17546,
		min => 17190,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hmaxx,
		great_sortie => s10000110,
		less_sortie => s10000111
	);

	func10000110 : arbre1_mu_A
	GENERIC MAP (
		a => 4,
		b => -72300,
		max => 18100,
		min => 18075,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Gminx,
		great_sortie => s100001100,
		less_sortie => s100001101
	);

	func100001100 : arbre1_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 23230,
		min => 22162,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => uEDA,
		great_sortie => s1000011000,
		less_sortie => s1000011001
	);

	func100000 : arbre1_mu_A
	GENERIC MAP (
		a => 3,
		b => -51249,
		max => 17118,
		min => 17083,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hdrmx,
		great_sortie => s1000000,
		less_sortie => s1000001
	);

	func1000000 : arbre1_mu_A
	GENERIC MAP (
		a => 5,
		b => -114900,
		max => 23002,
		min => 22980,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hmaxx,
		great_sortie => s10000000,
		less_sortie => s10000001
	);

	func10000001 : arbre1_mu_A
	GENERIC MAP (
		a => 6,
		b => -87666,
		max => 14628,
		min => 14611,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rminx,
		great_sortie => s100000010,
		less_sortie => s100000011
	);

	func100000010 : arbre1_mu_A
	GENERIC MAP (
		a => 4,
		b => -77864,
		max => 19491,
		min => 19466,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => uHR,
		great_sortie => s1000000100,
		less_sortie => s1000000101
	);

	func1000000101 : arbre1_mu_A
	GENERIC MAP (
		a => 6,
		b => -5226,
		max => 889,
		min => 871,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hpsdq,
		great_sortie => s10000001010,
		less_sortie => s10000001011
	);

	func10000001010 : arbre1_mu_A
	GENERIC MAP (
		a => 8,
		b => -7440,
		max => 942,
		min => 930,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Hpsdq,
		great_sortie => s100000010100,
		less_sortie => s100000010101
	);

	func100000010100 : arbre1_mu_A
	GENERIC MAP (
		a => 2,
		b => -29702,
		max => 14906,
		min => 14851,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rminx,
		great_sortie => s1000000101000,
		less_sortie => s1000000101001
	);

	func1000000101001 : arbre1_mu_A
	GENERIC MAP (
		a => 2,
		b => -29482,
		max => 14795,
		min => 14741,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rminx,
		great_sortie => s10000001010010,
		less_sortie => s10000001010011
	);

	func1000000100 : arbre1_mu_A
	GENERIC MAP (
		a => 0,
		b => 0,
		max => 21966,
		min => 20651,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => Rmaxx,
		great_sortie => s10000001000,
		less_sortie => s10000001001
	);

	min1111 : arbre1_comp_min3
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1111,
		en4x => sig_taux1,
		sortie => sig_out1
	);

	min111011 : arbre1_comp_min5
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
		en6x => sig_taux2,
		sortie => sig_out2
	);

	min111010 : arbre1_comp_min5
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
		en6x => sig_taux3,
		sortie => sig_out3
	);

	min11100 : arbre1_comp_min4
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
		en5x => sig_taux4,
		sortie => sig_out4
	);

	min11011 : arbre1_comp_min4
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
		en5x => sig_taux5,
		sortie => sig_out5
	);

	min110101 : arbre1_comp_min5
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
		en6x => sig_taux6,
		sortie => sig_out6
	);

	min11010011 : arbre1_comp_min7
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
		en7x => s11010011,
		en8x => sig_taux7,
		sortie => sig_out7
	);

	min11010010 : arbre1_comp_min7
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
		en7x => s11010010,
		en8x => sig_taux8,
		sortie => sig_out8
	);

	min1101000 : arbre1_comp_min6
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
		en7x => sig_taux9,
		sortie => sig_out9
	);

	min1100111111 : arbre1_comp_min9
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
		en6x => s1100111,
		en7x => s11001111,
		en8x => s110011111,
		en9x => s1100111111,
		en10x => sig_taux10,
		sortie => sig_out10
	);

	min1100111110 : arbre1_comp_min9
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
		en6x => s1100111,
		en7x => s11001111,
		en8x => s110011111,
		en9x => s1100111110,
		en10x => sig_taux11,
		sortie => sig_out11
	);

	min110011110 : arbre1_comp_min8
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
		en6x => s1100111,
		en7x => s11001111,
		en8x => s110011110,
		en9x => sig_taux12,
		sortie => sig_out12
	);

	min110011101 : arbre1_comp_min8
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
		en6x => s1100111,
		en7x => s11001110,
		en8x => s110011101,
		en9x => sig_taux13,
		sortie => sig_out13
	);

	min110011100 : arbre1_comp_min8
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
		en6x => s1100111,
		en7x => s11001110,
		en8x => s110011100,
		en9x => sig_taux14,
		sortie => sig_out14
	);

	min11001101 : arbre1_comp_min7
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
		en6x => s1100110,
		en7x => s11001101,
		en8x => sig_taux15,
		sortie => sig_out15
	);

	min11001100 : arbre1_comp_min7
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
		en6x => s1100110,
		en7x => s11001100,
		en8x => sig_taux16,
		sortie => sig_out16
	);

	min1100101 : arbre1_comp_min6
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
		en7x => sig_taux17,
		sortie => sig_out17
	);

	min11001001111 : arbre1_comp_min10
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
		en7x => s11001001,
		en8x => s110010011,
		en9x => s1100100111,
		en10x => s11001001111,
		en11x => sig_taux18,
		sortie => sig_out18
	);

	min11001001110 : arbre1_comp_min10
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
		en7x => s11001001,
		en8x => s110010011,
		en9x => s1100100111,
		en10x => s11001001110,
		en11x => sig_taux19,
		sortie => sig_out19
	);

	min1100100110 : arbre1_comp_min9
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
		en7x => s11001001,
		en8x => s110010011,
		en9x => s1100100110,
		en10x => sig_taux20,
		sortie => sig_out20
	);

	min1100100101 : arbre1_comp_min9
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
		en7x => s11001001,
		en8x => s110010010,
		en9x => s1100100101,
		en10x => sig_taux21,
		sortie => sig_out21
	);

	min11001001001 : arbre1_comp_min10
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
		en7x => s11001001,
		en8x => s110010010,
		en9x => s1100100100,
		en10x => s11001001001,
		en11x => sig_taux22,
		sortie => sig_out22
	);

	min11001001000 : arbre1_comp_min10
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
		en7x => s11001001,
		en8x => s110010010,
		en9x => s1100100100,
		en10x => s11001001000,
		en11x => sig_taux23,
		sortie => sig_out23
	);

	min110010001 : arbre1_comp_min8
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
		en7x => s11001000,
		en8x => s110010001,
		en9x => sig_taux24,
		sortie => sig_out24
	);

	min110010000 : arbre1_comp_min8
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
		en7x => s11001000,
		en8x => s110010000,
		en9x => sig_taux25,
		sortie => sig_out25
	);

	min11000 : arbre1_comp_min4
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
		en5x => sig_taux26,
		sortie => sig_out26
	);

	min1011 : arbre1_comp_min3
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s101,
		en3x => s1011,
		en4x => sig_taux27,
		sortie => sig_out27
	);

	min10101 : arbre1_comp_min4
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s101,
		en3x => s1010,
		en4x => s10101,
		en5x => sig_taux28,
		sortie => sig_out28
	);

	min10100 : arbre1_comp_min4
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s101,
		en3x => s1010,
		en4x => s10100,
		en5x => sig_taux29,
		sortie => sig_out29
	);

	min10011 : arbre1_comp_min4
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1001,
		en4x => s10011,
		en5x => sig_taux30,
		sortie => sig_out30
	);

	min10010 : arbre1_comp_min4
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1001,
		en4x => s10010,
		en5x => sig_taux31,
		sortie => sig_out31
	);

	min10001111 : arbre1_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10001,
		en5x => s100011,
		en6x => s1000111,
		en7x => s10001111,
		en8x => sig_taux32,
		sortie => sig_out32
	);

	min10001110 : arbre1_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10001,
		en5x => s100011,
		en6x => s1000111,
		en7x => s10001110,
		en8x => sig_taux33,
		sortie => sig_out33
	);

	min1000110 : arbre1_comp_min6
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10001,
		en5x => s100011,
		en6x => s1000110,
		en7x => sig_taux34,
		sortie => sig_out34
	);

	min10001011 : arbre1_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10001,
		en5x => s100010,
		en6x => s1000101,
		en7x => s10001011,
		en8x => sig_taux35,
		sortie => sig_out35
	);

	min10001010 : arbre1_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10001,
		en5x => s100010,
		en6x => s1000101,
		en7x => s10001010,
		en8x => sig_taux36,
		sortie => sig_out36
	);

	min1000100 : arbre1_comp_min6
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10001,
		en5x => s100010,
		en6x => s1000100,
		en7x => sig_taux37,
		sortie => sig_out37
	);

	min10000111 : arbre1_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10000,
		en5x => s100001,
		en6x => s1000011,
		en7x => s10000111,
		en8x => sig_taux38,
		sortie => sig_out38
	);

	min100001101 : arbre1_comp_min8
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10000,
		en5x => s100001,
		en6x => s1000011,
		en7x => s10000110,
		en8x => s100001101,
		en9x => sig_taux39,
		sortie => sig_out39
	);

	min1000011001 : arbre1_comp_min9
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10000,
		en5x => s100001,
		en6x => s1000011,
		en7x => s10000110,
		en8x => s100001100,
		en9x => s1000011001,
		en10x => sig_taux40,
		sortie => sig_out40
	);

	min1000011000 : arbre1_comp_min9
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10000,
		en5x => s100001,
		en6x => s1000011,
		en7x => s10000110,
		en8x => s100001100,
		en9x => s1000011000,
		en10x => sig_taux41,
		sortie => sig_out41
	);

	min1000010 : arbre1_comp_min6
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10000,
		en5x => s100001,
		en6x => s1000010,
		en7x => sig_taux42,
		sortie => sig_out42
	);

	min1000001 : arbre1_comp_min6
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10000,
		en5x => s100000,
		en6x => s1000001,
		en7x => sig_taux43,
		sortie => sig_out43
	);

	min100000011 : arbre1_comp_min8
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10000,
		en5x => s100000,
		en6x => s1000000,
		en7x => s10000001,
		en8x => s100000011,
		en9x => sig_taux44,
		sortie => sig_out44
	);

	min10000001011 : arbre1_comp_min10
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10000,
		en5x => s100000,
		en6x => s1000000,
		en7x => s10000001,
		en8x => s100000010,
		en9x => s1000000101,
		en10x => s10000001011,
		en11x => sig_taux45,
		sortie => sig_out45
	);

	min100000010101 : arbre1_comp_min11
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10000,
		en5x => s100000,
		en6x => s1000000,
		en7x => s10000001,
		en8x => s100000010,
		en9x => s1000000101,
		en10x => s10000001010,
		en11x => s100000010101,
		en12x => sig_taux46,
		sortie => sig_out46
	);

	min10000001010011 : arbre1_comp_min13
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10000,
		en5x => s100000,
		en6x => s1000000,
		en7x => s10000001,
		en8x => s100000010,
		en9x => s1000000101,
		en10x => s10000001010,
		en11x => s100000010100,
		en12x => s1000000101001,
		en13x => s10000001010011,
		en14x => sig_taux47,
		sortie => sig_out47
	);

	min10000001010010 : arbre1_comp_min13
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10000,
		en5x => s100000,
		en6x => s1000000,
		en7x => s10000001,
		en8x => s100000010,
		en9x => s1000000101,
		en10x => s10000001010,
		en11x => s100000010100,
		en12x => s1000000101001,
		en13x => s10000001010010,
		en14x => sig_taux48,
		sortie => sig_out48
	);

	min1000000101000 : arbre1_comp_min12
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10000,
		en5x => s100000,
		en6x => s1000000,
		en7x => s10000001,
		en8x => s100000010,
		en9x => s1000000101,
		en10x => s10000001010,
		en11x => s100000010100,
		en12x => s1000000101000,
		en13x => sig_taux49,
		sortie => sig_out49
	);

	min10000001001 : arbre1_comp_min10
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10000,
		en5x => s100000,
		en6x => s1000000,
		en7x => s10000001,
		en8x => s100000010,
		en9x => s1000000100,
		en10x => s10000001001,
		en11x => sig_taux50,
		sortie => sig_out50
	);

	min10000001000 : arbre1_comp_min10
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10000,
		en5x => s100000,
		en6x => s1000000,
		en7x => s10000001,
		en8x => s100000010,
		en9x => s1000000100,
		en10x => s10000001000,
		en11x => sig_taux51,
		sortie => sig_out51
	);

	min10000000 : arbre1_comp_min7
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s100,
		en3x => s1000,
		en4x => s10000,
		en5x => s100000,
		en6x => s1000000,
		en7x => s10000000,
		en8x => sig_taux52,
		sortie => sig_out52
	);

	max : arbre1_comp_max
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
						IF num < 50 THEN
							compt_pr2 <= compt_pr2 + 1;
						END IF;
						ligne <= ligne +1;
					END IF;
				ELSIF ligne < 51 THEN
					IF enable = '1' THEN
						IF num > 50 THEN
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
