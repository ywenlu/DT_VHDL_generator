/**
 * @file component.c
 * @brief Definition des fonctions declarees dans \a component.h
 */

#include "component.h"


extern int profondeur_max; /** Profondeur maximale d'un arbre */
extern int compt;

int inter;
	
void vhdl_emotion (FILE * file, char * entity) {
	fprintf (file,
			"LIBRARY IEEE;\n"
			"USE ieee.std_logic_1164.all;\n\n"
			"USE ieee.numeric_std.all;"
			"LIBRARY work;\n\n"
			"ENTITY %s is\n\t"
			"GENERIC (\n\t\t"
			"N : integer := 16\n\t"
			");\n\t"
			"PORT (\n\t\t"
			"clk : IN STD_LOGIC;\n\t\t"
			"start : IN STD_LOGIC;\n\t\t"
			"reset : IN STD_LOGIC;\n\t\t"
			"data_in : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t"
			"sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)\n\t"
			");\n"
			"end ENTITY;\n\n",
		entity);
	
	fprintf (file,
			"ARCHITECTURE generate_arbre of %s is\n\n\t",
		entity);
}


void vhdl_memory (FILE * file, char * entity) {
	fprintf (file,
			"COMPONENT %s_memory\n\t\t"
			"GENERIC (\n\t\t\t"
			"N : INTEGER\n\t\t"
			");\n\t\t"
			"PORT(\n\t\t\t"
			"we : IN STD_LOGIC;\n\t\t\t"
			"reset : IN STD_LOGIC;\n\t\t\t"
			"clk : IN STD_LOGIC;\n\t\t\t"
			"data_in : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Gdrmn : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Gdrmx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Gmaxx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Gminx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Gpsdd : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Gpsdq : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Gpsdt : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Gpsdu : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Gstdx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Hdrmn : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Hdrmx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Hmaxx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Hminx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Hpsdd : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Hpsdq : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Hpsdt : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Hpsdu : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Hstdx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Rdrmn : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Rdrmx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Rmaxx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Rminx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Rpsdd : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Rpsdq : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Rpsdt : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Rpsdu : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"Rstdx : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"uEDA : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"uHR : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"uRR : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)\n\t\t"
			");\n\t"
			"END COMPONENT;\n\n\t",
		entity);
}


void vhdl_comp_min (FILE * file, ptr_feuille leaf, char * entity) {
	int i;
	int nb_in;
	short * tab_comp;

	tab_comp = (short *) malloc((profondeur_max + 1)* sizeof(short));
	for (i = 0; i <= profondeur_max; i++) {
		tab_comp[i] = 0;
//		generate_min(i+2);
	}

	while (leaf != NULL) {
		nb_in = strnlen (leaf->label, NB_CHAR) - 1;
		if (tab_comp[nb_in] == 0) {
			fprintf (file, "COMPONENT %s_comp_min%d\n\t\t",entity, nb_in);
			fputs ("GENERIC (\n\t\t\t"
					"N : INTEGER\n\t\t"
					");\n\t\t"
					"PORT(\n\t\t\t"
					"clk : IN STD_LOGIC;\n\t\t\t"
					"reset : IN STD_LOGIC;\n\t\t\t",
				file);
		
			for (i = 0; i < nb_in+1; i++) {
				fprintf(file,
					"en%dx : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t",
					i + 1);
			}
		
			fputs("sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)\n\t\t"
					");\n\t"
					"END COMPONENT;\n\n\t", 
				file);
			tab_comp[nb_in] = 1;
		}
		leaf = leaf->suiv;
	}

	free(tab_comp);
	tab_comp = NULL;
}

void vhdl_comp_max (FILE * file, char * entity) {
	int i;

	fprintf (file,
			"COMPONENT %s_comp_max\n\t\t"
			"GENERIC (\n\t\t\t"
			"N : INTEGER\n\t\t"
			");\n\t\t"
			"PORT(\n\t\t\t"
			"clk : IN STD_LOGIC;\n\t\t\t"
			"start : IN STD_LOGIC;\n\t\t\t"
			"reset : IN STD_LOGIC;\n\t\t\t",
		entity);
		
	for (i = 0; i < compt; i++) {
		fprintf(file,
			"en%dx : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t",
			i + 1);
	}
		
	fputs("sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)\n\t\t"
			");\n\t"
			"END COMPONENT;\n\n\t", 
		file);	
}


void vhdl_mu_A (FILE * file, char * entity) {
	fprintf (file,
			"COMPONENT %s_mu_A\n\t\t"
			"GENERIC (\n\t\t\t"
			"a : INTEGER;\n\t\t\t"
			"b : INTEGER;\n\t\t\t"
			"max : INTEGER;\n\t\t\t"
			"min : INTEGER;\n\t\t\t"
			"N : INTEGER\n\t\t"
			");\n\t\t"
			"PORT (\n\t\t\t"
			"clk : IN STD_LOGIC;\n\t\t\t"
			"reset : IN STD_LOGIC;\n\t\t\t"
			"donnees : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"great_sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
			"less_sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)\n\t\t"
			");\n\t"
			"END COMPONENT;\n\n\t",
		entity);
}


