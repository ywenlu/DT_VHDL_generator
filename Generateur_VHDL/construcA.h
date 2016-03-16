/**
 * @file construcA.h
 * @brief Contient des fonctions pour réaliser le fichier tex
 */

#ifndef CONSTRUCTA_H
#define CONSTRUCTA_H


#include "struct.h"

/**
 * @def DECAL_X
 * @brief Taille d'un noeud (longueur)
 */

#define DECAL_X 3

/**
 * @def DECAL_Y
 * @brief Taille d'un noeud (largeur)
 */

#define DECAL_Y -2

/**
 * @fn void tex_entete (FILE * file)
 * @brief Ecrire l'entête du fichier
 * @param file Flux de sortie
 */

void tex_entete (FILE * file);

/**
 * @fn void tex_style (FILE * file)
 * @brief Modifier le style de la page
 * @param file Flux de sortie
 */

void tex_style (FILE * file);

/**
 * @fn void tex_picture(FILE * file, ptr_noeud node, ptr_feuille leaf)
 * @brief Ecrire l'environnement \e tikzpicture
 * @param file Flux de sortie
 * @param node Pointeur sur noeud
 * @param leaf Pointeur sur feuille
 */

void	tex_picture(FILE * file, ptr_noeud node, ptr_feuille leaf);

/**
 * @fn ptr_feuille tex_noeud (FILE * file, ptr_noeud node, ptr_feuille leaf, int reset)
 * @brief Ecrire les noeuds dans le fichier tex
 * @param file Flus de sortie
 * @param node Pointeur sur noeud
 * @param leaf Pointeur sur feuille
 * @param reset Recommencer un nouvel arbre si \a reset = 1
 * @return Liste des feuilles
 */

ptr_feuille tex_noeud (FILE * file, ptr_noeud node, ptr_feuille leaf, int reset);

#endif

