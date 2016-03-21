/**
 * @file main.c
 * @brief Programme de génération de fichier vhdl à partir d'un fichier texte,
 *  
 * Génération des fichiers suivants :
 *  
 *  - vhd (architecture d'un arbre de décision)
 *  
 *  - csv (visualiser les éléments de l'arbre sous forme d'un tableau)
 *  
 *  - tex (visualiser l'arbre sous forme graphique, \e pdflatex pour la compilation)
 */

#include <time.h>
#include <sys/time.h>

#include "struct.h"
#include "iofile.h"
#include "component.h"
#include "classresult.h"
/**
 * @var profondeur_max
 * @brief Profondeur maximale d'un arbre
 */

/**
 * @var prof_max_global
 * @brief Profondeur maximale de l'ensemble des fichiers
 */

int profondeur_max = 1;
int prof_max_global = 1;

int compt = 0;
int N=3;
char *feature[]= {"one", "two", "class"};
/**
 * @fn int main (int argc, char** argv) 
 * @brief Programme principal, appeler le programme avec un fichier txt
 * @return Fichiers générés
 */


int main(int argc, char** argv)
{
	// Flux
	FILE * file_txt;
	FILE * file_vad;
	FILE * file_test;
	FILE * file_tex;
	FILE * file_csv;
	FILE * file_vhd;
	FILE * file_result;
	// Nom des fichiers à générer
	char * fichier_txt;
	char * fichier_vad;
	char * fichier_test;
	char * fichier_tex;
	char * fichier_csv;
	char * fichier_vhd;
	// Nom de l'entité VHDL
	char * entity;
	// Stocke une ligne du text
	char chaine[NB_LIGNE];
	// Pointeur sur structure arbre
	ptr_arbre tree;
	// Variable intermédiaire
	int i;
	//int nb_file;
	// Recommencer avec un autre arbre si reset = 1
	int reset;
	// Calcul du temps d'execution
	double start, end;
	struct timeval tmp_time;
	float fvalue[3];
	//float fvalue[]={1.73,6.21,2.00};
	//int result;
	int ind,nb,ares;//indicator of classification 1:right 0:false
	ptr_combiner combineres;
		
	if (argc < 4 ) {
		fprintf(stderr, "ERREUR : syntaxe\n"
				"Usage : ./arbre <fichier_arbre.txt> <fichier_vad.txt> <fichier_test.txt> ...\n");
		exit(EXIT_FAILURE);
	}

	gettimeofday(&tmp_time, NULL);
	start = tmp_time.tv_sec + (tmp_time.tv_usec * 1.0e-6L);

	//nb_file = argc - 1;

	// allocation mémoire
	fichier_txt = (char *) malloc (NB_FILE_NAME * sizeof(char));
	fichier_vad = (char *) malloc (NB_FILE_NAME * sizeof(char));
	fichier_test = (char *) malloc (NB_FILE_NAME * sizeof(char));
	fichier_tex = (char *) malloc (NB_FILE_NAME * sizeof(char));
	fichier_csv = (char *) malloc (NB_FILE_NAME * sizeof(char));
	fichier_vhd = (char *) malloc (NB_FILE_NAME * sizeof(char));
	entity = (char *) malloc (NB_FILE_NAME * sizeof(char));

	// si erreur lors de l'allocation
	if ((!fichier_txt) || (!fichier_test) || (!fichier_tex) || (!fichier_csv) || (!fichier_vhd)) {
		fprintf(stderr, "ERREUR : Mémoire insuffisante\n");
		exit(EXIT_FAILURE);
	}

	// lire tous les fichiers txt dans le répertoire courant
	//for (j = 0; j < nb_file; j++) {
	
		fichier_txt = argv[1];
		fichier_vad = argv[2];
		fichier_test = argv[3];
	
		file_txt = fopen(fichier_txt, "r"); // ouverture du fichier txt
		file_vad = fopen(fichier_vad, "r"); // ouverture du fichier test
		file_test = fopen(fichier_test, "r"); // ouverture du fichier test
		
		if (!file_txt) {
			fprintf(stderr, "ERREUR : Fichier '%s' non trouvé\n", fichier_txt);
			exit(EXIT_FAILURE);
		}
	
		i = 0;

		fichier_tex = strncpy(fichier_tex, " ", NB_FILE_NAME);
		fichier_csv = strncpy(fichier_csv, " ", NB_FILE_NAME);
		fichier_vhd = strncpy(fichier_vhd, " ", NB_FILE_NAME);
	
		while ((fichier_txt[i] != '.') && (fichier_txt[i] != '\0')){
			fichier_tex[i] = fichier_txt[i];
			fichier_csv[i] = fichier_txt[i];
			fichier_vhd[i] = fichier_txt[i];
			entity[i] = fichier_txt[i];
			i++;
		}

		// ajouter l'extension des fichiers à générer
		strncat(fichier_tex, ".tex", 4);
		strncat(fichier_csv, ".csv", 4);
		strncat(fichier_vhd, ".vhd", 4);
	
		// ouverture en mode écriture, écraser les anciens
		file_tex = fopen(fichier_tex, "w+");
		file_csv = fopen(fichier_csv, "w+");
		file_vhd = fopen(fichier_vhd, "w+");
		
		file_result = fopen("result.txt","a");
		
		if ((!file_tex) || (!file_csv) || (!file_vhd)) {
			fprintf(stderr, "ERREUR : Impossible de générer les fichiers\n");
			exit(EXIT_FAILURE);
		}
	
		tree = create_arbre (NULL, NULL); // initialiser un arbre vide

		printf("Création d'arbre: Lecture du fichier '%s' en cours", fichier_txt);
	
		reset = 1;
		do {
			if (!fgets(chaine, NB_LIGNE, file_txt)) {
				break;
			}
			putchar('.');
			if (chaine[0] != '\n') {
				tree = read_ligne(chaine, tree, reset);
			}
			reset = 0;
		} while (!feof(file_txt)); // lecture ligne par ligne du fichier txt
		
		printf("adapter avec fichier '%s' en cours", fichier_vad);
		nb=0;
		i=0;
		
		while(fscanf(file_vad,"%f,%f,%f",&fvalue[0],&fvalue[1],&fvalue[2]) == 3){
			printf("\n =====================input = %f,%f,%f =========================\n",fvalue[0], fvalue[1], fvalue[2]);
			ares=validation(&tree,feature,fvalue);
			ind = (fvalue[2]==ares)?1:0;
			fprintf(file_result,"%f,%f,%f,%d,%d\n",fvalue[0], fvalue[1], fvalue[2],ares, ind);
			nb = nb + ind;
			i++;
		} // lecture ligne par ligne du fichier txt
		if(!feof(file_vad)){
		fprintf(stderr, "ERREUR : Impossible de lire la validation file\n");
		}
		printf("vvvvvvvvvvvvvvvvv  right rate=%f\n",nb/(i*1.0));
		
		/*
		printf("test avec fichier '%s' en cours", fichier_test);
		nb=0;
		i=0;
		while(fscanf(file_test,"%f,%f,%f",&fvalue[0],&fvalue[1],&fvalue[2]) == 3){
			printf("\n =====================input = %f,%f,%f =========================\n",fvalue[0], fvalue[1], fvalue[2]);
			combineres = prediction(tree,feature,fvalue);
			ind = (fvalue[2]==combineres->result)?1:0;
			fprintf(file_result,"%f,%f,%f,%d,%d\n",fvalue[0], fvalue[1], fvalue[2],combineres->result,ind);
			nb = nb + ind;
			i++;
		} // lecture ligne par ligne du fichier txt
		if(!feof(file_test)){
		fprintf(stderr, "ERREUR : Impossible de lire la test file\n");
		}
		printf("vvvvvvvvvvvvvvvvv  right rate=%d/%i==%f\n",nb,i,nb/(i*1.0));
		
		*/
		
		//changenode(&tree);
		
		putchar('\n');
	
		fputs ("label;feature;min;max\n", file_csv);
		write_csv (file_csv, tree->node); // table contenant les données des noeuds
		printf ("Création du fichier '%s' réussie\n", fichier_csv);
		write_vhd (file_vhd, tree, entity); // génerer le code vhdl 
		printf ("Création du fichier '%s' réussie\n", fichier_vhd);
		write_tex (file_tex, tree); // réaliser fichier LaTex de l'arbre
		printf ("Création du fichier '%s' réussie\n", fichier_tex);
		putchar('\n');

		// libérer l'espace mémoire réservé
		tree->leaf = delete_feuille(tree->leaf);
		tree->node = delete_noeud (tree->node);
		
		free(tree);
		if (!tree) {
			fprintf(stderr, "ERREUR : Libération de la mémoire\n");
			exit (EXIT_FAILURE);
		}
		tree = NULL;

		// si erreur lors de la fermeture des fichiers
		if (fclose(file_txt) || fclose(file_test) || fclose(file_tex) || fclose(file_csv) || fclose(file_vhd)) {
			fprintf(stderr, "ERREUR : Fermeture des fichiers\n");
			exit(EXIT_FAILURE);
		}
	//}

	for (i = 0; i < prof_max_global; i++) {
		generate_min(i + 2, entity);
	}
	generate_max(entity);
	generate_mu(entity);
	generate_memory(entity);
	generate_package();
	generate_mux();

	gettimeofday(&tmp_time, NULL);
	end = tmp_time.tv_sec + (tmp_time.tv_usec * 1.0e-6L);	

	// afficher le temps de calcul
	printf ("Temps d'execution' : %f sec\n", end - start);



	return 0;

}