void vhdl_signal (FILE * file, ptr_arbre tree) {
	ptr_noeud node;
	ptr_feuille leaf;
	int num_signal = 1; // compte le nombre de signaux intermédiaires
	
	fputs ("SIGNAL Gdrmn : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Gdrmx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Gmaxx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Gminx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Gpsdd : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Gpsdq : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Gpsdt : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Gpsdu : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Gstdx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Hdrmn : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Hdrmx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Hmaxx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Hminx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Hpsdd : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Hpsdq : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Hpsdt : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Hpsdu : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Hstdx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Rdrmn : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Rdrmx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Rmaxx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Rminx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Rpsdd : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Rpsdq : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Rpsdt : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Rpsdu : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL Rstdx : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL uEDA : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL uHR : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL uRR : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
			"SIGNAL compt : unsigned(11 DOWNTO 0);\n\t"
			"SIGNAL addr_inter : STD_LOGIC_VECTOR(11 DOWNTO 0);\n\t",
		file);

	node = tree->node;

	vhdl_signal_node (file, node); // parcours d'arbre

	leaf = tree->leaf;
	
	while (leaf != NULL) {
			fprintf (file,
				"SIGNAL sig_out%d  : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t"
				"SIGNAL sig_taux%d : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t",
				num_signal, num_signal);
			num_signal++;
		leaf = leaf->suiv;
	}
}


void vhdl_signal_node (FILE * file, ptr_noeud node) {
	if (node != NULL) {
		fprintf (file,
			"SIGNAL s%s1 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t",
			node->label);
		fprintf (file,
			"SIGNAL s%s0 : STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t",
			node->label);

		vhdl_signal_node (file, node->fils_g);
		vhdl_signal_node (file, node->fils_d);
	}
}


void vhdl_signal_taux (FILE * file, ptr_arbre tree) {
	ptr_feuille leaf;
	int num_signal = 1; // compte le nombre de signaux intermédiaires
	float taux;

	leaf = tree->leaf;

	while (leaf != NULL) {
			taux = (float)leaf->yes / (leaf->yes + leaf->no);
			inter = (int)(taux*100);	
			fprintf (file,
				"sig_taux%d <= STD_LOGIC_VECTOR(TO_SIGNED(%d,N));\n\t",
				num_signal, inter);
			num_signal++;
		leaf = leaf->suiv;
	}
}


void vhdl_inst_memory (FILE * file, char * entity) {
	fprintf (file,
			"\n\t"
			"data_m : %s_memory\n\t"
			"GENERIC MAP (\n\t\t"
			"N => %d\n\t"
			")\n\t"
			"PORT MAP (\n\t\t"
			"we => start,\n\t\t"
			"reset => reset,\n\t\t"
			"clk => clk,\n\t\t"
			"data_in => data_in,\n\t\t"
			"Gdrmn => Gdrmn,\n\t\t"
			"Gdrmx => Gdrmx,\n\t\t"
			"Gmaxx => Gmaxx,\n\t\t"
			"Gminx => Gminx,\n\t\t"
			"Gpsdd => Gpsdd,\n\t\t"
			"Gpsdq => Gpsdq,\n\t\t"
			"Gpsdt => Gpsdt,\n\t\t"
			"Gpsdu => Gpsdu,\n\t\t"
			"Gstdx => Gstdx,\n\t\t"
			"Hdrmn => Hdrmn,\n\t\t"
			"Hdrmx => Hdrmx,\n\t\t"
			"Hmaxx => Hmaxx,\n\t\t"
			"Hminx => Hminx,\n\t\t"
			"Hpsdd => Hpsdd,\n\t\t"
			"Hpsdq => Hpsdq,\n\t\t"
			"Hpsdt => Hpsdt,\n\t\t"
			"Hpsdu => Hpsdu,\n\t\t"
			"Hstdx => Hstdx,\n\t\t"
			"Rdrmn => Rdrmn,\n\t\t"
			"Rdrmx => Rdrmx,\n\t\t"
			"Rmaxx => Rmaxx,\n\t\t"
			"Rminx => Rminx,\n\t\t"
			"Rpsdd => Rpsdd,\n\t\t"
			"Rpsdq => Rpsdq,\n\t\t"
			"Rpsdt => Rpsdt,\n\t\t"
			"Rpsdu => Rpsdu,\n\t\t"
			"Rstdx => Rstdx,\n\t\t"
			"uEDA => uEDA,\n\t\t"
			"uHR => uHR,\n\t\t"
			"uRR => uRR\n\t"
			");\n\n\t",
		entity, NB_BIT);
}


