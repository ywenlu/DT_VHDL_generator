/**
 * @file component.h
 * @brief Liste des composants nécessaires à la réalisation d'un fichier vhd
 *  
 * Liste des composants :
 *  
 * Entité principale correspondante au nom du fichier
 *  
 *  - Mémoire
 *  
 *  - IP fonction d'appartenance
 *  
 *  - Comparateur min et max
 *  
 *  - Signaux internes
 */


#ifndef COMPONENT_H
#define COMPONENT_H

#include "struct.h"

/**
 * @def NB_BIT
 * @brief Nombre de bits pour les bus
 */

#define NB_BIT 16


/**
 * @fn void vhdl_emotion (FILE * file, char * entity)
 * @brief Réalisation d'une architecture pour l'entité
 * @param file Flux de sortie
 * @param entity Nom de l'entité
 */

void vhdl_emotion (FILE * file, char * entity);

/**
 * @fn void vhdl_memory (FILE * file)
 * @brief Ecrire le code de \e component \e memory dans le fichier vhd
 * @param file Flux de sortie
 */

void vhdl_memory (FILE * file, char * entity);

/**
 * @fn void vhdl_comp_min (FILE * file, ptr_feuille leaf)
 * @brief Ecrire le code de \e component \e comp_min dans le fichier vhd
 * @param file Flux de sortie
 * @param leaf Liste des feuilles
 */

void vhdl_comp_min (FILE * file, ptr_feuille leaf, char * entity);

/**
 * @fn void vhdl_comp_max (FILE * file, ptr_feuille leaf)
 * @brief Ecrire le code de \e component \e comp_max dans le fichier vhd
 * @param file Flux de sortie
 * @param leaf Liste des feuilles
 */

void vhdl_comp_max (FILE * file, char * entity);

/**
 * @fn void vhdl_mu_A (FILE * file)
 * @brief Ecrire le code de \e component \e essai_vhdl dans le fichier vhd
 * @param file Flux de sortie
 */

void vhdl_mu_A (FILE * file, char * entity);

/**
 * @fn void vhdl_signal (FILE * file, ptr_arbre tree)
 * @brief Liste des signaux nécessaires
 * @param file Flux de sortie
 * @param tree Pointeur sur l'arbre
 */

void vhdl_signal (FILE * file, ptr_arbre tree);

/**
 * @fn void vhdl_signal_node (FILE * file, ptr_noeud node)
 * @brief Générer les signaux pour connecter les composants
 * @param file Flux de sortie
 * @param node Pointeur sur noeud
 */

void vhdl_signal_node (FILE * file, ptr_noeud node);

/**
 * @fn void vhdl_signal_taux (FILE * file, ptr_noeud node)
 * @brief Générer les signaux pour connecter les composants
 * @param file Flux de sortie
 * @param node Pointeur sur noeud
 */

void vhdl_signal_taux (FILE * file, ptr_arbre tree);

/**
 * @fn void vhdl_inst_memory (FILE * file)
 * @brief Ecrire une instance de \e memory
 * @param file Flux de sortie
 */

void vhdl_inst_memory (FILE * file, char * entity);

/**
 * @fn void vhdl_inst_mu_A(FILE * file, ptr_noeud node)
 * @brief Ecrire une instance de \e essai_vhdl
 * @param file Flux de sortie
 * @param node Pointeur sur noeud
 */

void vhdl_inst_mu_A(FILE * file, ptr_noeud node, char * entity);

/**
 * @fn void vhdl_inst_comp_min (FILE * file, ptr_feuille leaf)
 * @brief Ecrire une instance de \e comp_min
 * @param file Flux de sortie
 * @param leaf Pointeur sur feuille
 */

void vhdl_inst_comp_min (FILE * file, ptr_feuille leaf, char * entity);

/**
 * @fn void vhdl_inst_comp_max (FILE * file, ptr_feuille leaf)
 * @brief Ecrire une instance de \e comp_max
 * @param file Flux de sortie
 * @param leaf Pointeur sur feuille
 */

void vhdl_inst_comp_max (FILE * file, char * entity);


/**
 * @fn void generate_min(int nb_entree)
 * @brief Générer le fichier \a comp_min.vhd
 * @param nb_entree Nombre d'entrée du comparateur
 */

void generate_min(int nb_entree, char * entity);

/**
 * @fn void generate_max(int nb_entree)
 * @brief Générer le fichier \a comp_max.vhd
 * @param nb_entree Nombre d'entrée du comparateur
 */

void generate_max(char * entity);

/**
 * @fn void generate_mux()
 * @brief Générer le fichier \a mux_1to2.vhd
 * @param nb_entree Nombre d'entrée du comparateur
 */

void generate_mux(void);

/**
 * @fn void generate_mu(void)
 * @brief Générer le fichier mu_A.vhd
 */

void generate_mu(char * entity);

/**
 * @fn void generate_memory(void)
 * @brief Générer le fichier memory.vhd
 */

void generate_memory(char * entity);

/**
 * @fn void generate_package(void)
 * @brief Générer le fichier ADF.vhd contient la definition de TAB
 */

void generate_package(void);
#endif
