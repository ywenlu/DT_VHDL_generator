LIBRARY IEEE;
USE ieee.std_logic_1164.all;
--USE ieee.numeric_std.all;
USE IEEE.std_logic_arith.all;
--USE ieee.std_logic_unsigned;

ENTITY baud_gen IS
	GENERIC(
		N : INTEGER := 4;
		M : INTEGER := 8 -- 50MHz,115200 bits, 16x =27
	);
	PORT(
		clk : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		baud_tick : OUT STD_LOGIC;
		q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
END ENTITY;

ARCHITECTURE appartenance OF baud_gen IS

signal s_reg : unsigned(N-1 DOWNTO 0);
signal s_next : unsigned(N-1 DOWNTO 0);

BEGIN

	PROCESS(clk, reset) IS
	BEGIN
		IF reset = '1' THEN
			s_reg <= ( others => '0' );
		ELSIF clk = '1' and clk'event THEN
			s_reg <= s_next;
		END IF;

	END PROCESS;
	
	s_next <= ( others =>'0') WHEN s_reg = (M-1) ELSE s_reg + 1;
	
	baud_tick <= '1' WHEN (s_reg = M-1) ELSE '0';
	q <= STD_LOGIC_VECTOR(s_reg);
	
END ARCHITECTURE;