void vhdl_inst_mu_A (FILE * file, ptr_noeud node, char * entity) {
	char label_d[NB_CHAR];
	char label_g[NB_CHAR];

	if (node != NULL) {
		sprintf(label_d, "%s1", node->label); // sortie moins
		sprintf(label_g, "%s0", node->label); // sortie plus

		fprintf (file, "func%s : %s_mu_A\n\t"
				"GENERIC MAP (\n\t\t"
				"a => %d,\n\t\t"
				"b => %d,\n\t\t"
				"max => %f,\n\t\t"
				"min => %f,\n\t\t"
				"N => %d\n\t"
				")\n\t"
				"PORT MAP (\n\t\t"
				"clk => clk,\n\t\t"
				"reset => reset,\n\t\t"
				"donnees => %s,\n\t\t"
				"great_sortie => s%s,\n\t\t"
				"less_sortie => s%s\n\t"
				");\n\n\t",
			node->label, entity, node->a, node->b, node->max, node->min, NB_BIT,
			node->feature, label_g, label_d);
		vhdl_inst_mu_A (file, node->fils_g, entity);
		vhdl_inst_mu_A (file, node->fils_d, 	entity);
	}

}


void vhdl_inst_comp_min (FILE * file, ptr_feuille leaf, char * entity) {
	int longueur;
	int i;
	int num_signal = 1;
	char * wire;

	wire = (char *) malloc (NB_CHAR * sizeof(char));

	while (leaf != NULL) {
		longueur = strnlen(leaf->label, NB_CHAR);
		
//		printf("%f\n", taux);
		
		fprintf (file,
			"min%s : %s_comp_min%d\n\t"
			"GENERIC MAP (\n\t\t"
			"N => %d\n\t"
			")\n\t"
			"PORT MAP (\n\t\t"
			"clk => clk,\n\t\t"
			"reset => reset,\n\t\t",
			leaf->label, entity, longueur - 1, NB_BIT);

		for (i = 1; i < longueur; i++) {
			wire = strncpy (wire, " ", NB_CHAR);
			wire = strncpy(wire, leaf->label, i + 1);
			fprintf(file, "en%dx => s%s,\n\t\t", i, wire);
		}
		fprintf (file, "en%dx => sig_taux%d,\n\t\t", longueur, num_signal);
		fprintf (file, "sortie => sig_out%d\n\t"
			");\n\n\t",
			num_signal++);
		leaf = leaf->suiv;
	}
}

void vhdl_inst_comp_max (FILE * file, char * entity) {

	int i;

	fprintf (file,
		"max : %s_comp_max\n\t"
		"GENERIC MAP (\n\t\t"
		"N => %d\n\t"
		")\n\t"
		"PORT MAP (\n\t\t"
		"clk => clk,\n\t\t"
		"start => start,\n\t\t"
		"reset => reset,\n\t\t",
		entity, NB_BIT);

	for (i = 1; i < compt + 1; i++) {
		fprintf(file, "en%dx => sig_out%d,\n\t\t", i, i);
	}
	fprintf (file, "sortie => sortie\n\t"
		");\n\n\t");
}


void generate_min (int nb_entree, char * entity) {
	FILE * file;
	int i;
	char nom_file[NB_CHAR];
	
	sprintf(nom_file, "%s_comp_min%d.vhd", entity, nb_entree);
	file = fopen(nom_file, "w+");

	if (file == NULL) {
		fprintf(stderr, "ERREUR FICHIER : fichier non ouvert\n");
		exit (EXIT_FAILURE);
	}

	fprintf(file,
		"LIBRARY IEEE;\n"
		"USE ieee.std_logic_1164.all;\n"
		"USE ieee.numeric_std.all;\n\n"
		"USE work.ADF.all;\n\n"
		"ENTITY %s_comp_min%d IS\n\t"
		"GENERIC (\n\t\t"
		"N : INTEGER := 16\n\t"
		");\n\t"
		"PORT (\n\t\t"
		"clk : IN STD_LOGIC;\n\t\t"
		"reset : IN STD_LOGIC;\n\t\t",
		entity, nb_entree
	);

	for (i = 0; i < nb_entree + 1; i++) {
		fprintf(file,
			"en%dx : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t",
			i + 1
		);
	}

	fprintf(file, "sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)\n\t"
		");\n"
		"END ENTITY;\n\n"
		"ARCHITECTURE min%d OF %s_comp_min%d IS\n\n"
		"BEGIN\n\t"
		"PROCESS (reset, clk) IS\n\t\t"
		"VARIABLE elem : TAB(0 TO %d);\n\t\t"
		"VARIABLE min : INTEGER;\n\n\t"
		"BEGIN\n\t\t"
		"IF reset = '1' THEN\n\t\t\t"
		"sortie <= (OTHERS => '0');\n\t\t"
		"ELSE\n\t\t\t"
		"IF clk = '1' AND clk'EVENT THEN\n\t\t\t\t",
		nb_entree, entity, nb_entree, nb_entree
	);

	for (i = 0; i < nb_entree + 1; i++) {
		fprintf(file,
			"elem(%d) := TO_INTEGER(SIGNED(en%dx));\n\t\t\t\t",
			i, i + 1
		);
	}

	fprintf(file,
		"min := elem(0);\n\n\t\t\t\t"
		"FOR i IN 0 TO %d LOOP\n\t\t\t\t\t"
		"IF elem(i + 1) < min THEN\n\t\t\t\t\t\t"
		"min := elem(i + 1);\n\t\t\t\t\t"
		"END IF;\n\t\t\t\t"
		"END LOOP;\n\t\t\t\t"
		"sortie <= STD_LOGIC_VECTOR(TO_SIGNED(min, N));\n\t\t\t"
		"END IF;\n\t\t"
		"END IF;\n\t"
		"END PROCESS;\n"
		"END ARCHITECTURE;",
		nb_entree - 1
	);

//	free(nom_file);
//	nom_file = NULL;
	fclose(file);
}

