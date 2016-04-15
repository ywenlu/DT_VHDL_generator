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
int N=5;
int nb_node=0;
int nb_leaf=0;
int profondeur=0;
char *feature[]= {"one", "two", "three","four","class"};
/**
 * @fn int main (int argc, char** argv) 
 * @brief Programme principal, appeler le programme avec un fichier txt
 * @return Fichiers générés
 */


int main(int argc, char** argv)
{	// Flux
	FILE * file_txt;
	FILE * file_ada;
	FILE * file_test;
	FILE * file_tex;
	//FILE * file_csv;
	//FILE * file_vhd;
	FILE * file_result;
	FILE * file_accu;
	// Nom des fichiers à générer
	char * fichier_txt;
	char * fichier_ada;
	char * fichier_test;
	char * fichier_tex;
	char * fichier_accu;
	//char * fichier_csv;
	//char * fichier_vhd;
	// Nom de l'entité VHDL
	//char * entity;
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
	//float fvalue[]={4.750000,2.110000,1.000000};
	int ind,result,nb;
	float accua, accut;
	int f; //adaptation coefficient
	//int ind,nb,ares;//indicator of classification 1:right 0:false
	/*
	if (argc < 3 ) {
		fprintf(stderr, "ERREUR : syntaxe\n"
				"Usage : ./arbre <fichier_arbre.txt> <fichier_ada.txt> <fichier_test.txt> ...\n");
		exit(EXIT_FAILURE);
	}
*/
	gettimeofday(&tmp_time, NULL);
	start = tmp_time.tv_sec + (tmp_time.tv_usec * 1.0e-6L);

	//nb_file = argc - 1;

	// allocation mémoire
	fichier_txt = (char *) malloc (NB_FILE_NAME * sizeof(char));
	fichier_ada = (char *) malloc (NB_FILE_NAME * sizeof(char));
	fichier_test = (char *) malloc (NB_FILE_NAME * sizeof(char));
	fichier_tex = (char *) malloc (NB_FILE_NAME * sizeof(char));
	fichier_accu = (char *) malloc (NB_FILE_NAME * sizeof(char));
	//fichier_csv = (char *) malloc (NB_FILE_NAME * sizeof(char));
	//fichier_vhd = (char *) malloc (NB_FILE_NAME * sizeof(char));
	//entity = (char *) malloc (NB_FILE_NAME * sizeof(char));

	// si erreur lors de l'allocation
	/*
	if ((!fichier_txt)  || (!fichier_tex) || (!fichier_csv) || (!fichier_vhd)) {
		fprintf(stderr, "ERREUR : Mémoire insuffisante\n");
		exit(EXIT_FAILURE);
	}
	*/
	// lire tous les fichiers txt dans le répertoire courant
	//for (j = 0; j < nb_file; j++) {
	
		fichier_txt = argv[1];
		fichier_ada = argv[2];
		fichier_test = argv[3];
		f=atoi(argv[4]);
		fichier_accu= argv[5];
		//printf("f========%d  %s  %s\n",f,argv[3],argv[4]);
		file_txt = fopen(fichier_txt, "r"); // ouverture du fichier txt
		file_ada = fopen(fichier_ada, "r"); // ouverture du fichier test
		file_test = fopen(fichier_test, "r"); // ouverture du fichier test
		
		if (!file_txt) {
			fprintf(stderr, "ERREUR : Fichier '%s' non trouvé\n", fichier_txt);
			exit(EXIT_FAILURE);
		}
	
		i = 0;

		fichier_tex = strncpy(fichier_tex, " ", NB_FILE_NAME);
		//fichier_csv = strncpy(fichier_csv, " ", NB_FILE_NAME);
		//fichier_vhd = strncpy(fichier_vhd, " ", NB_FILE_NAME);
	
		while ((fichier_txt[i] != '.') && (fichier_txt[i] != '\0')){
			fichier_tex[i] = fichier_txt[i];
			//fichier_csv[i] = fichier_txt[i];
			//fichier_vhd[i] = fichier_txt[i];
			//entity[i] = fichier_txt[i];
			i++;
		}

		// ajouter l'extension des fichiers à générer
		strncat(fichier_tex, ".tex", 4);
		//strncat(fichier_csv, ".csv", 4);
		//strncat(fichier_vhd, ".vhd", 4);
	
		// ouverture en mode écriture, écraser les anciens
		file_tex = fopen(fichier_tex, "w+");
		//file_csv = fopen(fichier_csv, "w+");
		//file_vhd = fopen(fichier_vhd, "w+");
		
		file_result = fopen("result.txt","a");
		file_accu = fopen(fichier_accu,"a");
		/*
		if ((!file_tex) || (!file_csv) || (!file_vhd)) {
			fprintf(stderr, "ERREUR : Impossible de générer les fichiers\n");
			exit(EXIT_FAILURE);
		}
		*/
		tree = create_arbre (NULL, NULL); // initialiser un arbre vide

		printf("Création d'arbre: Lecture du fichier '%s' en cours\n", fichier_txt);
	
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
		printf("nbnode %d\n",nb_node);
		printf("nbleaf %d\n",nb_leaf);
		
		
		printf("adapter avec fichier '%s' en cours\n", fichier_ada);
		nb=0;
		i=0;
		
		while(fscanf(file_ada,"%f,%f,%f,%f,%f",&fvalue[0],&fvalue[1],&fvalue[2],&fvalue[3],&fvalue[4]) == 5){
			//printf("\n =====================input = %f,%f,%f =========================\n",fvalue[0], fvalue[1], fvalue[2]);
			result=adaption(&tree,feature,fvalue,f);
			ind = (fvalue[4]==result)?1:0;
			fprintf(file_result,"%f,%f,%f,%d,%d\n",fvalue[0], fvalue[1], fvalue[2],result,ind);
			nb = nb + ind;
			i++;
		} // lecture ligne par ligne du fichier txt
		if(!feof(file_ada)){
		fprintf(stderr, "ERREUR : Impossible de lire la adaptation file\n");
		}
		accua=nb/(i*1.0);
		printf("accuracyadap=%f\n",accua);
		
		
		printf("test avec fichier '%s' en cours\n", fichier_test);
		nb=0;
		i=0;
		while(fscanf(file_test,"%f,%f,%f,%f,%f",&fvalue[0],&fvalue[1],&fvalue[2],&fvalue[3],&fvalue[4]) == 5){
			//printf("\n =====================input = %f,%f,%f =========================\n",fvalue[0], fvalue[1], fvalue[2]);
			result = prediction(tree,feature,fvalue);
			ind = (fvalue[4]==result)?1:0;
			fprintf(file_result,"%f,%f,%f,%d,%d\n",fvalue[0], fvalue[1], fvalue[2],result,ind);
			nb = nb + ind;
			i++;
		} // lecture ligne par ligne du fichier txt
		if(!feof(file_test)){
		fprintf(stderr, "ERREUR : Impossible de lire la test file\n");
		}
		accut=nb/(i*1.0);
		printf("accuracytest=%f\n",accut);
		
		fprintf(file_accu,"%d,%d,%d,%d,%f,%f\n",f, profondeur, nb_node, nb_leaf, accua, accut);
		
		
		//result = prediction(tree,feature,fvalue);
		//printf("\nprediction result=%d\n",result);
		
		putchar('\n');
		/*
		fputs ("label;feature;min;max\n", file_csv);
		write_csv (file_csv, tree->node); // table contenant les données des noeuds
		printf ("Création du fichier '%s' réussie\n", fichier_csv);
		write_vhd (file_vhd, tree, entity); // génerer le code vhdl 
		printf ("Création du fichier '%s' réussie\n", fichier_vhd);*/
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
		/*
		if (fclose(file_txt)  || fclose(file_tex) || fclose(file_csv) || fclose(file_vhd)) {
			fprintf(stderr, "ERREUR : Fermeture des fichiers\n");
			exit(EXIT_FAILURE);
		}*/
	//}
/*
	for (i = 0; i < prof_max_global; i++) {
		generate_min(i + 2, entity);
	}
	generate_max(entity);
	generate_mu(entity);
	generate_memory(entity);
	generate_package();
	generate_mux();
*/
	gettimeofday(&tmp_time, NULL);
	end = tmp_time.tv_sec + (tmp_time.tv_usec * 1.0e-6L);	

	// afficher le temps de calcul
	printf ("Temps d'execution' : %f sec\n", end - start);



	return 0;

}
