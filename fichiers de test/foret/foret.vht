-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "08/31/2012 16:05:25"
                                                            
-- Vhdl Test Bench template for design  :  foret
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY foret_vhd_tst IS
END foret_vhd_tst;
ARCHITECTURE foret_arch OF foret_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL ledr : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL ledv : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL start : STD_LOGIC;
CONSTANT T : time := 20 ns;
SHARED VARIABLE i : INTEGER :=0;
COMPONENT foret
	PORT (
	clk : IN STD_LOGIC;
	ledr : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	ledv : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	reset : IN STD_LOGIC;
	start : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : foret
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	ledr => ledr,
	ledv => ledv,
	reset => reset,
	start => start
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
    reset <= '1','0' after T/2;    -- code that executes only once                             
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
    for i in 0 to 5000 loop
		clk <= '0';
		wait for T/2;
		clk <= '1';
		wait for T/2;
	end loop;	    -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always; 
enable : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
    start <= '0', '1' after T*2;                    
WAIT;                                                       
END PROCESS enable;                                           
END foret_arch;