void generate_mux (void) {
	FILE * file;
	char nom_file[NB_CHAR];
	
	sprintf(nom_file, "mux_1to2.vhd");
	file = fopen(nom_file, "w+");

	if (file == NULL) {
		fprintf(stderr, "ERREUR FICHIER : fichier non ouvert\n");
		exit (EXIT_FAILURE);
	}

	fprintf(file,
		"LIBRARY IEEE;\n"
		"USE ieee.std_logic_1164.all;\n"
		"USE ieee.numeric_std.all;\n\n"
		"ENTITY mux_1to2 IS\n\t"
		"GENERIC (\n\t\t"
		"N : INTEGER := 16\n\t"
		");\n\t"
		"PORT (\n\t\t"
		"sel : IN STD_LOGIC;\n\t\t"
		"d : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t"
		"y1 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t"
		"y2 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)\n\t\t"
		");\n"
		"END ENTITY;\n\n"
		"ARCHITECTURE multiplexeur OF mux_1to2 IS\n\n"
		"SIGNAL temp : std_logic_vector(N-1 DOWNTO 0);\n"
		"BEGIN\n\t"
		"temp <= d;\n\t"
		"PROCESS (sel, temp) IS\n\t"
		"BEGIN\n\t\t"
		"IF sel = '0' THEN\n\t\t\t"
		"y1 <= temp;\n\t\t\t"
		"y2 <= (others => '0');\n\t\t"
		"ELSE\n\t\t\t"
		"y1 <= (others => '0');\n\t\t\t"
		"y2 <= temp;\n\t\t"
		"END IF;\n\t"
		"END PROCESS;\n"
		"END ARCHITECTURE;"
	);

//	free(nom_file);
//	nom_file = NULL;
	fclose(file);
}


