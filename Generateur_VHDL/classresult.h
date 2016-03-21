
/**
 * @file classresult.h
 * @brief Contient les fonctions sur la lecture et l'écriture des différents fichiers
 */

#ifndef CLASSRESULT_H
#define CLASSRESULT_H

#include "struct.h"
#include "iofile.h"
float getfvalue(ptr_noeud node,char *feature[],float *fvalue);
float appartenance (ptr_noeud node, float input);

typedef struct branch{
	ptr_noeud node;
	short sens;
	float deg;
	struct branch * suiv;
} branch,* ptr_branch;

ptr_branch create_branch (ptr_noeud node, short sens, float deg);

ptr_branch add_branch (ptr_branch tete, ptr_branch element);

typedef struct feuilleagg {
	struct feuille * leaf;
	float min;
	struct noeud *minnode;
	struct branch * line;
	struct feuilleagg * suiv;
} feuilleagg, * ptr_feuilleagg;

ptr_feuilleagg create_feuilleagg (ptr_feuille leaf, float min);

ptr_feuilleagg add_feuilleagg (ptr_feuilleagg tete, ptr_feuilleagg element);

typedef struct combiner {
	struct feuilleagg * leafagg;	/**< Liste de noeuds */
	struct feuilleagg * leafc1;
	struct feuilleagg * leafc2;
	struct feuilleagg * leafc; // result class chemin
	int result;
	float deg;
} combiner, * ptr_combiner;

ptr_combiner create_combiner (ptr_feuilleagg leafagg);


void feuillepere (ptr_noeud tete, ptr_noeud *pere, char *label);
//ptr_noeud feuillepere (ptr_noeud tete, char *label);
ptr_combiner prediction(ptr_arbre tree,char *feature[],float * fvalue);

int validation(ptr_arbre *tree,char *feature[],float * fvalue);
void changeseuil(ptr_noeud *node, float value);
void adaption(ptr_combiner *combineres,char *feature[],float * fvalue);
#endif
