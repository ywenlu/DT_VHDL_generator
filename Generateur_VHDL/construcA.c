/**
 * @file construcA.c
 * @brief Definition des fonctions declarees dans \a construcA.h
 */

#include "construcA.h"


void tex_entete (FILE * file) {
	fputs ("\\documentclass[11pt]{article}\n"
			"\\usepackage{pdflscape}\n"
			"\\usepackage{geometry}\n"
			"\\usepackage{tikz}\n\n"
			"\\geometry{papersize={200cm,40cm},top=1cm,left=1cm,right=1cm,bottom=1cm}\n\n",
		file);
}


void tex_style (FILE * file) {
	fputs ("\\tikzstyle{lien}=[->,>=stealth,thick]\n"
			"\\tikzset{noeud/.style = {minimum width=1.8cm,minimum height=1.2cm,\n\t"
			"text width=1.6cm,text badly ragged,\n\t"
			"rectangle,rounded corners=5pt,draw,\n\t"
			"fill=#1!25,font=\\tiny},\n\t"
			"noeud/.default={gray}}\n\n",
		file);
}


void	tex_picture(FILE * file, ptr_noeud node, ptr_feuille leaf) {

	fputs ("\\thispagestyle{empty}\n\n"
		"\\begin{tikzpicture}[scale=1]\n\n",
		file);

	tex_noeud(file, node, leaf, 1);

	fputs("\n"
		"\\end{tikzpicture}\n", 
		file);
}


ptr_feuille tex_noeud (FILE * file, ptr_noeud node, ptr_feuille leaf, int reset) {
	char * label;
	char l[NB_CHAR] = " ";
	int y;
	int x;
	static int pos_x = 0;
	static int pos_y = 0;
	
	if (reset == 1) {
		pos_x = 0;
		pos_y = 0;
	}

	if (node != NULL) {
		label = node->label;
		y = strnlen(label, NB_CHAR) - 1;

		pos_y = y;
		
		x = pos_x;

		
		fprintf (file,
			"\\node[noeud] (n%s) at (%d,%d) {%s\\\\ %s\\\\ %.2f ; %.2f};\n",
			node->label, DECAL_X * x, DECAL_Y * y, node->label, node->feature, node->min / 100.0, node->max / 100.0);

		leaf = tex_noeud (file, node->fils_g, leaf, 0);


		if (node->fils_g == NULL) {
			y = y + 1;

			if (leaf == NULL) {
				printf("ERREUR : Arbre incorrect\n");
				exit(EXIT_FAILURE);
			}
			fprintf(file,
				"\\node[noeud=green] (n%s) at (%d,%d) {%s\\\\ yes = %d\\\\ no = %d};\n",
				leaf->label, x * DECAL_X, y * DECAL_Y, leaf->label, leaf->yes, leaf->no);

			leaf = leaf->suiv;
			y = y - 1;
		}

		pos_x = pos_x + 1;
		leaf = tex_noeud (file, node->fils_d, leaf, 0);

		if (node->fils_d == NULL) {
			pos_y = pos_y + 1;
			y = y + 1;
			if (leaf == NULL) {
				printf("EURREUR : Arbre incorrect\n");
				exit(1);
			}

			fprintf (file,
				"\\node[noeud=green] (n%s) at (%d,%d) {%s\\\\ yes = %d\\\\no = %d};\n",
				leaf->label, pos_x * DECAL_X, y * DECAL_Y, leaf->label, leaf->yes, leaf->no);

			leaf = leaf->suiv;
			y = y - 1;
		}
		sprintf (l, "%s1", node->label);

		fprintf (file,
			"\\draw[lien] (n%s) |- (%.1f,%.1f) -| (n%s);\n",
			node->label, (float) x * DECAL_X, (2 * y + 1) * DECAL_Y / 2.0, l);


		sprintf (l, "%s0", node->label);

		fprintf (file,
			"\\draw[lien] (n%s) |- (%.1f,%.1f) -| (n%s);\n",
			node->label, (2 * x) * DECAL_X / 2.0, (2 * y + 1) * DECAL_Y / 2.0, l);

	}
	return leaf;
}