void generate_max (char * entity) {
	FILE * file;
	int i;
	char nom_file[NB_CHAR];
	
	sprintf(nom_file, "%s_comp_max.vhd", entity);
	file = fopen(nom_file, "w+");

	if (file == NULL) {
		fprintf(stderr, "ERREUR FICHIER : fichier non ouvert\n");
		exit (EXIT_FAILURE);
	}

	fprintf(file,
		"LIBRARY IEEE;\n"
		"USE ieee.std_logic_1164.all;\n"
		"USE ieee.numeric_std.all;\n\n"
		"USE work.ADF.all;\n\n"
		"ENTITY %s_comp_max IS\n\t"
		"GENERIC (\n\t\t"
		"N : INTEGER := 16\n\t"
		");\n\t"
		"PORT (\n\t\t"
		"clk : IN STD_LOGIC;\n\t\t"
		"reset : IN STD_LOGIC;\n\t\t"
		"start : IN STD_LOGIC;\n\t\t",entity
	);

	for (i = 0; i < compt; i++) {
		fprintf(file,
			"en%dx : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t",
			i + 1
		);
	}

	fprintf(file, "sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)\n\t"
		");\n"
		"END ENTITY;\n\n"
		"ARCHITECTURE max OF %s_comp_max IS\n\n\t"
		"SHARED VARIABLE elem : TAB(0 TO %d);\n\t"
		"SHARED VARIABLE max : INTEGER;\n\t"
		"SIGNAL compt_ex : INTEGER; --pour compter le temps d'execution pour chaque arbre\n\t"
		"SIGNAL enable : STD_LOGIC;\n\t"
		"SIGNAL compt_rom : INTEGER;\n\t"
		"BEGIN\n\t"
		"PROCESS (reset, clk, enable) IS\n\t\t"
		"BEGIN\n\t\t"
		"IF reset = '1' THEN\n\t\t\t"
		"sortie <= (OTHERS => '0');\n\t\t"
		"ELSE\n\t\t\t"
		"IF clk = '1' AND clk'EVENT THEN\n\t\t\t\t",
		entity, compt-1
	);

	for (i = 0; i < compt; i++) {
		fprintf(file,
			"elem(%d) := TO_INTEGER(SIGNED(en%dx));\n\t\t\t\t",
			i, i + 1
		);
	}

	fprintf(file,
		"max := elem(0);\n\n\t\t\t\t"
		"FOR i IN 0 TO %d LOOP\n\t\t\t\t\t"
		"IF elem(i + 1) > max THEN\n\t\t\t\t\t\t"
		"max := elem(i + 1);\n\t\t\t\t\t"
		"END IF;\n\t\t\t\t"
		"END LOOP;\n\t\t\t"
		"END IF;\n\t\t\t"
		"IF enable = '1' THEN\n\t\t\t\t"
		"sortie <= STD_LOGIC_VECTOR(TO_SIGNED(max, N));\n\t\t\t"
		"ELSE\n\t\t\t\t"
		"sortie <= (OTHERS => '0');\n\t\t\t"
		"END IF;\n\t\t"
		"END IF;\n\t"
		"END PROCESS;\n\n\t"
		"PROCESS (reset, clk, compt_ex, start) IS\n\t"
		"BEGIN\n\t\t"
		"IF (reset = '1') THEN\n\t\t\t"
		"compt_ex <= 0;\n\t\t\t"
		"compt_rom <= 0;\n\t\t\t"
		"enable <= '0';\n\t\t"
		"ELSIF clk = '1' and clk'event THEN\n\t\t\t"
		"IF start= '1' THEN\n\t\t\t\t"
		"IF compt_rom = 2 THEN\n\t\t\t\t\t"
		"IF compt_ex <= 33 THEN\n\t\t\t\t\t\t"
		"enable <= '1';\n\t\t\t\t\t\t"
		"compt_ex <= 4;\n\t\t\t\t\t"
		"ELSE\n\t\t\t\t\t\t"
		"enable <= '0';\n\t\t\t\t\t\t"
		"compt_ex <= compt_ex + 1;\n\t\t\t\t\t"
		"END IF;\n\t\t\t\t"
		"ELSE\n\t\t\t\t\t"
		"compt_rom <= compt_rom + 1;\n\t\t\t\t"
		"END IF;\n\t\t\t"
		"END IF;\n\t\t"
		"END IF;\n\t"
		"END PROCESS;\n"
		"END ARCHITECTURE;",
		compt - 2
	);

	fclose(file);
}


void generate_mu(char * entity)
{
	FILE * file;
	char name_file[NB_CHAR];
	
	sprintf(name_file, "%s_mu_A.vhd", entity);
	file = fopen(name_file, "w+");

	if (file == NULL) {
		fprintf(stderr, "ERREUR FICHIER : fichier non ouvert\n");
		exit (EXIT_FAILURE);
	}
	
	fprintf(file,
		"LIBRARY IEEE;\n"
		"USE ieee.std_logic_1164.all;\n"
		"USE ieee.numeric_std.all;\n\n"
		"ENTITY %s_mu_A IS\n\t"
		"GENERIC(\n\t\t"
		"N : INTEGER := 16;\n\t\t"
		"a : INTEGER := 0;\n\t\t"
		"b : INTEGER := 0;\n\t\t"
		"min : INTEGER := 0;\n\t\t"
		"max : INTEGER := 0\n\t"
		");\n\t"
		"PORT(\n\t\t"
		"clk : IN STD_LOGIC;\n\t\t"
		"reset: IN STD_LOGIC;\n\t\t"
		"donnees: IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t"
		"great_sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t"
		"less_sortie : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)\n\t\t"
		");\n"
		"END ENTITY;\n\n"
		"ARCHITECTURE appartenance OF %s_mu_A IS\n\n"
		"BEGIN\n\t"
		"PROCESS(clk, reset, donnees) IS\n\t\t"
		"VARIABLE less_y : INTEGER;\n\t\t"
		"VARIABLE great_y : INTEGER;\n\t"
		"BEGIN\n\t\t"
		"IF reset = '1' THEN\n\t\t\t"
		"great_y := 0;\n\t\t\t"
		"less_y := 0;\n\t\t"
		"ELSE\n\t\t\t"
		"IF (clk'EVENT AND clk = '1') THEN\n\t\t\t\t"
		"great_y := a * TO_INTEGER(SIGNED(donnees)) + b;\n\t\t\t\t"
		"IF TO_INTEGER(SIGNED(donnees)) <= min THEN\n\t\t\t\t\t"
		"great_y := 0;\n\t\t\t\t"
		"ELSIF TO_INTEGER(SIGNED(donnees)) > max THEN\n\t\t\t\t\t"
		"great_y := 100;\n\t\t\t\t"
		"END IF;\n\t\t\t\t"
		"less_y := 100 - great_y;\n\t\t\t"
		"END IF;\n\t\t"
		"END IF;\n\t\t"
		"great_sortie <= STD_LOGIC_VECTOR(TO_SIGNED(great_y, N));\n\t\t"
		"less_sortie <= STD_LOGIC_VECTOR(TO_SIGNED(less_y, N));\n\t"
		"END PROCESS;\n"
		"END ARCHITECTURE;\n", entity, entity
	);

	fclose(file);	
}

