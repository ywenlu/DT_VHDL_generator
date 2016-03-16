/**
 * @file classresult.c
 * @brief Definition des fonctions declarees dans \a iofile.h
 */


#include "classresult.h"

extern int compt;
extern int N;

float getfvalue(ptr_noeud node,char *feature[],float *fvalue){
	int i=0;
	float value;

	while(i<N){
		if(strcmp(feature[i],node->feature)==0) break;
		else
		i++;
	}
	if (i==N) fprintf(stderr, "ERREUR : Feature  non trouvé\n");
	else value=fvalue[i];
	return value;
}

float appartenance (ptr_noeud node, float input){
	float great_y,a,b,min,max;
	//float less_y;
	a = node->a;
	b = node->b;
	min = node->min;
	max = node->max;  
	
	if (input<=min) {
		great_y =0;
	}
	else if (input>=max){
		great_y =1;
	}
	else{
		great_y = a * input + b;
	}			
	return great_y;
}

ptr_branch create_branch (ptr_noeud node, short sens, float deg) {
	ptr_branch tmp;

	tmp = (ptr_branch) malloc (sizeof (branch));

	if (tmp == NULL) {
		fprintf (stderr, "ERREUR : Mémoire insuffisante\n");
		exit (EXIT_FAILURE);
	}
	// initialiser les champs
	tmp->node = node;
	tmp->sens = sens; // left: 1 right: 0
	tmp->deg = deg; // degrée d'appartenance
	tmp->suiv = NULL;
	return tmp;
}

