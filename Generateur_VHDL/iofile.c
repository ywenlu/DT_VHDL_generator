/**
 * @file iofile.c
 * @brief Definition des fonctions declarees dans \a iofile.h
 */

#include "struct.h"
#include "component.h"
#include "construcA.h"
#include "iofile.h"

extern int profondeur_max;
extern int prof_max_global;

extern int compt;

ptr_arbre read_ligne (char * ligne, ptr_arbre tree, int reset) {
	ptr_noeud tmp_n;
	ptr_feuille tmp_f;
	static char label[NB_CHAR] = "1"; // étiquette des noeuds
	char feature[NB_CHAR] = " ";
	char valeur[NB_CHAR] = " ";
	char * f; 					// nom du feature
	char * l; 					// label du noeud
	char * label_feuille;
	char type; 					// sortie great ou less
	static int profondeur = -1;
	static int sens = 0;			// 0 : fils gauche, 1 : fils droit
	float min, max;
	float a, b;					// coefficient directeur, valeur à l'origine
	int i, j, k;
	int yes, no;					// valeurs des feuilles
	int is_leaf = 0;				// si c'est une feuille

	if (reset == 1) {
		sprintf(label, "1");
		profondeur = -1;
		sens = 0;
	}

	i = 0;
	k = 0;
	while (!isalpha(ligne[i])) { // compter la profondeur du noeud
		if (ligne[i] == '|') {
			k += 1;
		}
		i++;
	}

	j = 0;
	while (isalpha(ligne[i])) { // récupérer feature
		feature[j] = ligne[i];
		j++;
		i++;
	}	

	while (!isalpha(ligne[i])) { // déterminer la fonction d'appartenance
		i++;
	}
	type = ligne[i];

	if (k > profondeur) { // détermine le fils gauche ou droit
		if (sens == 0) {
			label[k] = '1';
		}
		else {
			label[k] = '0';
		}
		label[k + 1] = '\0';
		sens = 0;
	}
	else {
		sens = 1;
		label[k + 1] ='\0';
	}

	profondeur = k;
	
	if (profondeur >= profondeur_max) {
		profondeur_max = profondeur + 1;
		if (profondeur_max > prof_max_global) {
			prof_max_global = profondeur_max;
		}
	}

	if (type == 'l') {
		while (ligne[i] != '(') {
			i++;
		}
	}
	i++;

	for (k = 0; k < 2; k++) {
		j = 0;
		// récupérer la valeur du changement de la pente
		while (ligne[i] != '(') {
			i++;
		}
		i++;
		while (ligne[i] != ',') {
			valeur[j] = ligne[i];
			i++;
			j++;
		}
		i++;

		if (k == 0) {
			min = strtod(valeur, NULL);
		}
		else {
			max = strtod(valeur, NULL);
		}
	}

	if (max == min) { // pente infinie
		a = 0;
		b = 0;
	}
	else {
		a = 100.0 / (max - min); // calculer le coefficient directeur
		b = - arrondi(a) * min; // calculer la valeur à l'origine
	}

	f = (char *) malloc (NB_CHAR * sizeof(char));
	l = (char *) malloc (NB_CHAR * sizeof(char));

	if ((f == NULL) || (l == NULL)) {
		exit (EXIT_FAILURE);
	}

	f = strncpy (f, feature, NB_CHAR);
	l = strncpy (l, label, NB_CHAR);

	if (sens == 0) { // ajouter un noeud à gauche
		tmp_n = create_noeud (l, f, (int) min, (int) max, arrondi(a), arrondi(b));
		tree->node = add_noeud (tree->node, tmp_n);
	}

	yes = 0;
	no = 0;

	// déterminer s'il y a une feuille 'oui' ou 'no'
	for (k = 0; k < 2; k++) {
		while ((ligne[i] != 'o') && (ligne[i] != '\n')){
			i++;
		}

		if (ligne[i] == 'o') {
			is_leaf = 1;
			i += 2;
			j = 0;
			if (ligne[i] == '1') {
				i += 6;
				while (isdigit(ligne[i])) {
					valeur[j] = ligne[i];
					i++;
					j++;
				}
				valeur[j] = '\0';
				i++;
				yes = atoi(valeur);
			}
			if (ligne[i] == '2') {
				i += 6;
				while (isdigit(ligne[i])) {
					valeur[j] = ligne[i];
					i++;
					j++;
				}
				valeur[j] = '\0';
				i++;
				no = atoi(valeur);
			}
		}
	}

	if (is_leaf == 1) { // si c'est une feuille
		label_feuille = (char *) malloc (NB_CHAR * sizeof(char));
		if (label_feuille == NULL) {
			fprintf (stderr, "ERREUR : mémoire insuffisante\n");
			exit (EXIT_FAILURE);
		}

		label_feuille = strncpy(label_feuille, label, NB_CHAR);

		if (type == 'l') {
			label_feuille = strncat (label_feuille, "1", NB_CHAR);
		}
		else {
			label_feuille = strncat (label_feuille, "0", NB_CHAR);
		}
		tmp_f = create_feuille (label_feuille, yes, no);
		tree->leaf = add_feuille (tree->leaf, tmp_f);
		
		compt = compt + 1;
	}

	return tree; // retourner l'arbre construit
}


void print_noeud (ptr_noeud node) {
<<<<<<< HEAD
	printf ("*node: label = %s, feature = %s, "
			"min = %f, max = %f, a = %f, b = %f\n",
=======
	printf ("label = %16s, feature = %8s, "
			"min = %6d, max = %6d, a = %6d, b = %8d\n",
>>>>>>> parent of 5b50029... Without arrondisement
		node->label, node->feature, node->min, node->max, node->a, node->b);
}


void print_feuille (ptr_feuille leaf) {
	printf ("\n\n==leaf: label = %s\t"
			"yes = %d, no = %d\n",
		leaf->label, leaf->yes, leaf->no);
}


void write_csv (FILE * file, ptr_noeud node) {
	if (node != NULL) {
		fprintf (file, "%s;%s;%d;%d\n",
			node->label, node->feature, node->min, node->max);        // modifier pour changer la precision
		write_csv (file, node->fils_g);
		write_csv (file, node->fils_d);
	}
}

void write_vhd (FILE * file, ptr_arbre tree, char * entity) {

	ptr_feuille leaf;
	ptr_noeud node;

	// déclaration des composants
	vhdl_emotion (file, entity);
	vhdl_memory (file, entity);
	vhdl_comp_min (file, tree->leaf, entity);
	vhdl_comp_max (file, entity);
	vhdl_mu_A (file, entity);
	vhdl_signal (file, tree);

	fputs ("\n"
			"BEGIN\n\n\t",
		file);

	// instanciation des composants
	vhdl_signal_taux (file, tree);
	vhdl_inst_memory (file, entity);
	node = tree->node;
	vhdl_inst_mu_A (file, tree->node, entity);
	leaf = tree->leaf;
	
	vhdl_inst_comp_min (file, leaf, entity);
	vhdl_inst_comp_max (file, entity);

	fputs("\n"
		"-- affecter une des valeurs a la sortie\n\n"
		"END ARCHITECTURE;\n",
		file);
}

void write_tex (FILE * file, ptr_arbre tree) {
	ptr_noeud node;
	ptr_feuille leaf;
	
	node = tree->node;
	leaf = tree->leaf;
	
	tex_entete(file); // entête du fichier
	
	fputs ("\\begin{document}\n\n", file);
	tex_style (file);
	tex_picture(file, node, leaf);
	fputs ("\\end{document}\n", file);
}

