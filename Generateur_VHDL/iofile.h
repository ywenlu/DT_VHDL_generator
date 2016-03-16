/**
 * @file iofile.h
 * @brief Contient les fonctions sur la lecture et l'écriture des différents fichiers
 */

#ifndef IOFILE_H
#define IOFILE_H

#include "struct.h"

/**
 * @fn ptr_arbre read_ligne (char * ligne, ptr_arbre tree, int reset)
 * @brief Décode une ligne entière, récupérer les informations sur les noeuds, feuilles...
 *  
 * La ligne est décodée de manière spécifique, uniquement pour ce genre de fichier txt
 *  
 * @param ligne Une ligne du fichier
 * @param tree Arbre initial
 * @param reset Construire un nouvel arbre si \a reset vaut 1
 * @return Arbre construit
 */

ptr_arbre read_ligne (char * ligne, ptr_arbre tree, int reset);

/**
 * @fn void print_noeud (ptr_noeud node)
 * @brief Afficher la valeur des champs d'un noeud
 * @param node Pointeur sur un noeud
 */

void print_noeud (ptr_noeud node);

/**
 * @fn print_feuille (ptr_feuille leaf)
 * @brief Afficher la valeur des champs d'une feuille
 * @param leaf Pointeur sur une feuille
 */

void print_feuille (ptr_feuille leaf);

/**
 * @fn write_csv (FILE * file, ptr_noeud node)
 * @brief Réaliser le fichier csv (tableau des valeurs des noeuds)
 * @param file Flux de sortie (format csv)
 * @param node la liste des noeuds
 */

void write_csv (FILE * file, ptr_noeud node);

/**
 * @fn void write_vhd (FILE * file, ptr_arbre tree, char * entity)
 * @brief Ecrire dans un fichier vhd l'arbre de décision 
 * 
 * Les composants nécessaires sont dans le fichier \e component.h
 * 
 * @param file Flux de sortie (format vhd)
 * @param tree Pointeur sur l'arbre
 * @param entity Nom de l'entité à réaliser
 */

void write_vhd (FILE * file, ptr_arbre tree, char * entity);

/**
 * @fn void write_tex (FILE * file, ptr_arbre tree)
 * @brief Réaliser l'arbre sous forme graphique
 *  
 * Nécessite du package \e tikz
 *  
 * Compiler avec \e pdflatex pour obtenir un format pdf
 *  
 * @param file Flux de sortie (format tex)
 * @param tree Pointeur sur l'arbre
 */

void write_tex (FILE * file, ptr_arbre tree);

#endif
