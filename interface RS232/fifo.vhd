LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
--USE IEEE.std_logic_arith.all;
--USE ieee.std_logic_unsigned;

ENTITY fifo IS
	GENERIC(
		N : INTEGER := 4;  --nombre de bits
		M : INTEGER := 2 	 --nombre de l'adresse pour le fifo
	);
	PORT(
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		w : IN STD_LOGIC;
		r : IN STD_LOGIC;
		full : OUT STD_LOGIC;
		empty : OUT STD_LOGIC;
		w_data : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		r_data : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
END ENTITY;

ARCHITECTURE appartenance OF fifo IS

TYPE regfiletype IS ARRAY (0 to 2**M-1) OF STD_LOGIC_VECTOR(N-1 DOWNTO 0);
SIGNAL data_reg : regfiletype;
SIGNAL w_pt, w_pt_next : UNSIGNED(M-1 DOWNTO 0);
SIGNAL r_pt, r_pt_next : UNSIGNED(M-1 DOWNTO 0);
SIGNAL op : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL s_full, s_full_next : STD_LOGIC;
SIGNAL s_empty, s_empty_next : STD_LOGIC;

BEGIN

	PROCESS(clk, reset) IS
	BEGIN
		IF reset = '1' THEN
			data_reg <= ( others =>(others => '0') );
			w_pt <= (others => '0');
			r_pt <= (others => '0');			
			s_full <= '0';
			s_empty <= '1';
			
		ELSIF clk = '1' and clk'event THEN
			w_pt <= w_pt_next;
			r_pt <= r_pt_next;
			s_full <= s_full_next;
			s_empty <= s_empty_next;
			r_data <= (others => '0');
			IF w = '1' and s_full = '0' THEN
				data_reg(TO_INTEGER(w_pt)) <= w_data;
			END IF;
			IF r = '1' THEN
				r_data <= data_reg(TO_INTEGER(r_pt));
			END IF;
		END IF;
	END PROCESS;

	op <= w&r;
	
	PROCESS(op, s_empty, s_full, w_pt, r_pt) IS
	BEGIN
		w_pt_next <= w_pt;
		r_pt_next <= r_pt;
		s_full_next <= s_full;
		s_empty_next <= s_empty;
		CASE op IS
			WHEN "00" =>
			WHEN "01" => -- w=0,r=1
				IF s_empty = '0' THEN
					r_pt_next <= r_pt + 1;
					s_full_next <= '0';
					IF w_pt = r_pt + 1 THEN
						s_empty_next <= '1';
					END IF;
				END IF;
			WHEN "10" => -- w=1,r=0
				IF s_full = '0' THEN
					w_pt_next <= w_pt + 1;
					s_empty_next <= '0';
					IF r_pt = w_pt + 1 THEN
						s_full_next <= '1';
					END IF;
				END IF;
			WHEN others => -- w=1,r=1
				r_pt_next <= r_pt + 1;
				w_pt_next <= w_pt + 1;
		END CASE;
	END PROCESS;	
	
	full <= s_full;
	empty <= s_empty;
END ARCHITECTURE;