/**
 * @file struct.c
 * @brief Definition des fonctions declarees dans \a struct.h
 */

#include "struct.h"

ptr_noeud create_noeud (char label[], char feature[], float min, float max, int a, int b) {
	ptr_noeud tmp;

	tmp = (ptr_noeud) malloc (sizeof (noeud));

	if (tmp == NULL) {
		fprintf (stderr, "ERREUR : Mémoire insuffisante\n");
		exit (EXIT_FAILURE);
	}
	// initialiser les champs
	tmp->label = label;
	tmp->feature = feature;
	tmp->min = min;
	tmp->max = max;
	tmp->a = a;
	tmp->b = b;
	tmp->pere = NULL;
	tmp->fils_g = NULL;
	tmp->fils_d = NULL;
	return tmp;
}

ptr_feuille create_feuille (char label[], int yes, int no) {
	ptr_feuille tmp;
	
	tmp = (ptr_feuille) malloc (sizeof (feuille));
	
	if (tmp == NULL) {
		fprintf (stderr, "ERREUR : mémoire insuffisante\n");
		exit (EXIT_FAILURE);
	}

	// initialiser les champs
	tmp->label = label;
	tmp->yes = yes;
	tmp->no = no;
	tmp->suiv = NULL;
	
	return tmp;
}


ptr_arbre create_arbre (ptr_noeud node, ptr_feuille leaf) {
	ptr_arbre tmp;
	
	tmp = (ptr_arbre) malloc (sizeof (arbre));
	
	if (tmp == NULL) {
		fprintf (stderr, "ERREUR : Mémoire insuffisante\n");
		exit (EXIT_FAILURE);
	}
	
	tmp->node = node;
	tmp->leaf = leaf;
	
	return tmp;
}


ptr_noeud add_noeud (ptr_noeud tete, ptr_noeud element) {
	ptr_noeud tmp;
	int i;
	int longueur;
	char * label;

	tmp = tete;

	if (tmp == NULL) {
		return element;
	}

	longueur = strnlen (element->label, NB_CHAR);
	label = element->label;

	for (i = 1; i < longueur - 1; i++) {
		switch (label[i]) {
			case '0' :
				tmp = tmp->fils_d;
				break;
			case '1' :
				tmp = tmp->fils_g;
				break;
			default :
				fprintf (stderr, "ERREUR : Noeud inconnu\n");
				exit (EXIT_FAILURE);
		}
		if (tmp == NULL) {
			fprintf (stderr, "ERREUR : Arbre incorrect\n");
			exit (EXIT_FAILURE);
		}
	}
	if (label[longueur - 1] == '1') {
		tmp->fils_g = element;
	}
	else {
		tmp->fils_d = element;
	}
	element->pere = tmp;

	return tete;
}


ptr_feuille add_feuille (ptr_feuille tete, ptr_feuille element) {
	ptr_feuille tmp;

	tmp = tete;

	if (tmp == NULL) {
		return element;
	}

	while (tmp->suiv != NULL) {
		tmp = tmp->suiv;
	}
	
	tmp->suiv = element;

	return tete;
}


ptr_feuille delete_feuille (ptr_feuille tete) {
	
	if (tete != NULL) {
		// fonction récurssive
		tete->suiv = delete_feuille(tete->suiv);
		free(tete);
		if (!tete) {
			fprintf(stderr, "ERREUR : Libération de la mémoire\n");
			exit(EXIT_FAILURE);
		}
	}
	return NULL;
}


ptr_noeud delete_noeud (ptr_noeud tete) {
	if (tete != NULL) {
		tete->fils_g = delete_noeud (tete->fils_g);
		tete->fils_d = delete_noeud (tete->fils_d);
		
		free(tete);
		if (!tete) {
			fprintf(stderr, "ERREUR : Libération de la mémoire\n");
			exit(EXIT_FAILURE);
		}
	}
	return NULL;
}


int arrondi (float x) {
	int tmp;

	tmp = (int) 10 * x;

	if (tmp % 10 > 4) { // arrondi par valeur supérieurs
		tmp = tmp + 10;
	}

	tmp = tmp / 10;

	return tmp;
}