void generate_memory(char * entity) {

	FILE * file;
	char name_file[NB_CHAR];

	sprintf(name_file, "%s_memory.vhd", entity);
	
	file = fopen(name_file, "w+");

	if (file == NULL) {
		fprintf(stderr, "ERREUR FICHIER : fichier non ouvert\n");
		exit (EXIT_FAILURE);
	}

	fprintf(file,
		"LIBRARY IEEE;	--! Bibliotheque standard IEEE\n"
		"USE ieee.std_logic_1164.all;\n"
		"USE ieee.numeric_std.all;\n\n"
		"ENTITY %s_memory IS\n\t"
		"GENERIC (\n\t\t"
		"N : INTEGER := 16	--! Taille des bus d'entree et sortie\n\t"
		");\n\t"
		"PORT (\n\t\t"
		"data_in : IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);\n\t\t"
		"we : IN STD_LOGIC;\n\t\t"
		"reset : IN STD_LOGIC;\n\t\t"
		"clk : IN STD_LOGIC;\n\t\t"
		"Gdrmn : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gdrmn, address 0x00\n\t\t"
		"Gdrmx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gdrmx, address 0x01\n\t\t"
		"Gmaxx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gmaxx, address 0x02\n\t\t"
		"Gminx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gminx, address 0x03\n\t\t"
		"Gpsdd : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gpsdd, address 0x04\n\t\t"
		"Gpsdq : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gpsdq, address 0x05\n\t\t"
		"Gpsdt : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gpsdt, address 0x06\n\t\t"
		"Gpsdu : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gpsdu, address 0x07\n\t\t"
		"Gstdx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Gstdx, address 0x08\n\t\t"
		"Hdrmn : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hdrmn, address 0x09\n\t\t"
		"Hdrmx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hdrmx, address 0x0A\n\t\t"
		"Hmaxx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hmaxx, address 0x0B\n\t\t"
		"Hminx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hminx, address 0x0C\n\t\t"
		"Hpsdd : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hpsdd, address 0x0D\n\t\t"
		"Hpsdq : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hpsdq, address 0x0E\n\t\t"
		"Hpsdt : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hpsdt, address 0x0F\n\t\t"
		"Hpsdu : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hpsdu, address 0x10\n\t\t"
		"Hstdx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Hstdx, address 0x11\n\t\t"
		"Rdrmn : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rdrmn, address 0x12\n\t\t"
		"Rdrmx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rdrmx, address 0x13\n\t\t"
		"Rmaxx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rmaxx, address 0x14\n\t\t"
		"Rminx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rminx, address 0x15\n\t\t"
		"Rpsdd : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rpsdd, address 0x16\n\t\t"
		"Rpsdq : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rpsdq, address 0x17\n\t\t"
		"Rpsdt : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rpsdt, address 0x18\n\t\t"
		"Rpsdu : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rpsdu, address 0x19\n\t\t"
		"Rstdx : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal Rstdx, address 0x1A\n\t\t"
		"uEDA : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal uEDA, address 0x1B\n\t\t"
		"uHR : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0);	--! Signal uHR, address 0x1C\n\t\t"
		"uRR : OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)	--! Signal uRR, address 0x1D\n\t\t"
		");\n"
		"END ENTITY;\n\n"
		"ARCHITECTURE lec_ecr OF %s_memory IS\n\t"
		"TYPE DATA1 IS ARRAY(1 TO 30) of STD_LOGIC_VECTOR(15 DOWNTO 0);\n\t"
		"SIGNAL reg_in, reg_out : DATA1;\n\n"
		"TYPE DATA2 IS ARRAY(1 TO 29) of STD_LOGIC;\n\t"
		"SIGNAL mux_sel : DATA2;\n\t"
		"SIGNAL compt, compt_rom : INTEGER;\n\n\t"
		"COMPONENT mux_1to2\n\t\t"
		"GENERIC (\n\t\t\t"
		"N : INTEGER\n\t\t"
		");\n\t\t"
		"PORT(\n\t\t\t"
		"sel : IN STD_LOGIC;\n\t\t\t"
		"d : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
		"y1 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0);\n\t\t\t"
		"y2 : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)\n\t\t"
		");\n\t"
		"END COMPONENT;\n\n"
		"BEGIN\n\t"
		"mux1 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(1),\n\t\t"
		"d => reg_out(1),\n\t\t"
		"y1 => reg_in(2),\n\t\t"
		"y2 => Hpsdq\n\t"
		");\n\t"
		"mux2 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(2),\n\t\t"
		"d => reg_out(2),\n\t\t"
		"y1 => reg_in(3),\n\t\t"
		"y2 => Rpsdq\n\t"
		");\n\t"
		"mux3 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(3),\n\t\t"
		"d => reg_out(3),\n\t\t"
		"y1 => reg_in(4),\n\t\t"
		"y2 => Gpsdq\n\t"
		");\n\t"
		"mux4 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(4),\n\t\t"
		"d => reg_out(4),\n\t\t"
		"y1 => reg_in(5),\n\t\t"
		"y2 => Hpsdt\n\t"
		");\n\t"
		"mux5 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(5),\n\t\t"
		"d => reg_out(5),\n\t\t"
		"y1 => reg_in(6),\n\t\t"
		"y2 => Rpsdt\n\t"
		");\n\t"
		"mux6 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(6),\n\t\t"
		"d => reg_out(6),\n\t\t"
		"y1 => reg_in(7),\n\t\t"
		"y2 => Gpsdt\n\t"
		");\n\t"
		"mux7 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(7),\n\t\t"
		"d => reg_out(7),\n\t\t"
		"y1 => reg_in(8),\n\t\t"
		"y2 => Hpsdd\n\t"
		");\n\t"
		"mux8 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(8),\n\t\t"
		"d => reg_out(8),\n\t\t"
		"y1 => reg_in(9),\n\t\t"
		"y2 => Rpsdd\n\t"
		");\n\t"
		"mux9 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(9),\n\t\t"
		"d => reg_out(9),\n\t\t"
		"y1 => reg_in(10),\n\t\t"
		"y2 => Gpsdd\n\t"
		");\n\t"
		"mux10 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(10),\n\t\t"
		"d => reg_out(10),\n\t\t"
		"y1 => reg_in(11),\n\t\t"
		"y2 => Hpsdu\n\t"
		");\n\t"
		"mux11 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(11),\n\t\t"
		"d => reg_out(11),\n\t\t"
		"y1 => reg_in(12),\n\t\t"
		"y2 => Rpsdu\n\t"
		");\n\t"
		"mux12 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(12),\n\t\t"
		"d => reg_out(12),\n\t\t"
		"y1 => reg_in(13),\n\t\t"
		"y2 => Gpsdu\n\t"
		");\n\t"
		"mux13 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(13),\n\t\t"
		"d => reg_out(13),\n\t\t"
		"y1 => reg_in(14),\n\t\t"
		"y2 => Hdrmx\n\t"
		");\n\t"
		"mux14 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(14),\n\t\t"
		"d => reg_out(14),\n\t\t"
		"y1 => reg_in(15),\n\t\t"
		"y2 => Rdrmx\n\t"
		");\n\t"
		"mux15 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(15),\n\t\t"
		"d => reg_out(15),\n\t\t"
		"y1 => reg_in(16),\n\t\t"
		"y2 => Gdrmx\n\t"
		");\n\t"
		"mux16 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(16),\n\t\t"
		"d => reg_out(16),\n\t\t"
		"y1 => reg_in(17),\n\t\t"
		"y2 => Hdrmn\n\t"
		");\n\t"
		"mux17 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(17),\n\t\t"
		"d => reg_out(17),\n\t\t"
		"y1 => reg_in(18),\n\t\t"
		"y2 => Rdrmn\n\t"
		");\n\t"
		"mux18 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(18),\n\t\t"
		"d => reg_out(18),\n\t\t"
		"y1 => reg_in(19),\n\t\t"
		"y2 => Gdrmn\n\t"
		");\n\t"
		"mux19 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(19),\n\t\t"
		"d => reg_out(19),\n\t\t"
		"y1 => reg_in(20),\n\t\t"
		"y2 => Hstdx\n\t"
		");\n\t"
		"mux20 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(20),\n\t\t"
		"d => reg_out(20),\n\t\t"
		"y1 => reg_in(21),\n\t\t"
		"y2 => Rstdx\n\t"
		");\n\t"
		"mux21 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(21),\n\t\t"
		"d => reg_out(21),\n\t\t"
		"y1 => reg_in(22),\n\t\t"
		"y2 => Gstdx\n\t"
		");\n\t"
		"mux22 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(22),\n\t\t"
		"d => reg_out(22),\n\t\t"
		"y1 => reg_in(23),\n\t\t"
		"y2 => Hminx\n\t"
		");\n\t"
		"mux23 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(23),\n\t\t"
		"d => reg_out(23),\n\t\t"
		"y1 => reg_in(24),\n\t\t"
		"y2 => Rminx\n\t"
		");\n\t"
		"mux24 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(24),\n\t\t"
		"d => reg_out(24),\n\t\t"
		"y1 => reg_in(25),\n\t\t"
		"y2 => Gminx\n\t"
		");\n\t"
		"mux25 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(25),\n\t\t"
		"d => reg_out(25),\n\t\t"
		"y1 => reg_in(26),\n\t\t"
		"y2 => Hmaxx\n\t"
		");\n\t"
		"mux26 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(26),\n\t\t"
		"d => reg_out(26),\n\t\t"
		"y1 => reg_in(27),\n\t\t"
		"y2 => Rmaxx\n\t"
		");\n\t"
		"mux27 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(27),\n\t\t"
		"d => reg_out(27),\n\t\t"
		"y1 => reg_in(28),\n\t\t"
		"y2 => Gmaxx\n\t"
		");\n\t"
		"mux28 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(28),\n\t\t"
		"d => reg_out(28),\n\t\t"
		"y1 => reg_in(29),\n\t\t"
		"y2 => uHR\n\t"
		");\n\t"
		"mux29 : mux_1to2\n\t"
		"GENERIC MAP(\n\t\t"
		"N => 16\n\t"
		")\n\t"
		"PORT MAP(\n\t\t"
		"sel => mux_sel(29),\n\t\t"
		"d => reg_out(29),\n\t\t"
		"y1 => reg_in(30),\n\t\t"
		"y2 => uRR\n\t"
		");\n\n\t"
		"PROCESS (clk, reset, we, compt, data_in, reg_out(30)) IS\n\t"
		"BEGIN\n\t\t"
		"reg_in(1) <= data_in;\n\t\t"
		"uEDA <= reg_out(30);\n\t\t"
		"IF (reset = '1') THEN\n\t\t\t"
		"compt <= 0;\n\t\t\t"
		"compt_rom <= 0;\n\t\t"
		"ELSIF clk = '1' and clk'event THEN\n\t\t\t\t"
		"IF (we = '1') THEN\n\t\t\t\t\t"
		"FOR i IN 1 TO 29 LOOP\n\t\t\t\t\t\t"
		"reg_out(i) <= reg_in(i);\n\t\t\t\t\t"
		"END LOOP;\n\t\t\t\t\t"
		"IF compt_rom = 2 THEN\n\t\t\t\t\t\t"
		"IF compt = 30 THEN\n\t\t\t\t\t\t\t"
		"FOR i IN 1 TO 29 LOOP\n\t\t\t\t\t\t\t\t"
		"mux_sel(i) <= '1';\n\t\t\t\t\t\t\t"
		"END LOOP;\n\t\t\t\t\t\t\t"
		"reg_out(30) <= reg_in(30);\n\t\t\t\t\t\t\t"
		"compt <= 1;\n\t\t\t\t\t\t"
		"ELSE\n\t\t\t\t\t\t\t"
		"reg_out(30) <= (OTHERS => '0');\n\t\t\t\t\t\t\t"
		"FOR i IN 1 TO 29 LOOP\n\t\t\t\t\t\t\t\t"
		"mux_sel(i) <= '0';\n\t\t\t\t\t\t\t"
		"END LOOP;\n\t\t\t\t\t\t\t"
		"compt <= compt + 1;\n\t\t\t\t\t\t"
		"END IF;\n\t\t\t\t\t"
		"ELSE\n\t\t\t\t\t\t"
		"compt_rom <= compt_rom + 1;\n\t\t\t\t\t"
		"END IF;\n\t\t\t\t"
		"END IF;\n\t\t\t"
		"END IF;\n\t"
		"END PROCESS;\n\n"
		"END ARCHITECTURE;", entity, entity
	);
	fclose(file);
}


void generate_package(void) {
	FILE * file;
	char name_file[NB_CHAR];

	sprintf(name_file, "ADF.vhd");
	
	file = fopen(name_file, "w+");

	if (file == NULL) {
		fprintf(stderr, "ERREUR FICHIER : fichier non ouvert\n");
		exit (EXIT_FAILURE);
	}

	fprintf(file,
		"Library IEEE;\n"
		"USE ieee.std_logic_1164.all;\n"
		"USE ieee.numeric_std.all;\n\n"
		"PACKAGE ADF IS\n\t"
		"TYPE TAB IS ARRAY (NATURAL RANGE <>) OF INTEGER; -- tableau de integer\n"
		"END PACKAGE;\n"
		);
	fclose(file);
}
