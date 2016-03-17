LIBRARY IEEE;
USE ieee.std_logic_1164.all;

USE ieee.numeric_std.all;LIBRARY work;

ENTITY tree1 is
	GENERIC (
		N : integer := 16
	);
	PORT (
		clk : IN STD_LOGIC;
		start : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		data_in : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
	);
end ENTITY;

ARCHITECTURE generate_arbre of tree1 is

	COMPONENT tree1_memory
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

	COMPONENT tree1_comp_min3
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

	COMPONENT tree1_comp_min4
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

	COMPONENT tree1_comp_min5
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

	COMPONENT tree1_comp_min6
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

	COMPONENT tree1_comp_min7
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

	COMPONENT tree1_comp_max
		GENERIC (
			N : INTEGER
		);
		PORT(
			clk : IN STD_LOGIC;
			start : IN STD_LOGIC;
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
	END COMPONENT;

	COMPONENT tree1_mu_A
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
	SIGNAL compt : unsigned(11 DOWNTO 0);
	SIGNAL addr_inter : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL s11 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s11000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s110000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s101111 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s101110 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s101011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s101010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1010101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1010100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s101001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s101000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1010011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1010010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10100101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10100100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s100101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s100100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1001011 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s1001010 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10010101 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10010100 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10001 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL s10000 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
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
	
BEGIN

	sig_taux1 <= STD_LOGIC_VECTOR(TO_SIGNED(81,N));
	sig_taux2 <= STD_LOGIC_VECTOR(TO_SIGNED(12,N));
	sig_taux3 <= STD_LOGIC_VECTOR(TO_SIGNED(38,N));
	sig_taux4 <= STD_LOGIC_VECTOR(TO_SIGNED(95,N));
	sig_taux5 <= STD_LOGIC_VECTOR(TO_SIGNED(25,N));
	sig_taux6 <= STD_LOGIC_VECTOR(TO_SIGNED(78,N));
	sig_taux7 <= STD_LOGIC_VECTOR(TO_SIGNED(13,N));
	sig_taux8 <= STD_LOGIC_VECTOR(TO_SIGNED(71,N));
	sig_taux9 <= STD_LOGIC_VECTOR(TO_SIGNED(100,N));
	sig_taux10 <= STD_LOGIC_VECTOR(TO_SIGNED(1,N));
	sig_taux11 <= STD_LOGIC_VECTOR(TO_SIGNED(66,N));
	sig_taux12 <= STD_LOGIC_VECTOR(TO_SIGNED(5,N));
	sig_taux13 <= STD_LOGIC_VECTOR(TO_SIGNED(8,N));
	sig_taux14 <= STD_LOGIC_VECTOR(TO_SIGNED(60,N));
	sig_taux15 <= STD_LOGIC_VECTOR(TO_SIGNED(25,N));
	sig_taux16 <= STD_LOGIC_VECTOR(TO_SIGNED(62,N));
	sig_taux17 <= STD_LOGIC_VECTOR(TO_SIGNED(78,N));
	sig_taux18 <= STD_LOGIC_VECTOR(TO_SIGNED(66,N));
	sig_taux19 <= STD_LOGIC_VECTOR(TO_SIGNED(28,N));
	sig_taux20 <= STD_LOGIC_VECTOR(TO_SIGNED(33,N));
	sig_taux21 <= STD_LOGIC_VECTOR(TO_SIGNED(20,N));
	sig_taux22 <= STD_LOGIC_VECTOR(TO_SIGNED(89,N));
	sig_taux23 <= STD_LOGIC_VECTOR(TO_SIGNED(33,N));
	
	data_m : tree1_memory
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		we => start,
		reset => reset,
		clk => clk,
		data_in => data_in,
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

	func1 : tree1_mu_A
	GENERIC MAP (
		a => 0.546448,
		b => -1.158470,
		max => 3.950000,
		min => 2.120000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => two,
		great_sortie => s10,
		less_sortie => s11
	);

	func11 : tree1_mu_A
	GENERIC MAP (
		a => 4.347826,
		b => -8.999998,
		max => 2.300000,
		min => 2.070000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => one,
		great_sortie => s110,
		less_sortie => s111
	);

	func111 : tree1_mu_A
	GENERIC MAP (
		a => 49.999748,
		b => -96.499512,
		max => 1.950000,
		min => 1.930000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => two,
		great_sortie => s1110,
		less_sortie => s1111
	);

	func110 : tree1_mu_A
	GENERIC MAP (
		a => 100.000099,
		b => -229.000229,
		max => 2.300000,
		min => 2.290000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => one,
		great_sortie => s1100,
		less_sortie => s1101
	);

	func1100 : tree1_mu_A
	GENERIC MAP (
		a => 100.000099,
		b => -294.000305,
		max => 2.950000,
		min => 2.940000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => two,
		great_sortie => s11000,
		less_sortie => s11001
	);

	func11000 : tree1_mu_A
	GENERIC MAP (
		a => 100.000099,
		b => -295.000305,
		max => 2.960000,
		min => 2.950000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => two,
		great_sortie => s110000,
		less_sortie => s110001
	);

	func10 : tree1_mu_A
	GENERIC MAP (
		a => 0.877193,
		b => -2.850878,
		max => 4.390000,
		min => 3.250000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => one,
		great_sortie => s100,
		less_sortie => s101
	);

	func101 : tree1_mu_A
	GENERIC MAP (
		a => 100.000099,
		b => -343.000336,
		max => 3.440000,
		min => 3.430000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => two,
		great_sortie => s1010,
		less_sortie => s1011
	);

	func1011 : tree1_mu_A
	GENERIC MAP (
		a => 100.000099,
		b => -347.000336,
		max => 3.480000,
		min => 3.470000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => one,
		great_sortie => s10110,
		less_sortie => s10111
	);

	func10111 : tree1_mu_A
	GENERIC MAP (
		a => 100.000099,
		b => -341.000336,
		max => 3.420000,
		min => 3.410000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => two,
		great_sortie => s101110,
		less_sortie => s101111
	);

	func1010 : tree1_mu_A
	GENERIC MAP (
		a => 2.000000,
		b => -6.460000,
		max => 3.730000,
		min => 3.230000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => one,
		great_sortie => s10100,
		less_sortie => s10101
	);

	func10101 : tree1_mu_A
	GENERIC MAP (
		a => 100.000099,
		b => -323.000336,
		max => 3.240000,
		min => 3.230000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => one,
		great_sortie => s101010,
		less_sortie => s101011
	);

	func101010 : tree1_mu_A
	GENERIC MAP (
		a => 100.000099,
		b => -329.000336,
		max => 3.300000,
		min => 3.290000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => one,
		great_sortie => s1010100,
		less_sortie => s1010101
	);

	func10100 : tree1_mu_A
	GENERIC MAP (
		a => 4.347826,
		b => -15.521737,
		max => 3.800000,
		min => 3.570000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => one,
		great_sortie => s101000,
		less_sortie => s101001
	);

	func101001 : tree1_mu_A
	GENERIC MAP (
		a => 100.000099,
		b => -357.000336,
		max => 3.580000,
		min => 3.570000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => one,
		great_sortie => s1010010,
		less_sortie => s1010011
	);

	func1010010 : tree1_mu_A
	GENERIC MAP (
		a => 16.666616,
		b => -59.833153,
		max => 3.650000,
		min => 3.590000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => one,
		great_sortie => s10100100,
		less_sortie => s10100101
	);

	func100 : tree1_mu_A
	GENERIC MAP (
		a => 100.002480,
		b => -438.010864,
		max => 4.390000,
		min => 4.380000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => one,
		great_sortie => s1000,
		less_sortie => s1001
	);

	func1001 : tree1_mu_A
	GENERIC MAP (
		a => 1.639345,
		b => -5.557378,
		max => 4.000000,
		min => 3.390000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => two,
		great_sortie => s10010,
		less_sortie => s10011
	);

	func10010 : tree1_mu_A
	GENERIC MAP (
		a => 25.000025,
		b => -103.000099,
		max => 4.160000,
		min => 4.120000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => one,
		great_sortie => s100100,
		less_sortie => s100101
	);

	func100101 : tree1_mu_A
	GENERIC MAP (
		a => 8.333342,
		b => -33.333366,
		max => 4.120000,
		min => 4.000000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => two,
		great_sortie => s1001010,
		less_sortie => s1001011
	);

	func1001010 : tree1_mu_A
	GENERIC MAP (
		a => 100.002480,
		b => -411.010193,
		max => 4.120000,
		min => 4.110000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => one,
		great_sortie => s10010100,
		less_sortie => s10010101
	);

	func1000 : tree1_mu_A
	GENERIC MAP (
		a => 50.000050,
		b => -229.500229,
		max => 4.610000,
		min => 4.590000,
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		donnees => two,
		great_sortie => s10000,
		less_sortie => s10001
	);

	min1111 : tree1_comp_min3
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

	min1110 : tree1_comp_min3
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s111,
		en3x => s1110,
		en4x => sig_taux2,
		sortie => sig_out2
	);

	min1101 : tree1_comp_min3
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s11,
		en2x => s110,
		en3x => s1101,
		en4x => sig_taux3,
		sortie => sig_out3
	);

	min11001 : tree1_comp_min4
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
		en5x => sig_taux4,
		sortie => sig_out4
	);

	min110001 : tree1_comp_min5
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
		en6x => sig_taux5,
		sortie => sig_out5
	);

	min110000 : tree1_comp_min5
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
		en6x => sig_taux6,
		sortie => sig_out6
	);

	min101111 : tree1_comp_min5
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s101,
		en3x => s1011,
		en4x => s10111,
		en5x => s101111,
		en6x => sig_taux7,
		sortie => sig_out7
	);

	min101110 : tree1_comp_min5
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s101,
		en3x => s1011,
		en4x => s10111,
		en5x => s101110,
		en6x => sig_taux8,
		sortie => sig_out8
	);

	min10110 : tree1_comp_min4
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		en1x => s10,
		en2x => s101,
		en3x => s1011,
		en4x => s10110,
		en5x => sig_taux9,
		sortie => sig_out9
	);

	min101011 : tree1_comp_min5
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
		en5x => s101011,
		en6x => sig_taux10,
		sortie => sig_out10
	);

	min1010101 : tree1_comp_min6
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
		en5x => s101010,
		en6x => s1010101,
		en7x => sig_taux11,
		sortie => sig_out11
	);

	min1010100 : tree1_comp_min6
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
		en5x => s101010,
		en6x => s1010100,
		en7x => sig_taux12,
		sortie => sig_out12
	);

	min1010011 : tree1_comp_min6
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
		en5x => s101001,
		en6x => s1010011,
		en7x => sig_taux13,
		sortie => sig_out13
	);

	min10100101 : tree1_comp_min7
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
		en5x => s101001,
		en6x => s1010010,
		en7x => s10100101,
		en8x => sig_taux14,
		sortie => sig_out14
	);

	min10100100 : tree1_comp_min7
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
		en5x => s101001,
		en6x => s1010010,
		en7x => s10100100,
		en8x => sig_taux15,
		sortie => sig_out15
	);

	min101000 : tree1_comp_min5
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
		en5x => s101000,
		en6x => sig_taux16,
		sortie => sig_out16
	);

	min10011 : tree1_comp_min4
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
		en5x => sig_taux17,
		sortie => sig_out17
	);

	min1001011 : tree1_comp_min6
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
		en5x => s100101,
		en6x => s1001011,
		en7x => sig_taux18,
		sortie => sig_out18
	);

	min10010101 : tree1_comp_min7
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
		en5x => s100101,
		en6x => s1001010,
		en7x => s10010101,
		en8x => sig_taux19,
		sortie => sig_out19
	);

	min10010100 : tree1_comp_min7
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
		en5x => s100101,
		en6x => s1001010,
		en7x => s10010100,
		en8x => sig_taux20,
		sortie => sig_out20
	);

	min100100 : tree1_comp_min5
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
		en5x => s100100,
		en6x => sig_taux21,
		sortie => sig_out21
	);

	min10001 : tree1_comp_min4
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
		en5x => sig_taux22,
		sortie => sig_out22
	);

	min10000 : tree1_comp_min4
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
		en5x => sig_taux23,
		sortie => sig_out23
	);

	max : tree1_comp_max
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		start => start,
		reset => reset,
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
		sortie => sortie
	);

	
-- affecter une des valeurs a la sortie

END ARCHITECTURE;
