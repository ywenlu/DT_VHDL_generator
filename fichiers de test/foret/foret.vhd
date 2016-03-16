LIBRARY IEEE;
USE ieee.std_logic_1164.all;

USE ieee.numeric_std.all;LIBRARY work;

ENTITY foret is
	GENERIC (
		N : integer := 16
--		M : integer := 100 ----------------nombre de donnees d'entree
	);
	PORT (
		clk : IN STD_LOGIC;
		start : IN STD_LOGIC;  ------------------------------------- enable
		reset : IN STD_LOGIC;
		ledr : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);   ----- le resultat de chaque ligne
		ledv : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)		----- pourcentage
	);
end ENTITY;

ARCHITECTURE generate_foret of foret is


	COMPONENT arbre1
		GENERIC (
			N : INTEGER
		);
		PORT(
			clk : IN STD_LOGIC;
			start : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			data_in : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			sortie : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT arbre2
		GENERIC (
			N : INTEGER
		);
		PORT(
			clk : IN STD_LOGIC;
			start : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			data_in : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			sortie : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
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
	
	TYPE DATA IS ARRAY(1 TO 2) of STD_LOGIC_VECTOR(N-1 DOWNTO 0);  
	SIGNAL sortie : DATA;

	TYPE DATA2 IS ARRAY(1 TO 2) of INTEGER;  
	SIGNAL num, compt_pr : DATA2;
	SIGNAL rom_out : STD_LOGIC_VECTOR(N-1 DOWNTO 0);
	SIGNAL addr_inter : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL sortie_inter : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL num_inter, compt_rom, compt_ex, ligne, compt_red : INTEGER; 
	SIGNAL enable : STD_LOGIC;	
	SIGNAL compt		: unsigned (11 downto 0);	

	
BEGIN	

	compo1 : arbre1
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		start => start,
		reset => reset,
		data_in => rom_out,		
		sortie => sortie(1)
	);	
	
	compo2 : arbre2
	GENERIC MAP (
		N => 16
	)
	PORT MAP (
		clk => clk,
		start => start,
		reset => reset,
		data_in => rom_out,	
		sortie => sortie(2)
	);

	rom : rom_1                       -------------N=16
	PORT MAP (
		clock => clk,
		address => addr_inter,               ------------------
		q => rom_out                      ----------------------------------------------------
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
	
	PROCESS (clk, reset, compt_ex, start) IS   --------generer le signal de enable, quand il faut recuperer la valeur
	BEGIN

		IF (reset = '1') THEN
			compt_ex <= 0;
			enable <= '0';
			compt_rom <= 0;

		ELSIF clk = '1' and clk'event THEN
			IF start = '1' THEN
				IF compt_rom = 2 THEN
					IF compt_ex = 36 THEN
						enable <= '1';
						compt_ex <= 7;
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
	
	PROCESS(clk, reset, start, ligne, enable, compt_red, num_inter) IS
	BEGIN
		IF reset = '1' THEN
			compt_pr(1) <= 0;
			compt_pr(2) <= 0;	
			ligne <= 0;
			ledv <= (others => '0');
			ledr <= (others => '0');
			compt_red <= 0;
			
		ELSIF clk = '1' and clk'event THEN
			num(1) <= TO_INTEGER(UNSIGNED(sortie(1)));
			num(2) <= TO_INTEGER(UNSIGNED(sortie(2)));
			sortie_inter <= STD_LOGIC_VECTOR(TO_UNSIGNED((num(1) + num(2)), 8));
			num_inter <= TO_INTEGER(UNSIGNED('0'&sortie_inter(7 DOWNTO 1)));
			
			IF start = '1' THEN
				IF ligne = 100 THEN
					IF enable = '1' THEN
						IF num_inter > 50 THEN
							IF compt_red = 9 THEN
								compt_red <= 0;
							ELSE 
								compt_red <= compt_red + 1;
							END IF;
							ledr(compt_red) <= '1';
							compt_pr(2) <= compt_pr(2) + 1;
						ELSE
							IF compt_red = 9 THEN
								compt_red <= 0;
							ELSE 
								compt_red <= compt_red + 1;
							END IF;
							ledr(compt_red) <= '0';
							compt_pr(2) <= compt_pr(2) + 1;	
						END IF;
						ligne <= ligne +1;
					END IF;
--					ledv <= STD_LOGIC_VECTOR(TO_UNSIGNED((compt_pr(1) + compt_pr(2)), 7));
				ELSIF ligne > 50 and ligne < 100 THEN
					IF enable = '1' THEN
						IF num_inter > 50 THEN
							IF compt_red = 9 THEN
								compt_red <= 0;
							ELSE 
								compt_red <= compt_red + 1;
							END IF;
							ledr(compt_red) <= '1';
							compt_pr(2) <= compt_pr(2) + 1;
						ELSE
							IF compt_red = 9 THEN
								compt_red <= 0;
							ELSE 
								compt_red <= compt_red + 1;
							END IF;
							ledr(compt_red) <= '0';
						END IF;
						ligne <= ligne +1;
					END IF;
				ELSIF ligne < 51 THEN
					IF enable = '1' THEN
						IF num_inter < 50 THEN
							IF compt_red = 9 THEN
								compt_red <= 0;
							ELSE 
								compt_red <= compt_red + 1;
							END IF;
							ledr(compt_red) <= '1';
							compt_pr(1) <= compt_pr(1) + 1;
						ELSE
							IF compt_red = 9 THEN
								compt_red <= 0;
							ELSE 
								compt_red <= compt_red + 1;
							END IF;
							ledr(compt_red) <= '0';						
						END IF;
						ligne <= ligne +1;
					END IF;
				ELSE
					ledv <= STD_LOGIC_VECTOR(TO_UNSIGNED((compt_pr(1) + compt_pr(2)), 7));
				END IF;
			END IF;
		END IF;			
	END PROCESS;	
END ARCHITECTURE;
