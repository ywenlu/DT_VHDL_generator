LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE IEEE.std_logic_arith.all;


ENTITY transmit IS
	GENERIC(
		N : INTEGER := 4; -- 4 bits a transferer
		M_tick : INTEGER := 16 -- 1 stop bit
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
END ENTITY;

ARCHITECTURE appartenance OF transmit IS

SIGNAL t_reg, t_next : unsigned(3 DOWNTO 0);					-- id for tick
SIGNAL n_reg, n_next : unsigned(3 DOWNTO 0); 					-- pointer for the bit of data transmitted
SIGNAL b_reg, b_next : STD_LOGIC_VECTOR(N-1 DOWNTO 0);   		-- line up the data
SIGNAL data, data_next : STD_LOGIC;								-- each bit transmitted

TYPE FSM_STATE_TYPE IS (FSM_IDLE, FSM_START, FSM_DATA, FSM_STOP);
SIGNAL FSM_STATE, FSM_NEXT : FSM_STATE_TYPE;


BEGIN

	PROCESS(clk, reset) IS
	BEGIN
		IF reset = '1' THEN
			t_reg <= ( OTHERS => '0' );
			n_reg <= ( OTHERS => '0' );			
			b_reg <= ( OTHERS => '0' );
			FSM_STATE <= FSM_IDLE;
			data <= '1';
			
		ELSIF clk = '1' and clk'event THEN
			t_reg <= t_next;
			n_reg <= n_next;
			b_reg <= b_next;
			data <= data_next;
			FSM_STATE <= FSM_NEXT;			
		END IF;

	END PROCESS;

	PROCESS(FSM_STATE, t_in, s_tick, t_reg, n_reg, b_reg, data, start) IS
	BEGIN
		FSM_NEXT <= FSM_STATE;
		t_next <= t_reg;
		n_next <= n_reg;
		b_next <= b_reg;
		data_next <= data;
		t_done <= '0';
		
		CASE FSM_STATE IS
			WHEN FSM_IDLE =>
				data_next <= '1';
				IF start = '1' THEN
					FSM_NEXT <= FSM_START;
					t_next <= ( OTHERS => '0' );
					b_next <= t_in;
				END IF;
			
			WHEN FSM_START =>
				data_next <= '0';
				IF s_tick = '1' THEN
					IF t_reg = 15 THEN
						FSM_NEXT <= FSM_DATA;
						t_next <= ( OTHERS=> '0');
						n_next <= ( OTHERS=> '0');					
					ELSE
						t_next <= t_reg + 1;
					END IF;
				END IF;
				
			WHEN FSM_DATA =>
				data_next <= b_reg(0);
				IF s_tick = '1' THEN
					IF t_reg = 15 THEN
						t_next <= ( OTHERS=> '0');
						b_next <= '0'&b_reg(N-1 DOWNTO 1);
						IF n_reg = N - 1 THEN
							FSM_NEXT <= FSM_STOP;
						ELSE
							n_next <= n_reg + 1;
						END IF;
					ELSE
						t_next <= t_reg + 1;
					END IF;
				END IF;
				
			WHEN FSM_STOP =>
				data_next <= '1';
				IF s_tick = '1' THEN
					IF t_reg = M_tick - 1 THEN
						t_done <= '1';
						FSM_NEXT <= FSM_IDLE;
					ELSE
						t_next <= t_reg + 1;
					END IF;
				END IF;
				
		END CASE;
		t_out <= data;

	END PROCESS;
	
END ARCHITECTURE;