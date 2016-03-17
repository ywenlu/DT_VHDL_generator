/**
 * @file struct.h
 * @brief Definition des structures et des fonctions d'initialisation
 */

#ifndef STRUCT_H
#define STRUCT_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>


/**
 * @def NB_FILE_NAME
 * @brief Nombre de caractères maximal pour nommer un fichier
 */

#define NB_FILE_NAME 40

/**
 * @def NB_CHAR
 * @brief Nombre maximal de caractères pour les labels
 */

#define NB_CHAR 32

/**
 * @def NB_LIGNE
 * @brief Lire au maximum NB_CHAR caractères par ligne
 */

#define NB_LIGNE 1000


/**
 * @struct noeud struct.h
 * @brief Structure d'un noeud de l'arbre
 * 
 * Le programme realise un arbre binaire a partir du fichier en entree
 */

/**
 * @typedef noeud
 * @brief Structure noeud, equivaut a \e struct \e noeud
 */

/**
 * @typedef ptr_noeud
 * @brief Pointeur sur noeud, equivaut a \e struct \e noeud *
 */

typedef struct noeud {
	char * label;		/**< Numero du noeud, unique pour chaque noeud */
	char * feature;	/**< Nom du signal a  analyser */
	float min;			/**< Valeur du changement de la pente (minimum) */
	float max;			/**< Valeur du changement de la pente (maximum) */
	float a;			/**< Coefficient direction de la fonction d'appartenance */
	float b;			/**< Valeur Ã  l'origine de la fonction d'appartenance */
	struct noeud * pere;/**< Pointeur sur le père */
	struct noeud * fils_g;	/**< Pointeur sur le fils gauche */
	struct noeud * fils_d;	/**< Pointeur sur le fils droit */
} noeud, * ptr_noeud;


/**
 * @struct feuille
 * @brief Structure d'une feuille de l'arbre 
 */

/**
 * @typedef feuille
 * @brief Structure feuille, equivaut a  \e struct \e feuille
 */

/**
 * @typedef ptr_feuille
 * @brief Pointeur sur feuille, equivaut a  \e struct \e feuille *
 */

typedef struct feuille {
	char * label;	/**< Numero de la feuille (unique pour chaque feuille) */
	int yes;		/**< Nombre de 'yes' */
	int no;		/**< nombre de 'no' */
	struct feuille * suiv; /**< Pointeur sur l'element suivant */
} feuille, * ptr_feuille;

/**
 * @struct arbre
 * @brief Structure d'un arbre
 *  
 * L'ensemble des noeuds et des feuilles
 */

/**
 * @typedef arbre
 * @brief Structure arbre, equivaut a  \e struct \e arbre
 */

/**
 * @typedef ptr_arbre
 * @brief Pointeur sur arbre, equivaut a  \e struct \e arbre *
 */

typedef struct arbre {
	struct noeud * node;	/**< Liste de noeuds */
	struct feuille * leaf;	/**< Liste de feuilles */
} arbre, * ptr_arbre;

/**
 * @fn ptr_noeud create_noeud (char label[], char feature[], int min, int max, int a, int b)
 * @brief Allouer de l'espace memoire pour un noeud, et l'initialiser avec les valeurs en paramètre
 * @param label Le numero du noeud
 * @param feature Le nom du signal
 * @param min Valeur du changement de pente 
 * @param max Valeur du changement de pente
 * @param a Coefficient directeur de la fonction d'appatenance
 * @param b Valeur Ã  l'origine de la fonction d'appartenance
 * @return Noeud cree
 */

ptr_noeud create_noeud (char label[], char feature[], float min, float max, float a, float b);

/**
 * @fn create_feuille (char label[], int yes, int no)
 * @brief Alloueur de l'espace memoire pour une feuille, et l'initialiser
 * @param label Le numero du noeud
 * @param yes Valeur  de sortie de la feuille
 * @param no Valeur de sortie de la feuille
 * @return Feuille cree
 */

ptr_feuille create_feuille (char label[], int yes, int no);

/**
 * @fn ptr_arbre create_arbre (ptr_noeud node, ptr_feuille leaf)
 * @brief Alloueur de l'espace memoire pour un arbre, et l'initialiser
 * @param node Pointeur sur un noeud
 * @param leaf Pointeur sur une feuille
 * @return Arbre cree
 */

ptr_arbre create_arbre (ptr_noeud node, ptr_feuille leaf);

/**
 * @fn ptr_noeud add_noeud (ptr_noeud tete, ptr_noeud element)
 * @brief Ajouter un noeud Ã  la liste
 * @param tete Pointeur sur le premier element de la liste
 * @param element Pointeur sur le noeud Ã  ajouter
 * @return La nouvelle liste de noeuds
 */

ptr_noeud add_noeud (ptr_noeud tete, ptr_noeud element);

/**
 * @fn ptr_feuille delete_noeud (ptr_noeud tete)
 * @brief Liberer l'espace memoire reserve par \a noeud
 * @param tete Pointeur sur le première element de la liste
 * @return retourne NULL si la liberation est sans erreur
 */

ptr_noeud delete_noeud (ptr_noeud tete);

/**
 * @fn ptr_feuille add_feuille (ptr_feuille tete, ptr_feuille element)
 * @brief Ajouter une feuille a la liste
 * @param tete Pointeur sur le premier element de la liste 
 * @param element Pointeur sur la feuille Ã  ajouter
 */

ptr_feuille add_feuille (ptr_feuille tete, ptr_feuille element);

/**
 * @fn ptr_feuille delete_feuille (ptr_feuille tete)
 * @brief Liberer l'espace memoire reserve par \a feuille
 * @param tete Pointeur sur le première element de la liste
 * @return retourne NULL si la liberation est sans erreur
 */

ptr_feuille delete_feuille (ptr_feuille tete);

/**
 * @fn int arrondi (float x)
 * @brief Arrondir un float : entier le plus proche de \a x
 * @param x Float a arrondir
 * @return Entier le plus proche
 */

int arrondi (float x);

#endif

