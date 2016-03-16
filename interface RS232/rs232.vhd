LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE IEEE.std_logic_arith.all;

ENTITY rs232 IS
	GENERIC(
		N : INTEGER := 4; -- 8 bits a transferer
		M_tick : INTEGER := 16 -- 1 stop bit
	);
	PORT(
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		r_in : IN STD_LOGIC;
		r, w : IN STD_LOGIC;		
		w_data : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		r_data : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);
		full_1, full_2, empty_1 : OUT STD_LOGIC;
		t_out : OUT STD_LOGIC
		);
END ENTITY;

ARCHITECTURE appartenance OF rs232 IS

	COMPONENT baud_gen
		GENERIC (
			N : INTEGER;
			M : INTEGER -- 50MHz,115200 bits, 16x =27
		);
		PORT(
			clk : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			baud_tick : OUT STD_LOGIC;
			q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT receiver
		GENERIC(
			N : INTEGER; -- 8 bits a transferer
			M_tick : INTEGER-- 1 stop bit
		);
		PORT(
			clk : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			s_tick : IN STD_LOGIC;		
			r_in : IN STD_LOGIC;
			r_done : OUT STD_LOGIC;
			r_out : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT transmit
		GENERIC(
			N : INTEGER; -- 4 bits a transferer
			M_tick : INTEGER -- 1 stop bit
		);
		PORT(
			clk : IN STD_LOGIC;
			reset : IN STD_LOGIC;
			start : IN STD_LOGIC;
			s_tick : IN STD_LOGIC;		
			t_in : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
			t_done : OUT STD_LOGIC;
			t_out : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT fifo
		GENERIC(
			N : INTEGER;  --nombre de bits
			M : INTEGER	 --nombre de l'adresse pour le fifo
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
	END COMPONENT;
	
SIGNAL donnee_r, donnee_t : STD_LOGIC_VECTOR(N-1 DOWNTO 0);   -- line up the data
SIGNAL tick, inter_r, inter_t, empty_2, no_empty : STD_LOGIC;


BEGIN
	tick_gen : baud_gen
	GENERIC MAP (
		N => 4,
		M => 8
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		baud_tick => tick,
		q => open
	);

	recevoir : receiver
	GENERIC MAP (
		N => 4,
		M_tick => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		s_tick => tick,
		r_in => r_in,
		r_done => inter_r,		
		r_out => donnee_r
	);	
	
	envoyer : transmit
	GENERIC MAP (
		N => 4,
		M_tick => 16
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		start => no_empty,
		s_tick => tick,
		t_in => donnee_t,
		t_done => inter_t,		
		t_out => t_out
	);	

	fifo1 : fifo
	GENERIC MAP (
		N => 4,
		M => 2
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		w => inter_r,
		r => r,
		full => full_1,
		empty => empty_1,
		w_data => donnee_r,		
		r_data => r_data
	);	

	fifo2 : fifo
	GENERIC MAP (
		N => 4,
		M => 2
	)
	PORT MAP (
		clk => clk,
		reset => reset,
		w => w,
		r => inter_t,
		full => full_2,
		empty => empty_2,
		w_data => w_data,		
		r_data => donnee_t
	);	
	PROCESS(clk, reset) IS
	BEGIN
		IF reset = '1' THEN
--			donnee_r <= ( OTHERS => '0' );			
--			donnee_t <= ( OTHERS => '0' );
--			tick <= '0';
--			inter_r <= '0';
--			inter_t <= '0';
--			inter_f <= '0';
--			empty_2 <= '0';
			no_empty <= '0';
		ELSIF clk = '1' and clk'event THEN
			no_empty <= empty_2;		
		END IF;

	END PROCESS;

	
END ARCHITECTURE;