ptr_branch add_branch (ptr_branch tete, ptr_branch element) {
	ptr_branch tmp;

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


ptr_feuilleagg create_feuilleagg (ptr_feuille leaf, float min) {
	ptr_feuilleagg tmp;

	tmp = (ptr_feuilleagg) malloc (sizeof (feuilleagg));

	if (tmp == NULL) {
		fprintf (stderr, "ERREUR : Mémoire insuffisante\n");
		exit (EXIT_FAILURE);
	}
	// initialiser les champs
	tmp->leaf = leaf;
	tmp->min = min;
	tmp->minnode = NULL;
	tmp->line = NULL;
	tmp->suiv = NULL;
	return tmp;
}

ptr_feuilleagg add_feuilleagg (ptr_feuilleagg tete, ptr_feuilleagg element) {
	ptr_feuilleagg tmp;

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



ptr_combiner create_combiner (ptr_feuilleagg leafagg) {
	ptr_combiner tmp;
	
	tmp = (ptr_combiner) malloc (sizeof (combiner));
	
	if (tmp == NULL) {
		fprintf (stderr, "ERREUR : Mémoire insuffisante\n");
		exit (EXIT_FAILURE);
	}
	
	tmp->leafagg = leafagg;
	tmp->leafc1 = NULL;
	tmp->leafc2 = NULL;
	
	return tmp;
}

/*
ptr_noeud feuillepere (ptr_noeud tete, char *label){
	if (tete!=NULL)
	{
		printf("%s\n",tete->label);
		if(!strcmp(tete->label,label)) 
			return tete;
	}
	else if (tete==NULL) return NULL;
	feuillepere (tete->fils_g,label);
	feuillepere (tete->fils_d,label);
}
*/

void feuillepere (ptr_noeud tete, ptr_noeud *pere, char *label){
	if (tete==NULL)
		return;
	else {
		if(!strcmp(tete->label,label)) 
			*pere=tete;
	}
	feuillepere (tete->fils_g, pere, label);
	feuillepere (tete->fils_d, pere, label);
}

void changeseuil(ptr_noeud *node, float value){
	float delta,f;
	f = (*node)->max - (*node)->min;
	if ((value - (*node)->min)>((*node)->max - value))
		delta = value - (*node)->min;
	else
		delta = value- (*node)->max;
	delta=delta/((100.0)*f+1);
	(*node)->max = (*node)->max + delta;
	(*node)->min = (*node)->min + delta;
	(*node)->b = (*node)->b-delta*((*node)->a);
}


int validation(ptr_arbre tree,char *feature[],float * fvalue){
	ptr_feuille leaf; 
	ptr_feuilleagg leafagg;
	ptr_noeud tmpnode;
	//int i=0;
	char label[NB_CHAR]; //label of leaf
	int l;// length of leaf label
	short sens; // left child:1 right child:0
	float tmpvalue; //input feature value
	float tmpdeg;// apparence degree
	int ind,result=0;
	ptr_branch tmp_b;
	ptr_feuilleagg tmpleafagg;
	ptr_combiner allleafagg;
	int c1,c2,sum;
	float mindeg,aggc1,aggc2;
	aggc1=0;
	aggc2=0;
	mindeg=1; //min degree in one chemin. initialized with 1(maximum possible value)
	//allleafagg = (ptr_feuilleagg) malloc (comp*sizeof (feuilleagg));
	
	leaf=tree->leaf; 
	allleafagg=create_combiner (NULL);
	while (leaf != NULL) { // iterate over all leaves
		print_feuille(leaf);
		leafagg=create_feuilleagg (leaf, mindeg);

		strcpy(label,leaf->label);
		l=strlen(label);
		sens=(int)label[l-1]-(int)'0'; 
		label[l-1]='\0';
		feuillepere(tree->node,&tmpnode,label);

		while (tmpnode != NULL){ // iterate over nodes:from leaf to root
			print_noeud(tmpnode);
			tmpvalue=getfvalue(tmpnode,feature,fvalue);
			tmpdeg=appartenance (tmpnode, tmpvalue);
			tmpdeg=(sens==0)?tmpdeg:(1-tmpdeg);
			printf("tmpdeg=%f\n",tmpdeg);
			tmp_b=create_branch (tmpnode, sens, tmpdeg);
			leafagg->line=add_branch(leafagg->line, tmp_b);
			if ( (leafagg->min) > tmpdeg ){
				leafagg->min = tmpdeg;
				leafagg->minnode = tmpnode;
			}
			printf("value=%f   mindeg=%f\n",tmpvalue,leafagg->min);
			l=strlen(tmpnode->label);
			sens=(int)label[l-1]-(int)'0'; 
			tmpnode=tmpnode->pere;
		}
		
		// fonction récurssive
		leaf=leaf->suiv;
		allleafagg->leafagg=add_feuilleagg (allleafagg->leafagg, leafagg);
	}
	
	tmpleafagg=allleafagg->leafagg;
	while(tmpleafagg!=NULL)
	{
		c1=(tmpleafagg->leaf)->class1;
		c2=(tmpleafagg->leaf)->class2;
		printf("c1=%d  c2=%d\n",c1, c2);
		mindeg=tmpleafagg->min;
		sum=c1+c2;
		if ((c1*mindeg)/sum>aggc1) {
			aggc1=(c1*mindeg)/sum;
			allleafagg->leafc1=tmpleafagg;
		}
		if ((c2*mindeg)/sum>aggc2) {
			aggc2=(c2*mindeg)/sum;
			allleafagg->leafc2=tmpleafagg;
		}
		
		tmpleafagg=tmpleafagg->suiv;
	}
		
		if(aggc1 >= aggc2) 
			result = 1;
		else result = 2;
			
			//evalutation and adaptation 
		
		if (fvalue[3]!=result) {//quand mal classé
			//printf("mal classé:%d\n",i++);
			switch (result){
				case 1:
					tmpleafagg=allleafagg->leafc1;
					if(tmpleafagg->min<1)
					changeseuil(&(tmpleafagg->minnode),getfvalue(tmpleafagg->minnode,feature,fvalue));
					break;
				case 2:
					tmpleafagg=allleafagg->leafc2;
					if(tmpleafagg->min<1)
					changeseuil(&(tmpleafagg->minnode),getfvalue(tmpleafagg->minnode,feature,fvalue));
					break;
				default:
				printf("error");
				
			}
			
		}
		
		if (fvalue[3]!=result)
		ind=1;
		else
		ind=0;
		return ind;
}
	
int prediction(ptr_arbre tree,char *feature[],float * fvalue){
	ptr_feuille leaf; 
	ptr_feuilleagg leafagg;
	ptr_noeud tmpnode;
	//int i=0;
	char label[NB_CHAR]; //label of leaf
	int l;// length of leaf label
	short sens; // left child:1 right child:0
	float tmpvalue; //input feature value
	float tmpdeg;// apparence degree
	int ind,result=0;
	ptr_branch tmp_b;
	ptr_feuilleagg tmpleafagg;
	ptr_combiner allleafagg;
	int c1,c2,sum;
	float mindeg,aggc1,aggc2;
	aggc1=0;
	aggc2=0;

	mindeg=1; //min degree in one chemin. initialized with 1(maximum possible value)
	//allleafagg = (ptr_feuilleagg) malloc (comp*sizeof (feuilleagg));
	
	leaf=tree->leaf; 
	allleafagg=create_combiner (NULL);
	while (leaf != NULL) { // iterate over all leaves
		print_feuille(leaf);
		leafagg=create_feuilleagg (leaf, mindeg);

		strcpy(label,leaf->label);
		l=strlen(label);
		sens=(int)label[l-1]-(int)'0'; 
		label[l-1]='\0';
		feuillepere(tree->node,&tmpnode,label);

		while (tmpnode != NULL){ // iterate over nodes:from leaf to root
			print_noeud(tmpnode);
			tmpvalue=getfvalue(tmpnode,feature,fvalue);
			tmpdeg=appartenance (tmpnode, tmpvalue);
			tmpdeg=(sens==0)?tmpdeg:(1-tmpdeg);
			printf("tmpdeg=%f\n",tmpdeg);
			tmp_b=create_branch (tmpnode, sens, tmpdeg);
			leafagg->line=add_branch(leafagg->line, tmp_b);
			if ( (leafagg->min) > tmpdeg ){
				leafagg->min = tmpdeg;
				leafagg->minnode = tmpnode;
			}
			printf("value=%f   mindeg=%f\n",tmpvalue,leafagg->min);
			l=strlen(tmpnode->label);
			sens=(int)label[l-1]-(int)'0'; 
			tmpnode=tmpnode->pere;
		}
		
		// fonction récurssive
		leaf=leaf->suiv;
		allleafagg->leafagg=add_feuilleagg (allleafagg->leafagg, leafagg);
	}
	
	tmpleafagg=allleafagg->leafagg;
	while(tmpleafagg!=NULL)
	{
		c1=(tmpleafagg->leaf)->class1;
		c2=(tmpleafagg->leaf)->class2;

		printf("c1=%d  c2=%d\n",c1, c2);
		mindeg=tmpleafagg->min;
		sum=c1+c2;
		if ((c1*mindeg)/sum>aggc1) {
			aggc1=(c1*mindeg)/sum;
			allleafagg->leafc1=tmpleafagg;
		}
		if ((c2*mindeg)/sum>aggc2) {
			aggc2=(c2*mindeg)/sum;
			allleafagg->leafc2=tmpleafagg;
		}
		
		tmpleafagg=tmpleafagg->suiv;
	}
		
		if(aggc1 >= aggc2) 
			result = 1;
		else result = 2;
			
			//evalutation and adaptation 
		
		
		if (fvalue[3]!=result)
		ind=1;
		else
		ind=0;
		return ind;
}
	


