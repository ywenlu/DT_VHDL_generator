/**
 * @file classresult.c
 * @brief Definition des fonctions declarees dans \a iofile.h
 */


#include "classresult.h"

extern int compt;
extern int N;
extern int profondeur;

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
	tmp->result = 0;
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



void changeseuil(ptr_noeud *node, float value, int f){
	
	float delta,span;
	//printf("avant %f  %f\n",(*node)->min,(*node)->max);
	span = (*node)->max - (*node)->min;
	if ((value - (*node)->min)>((*node)->max - value))
		delta = value - (*node)->min;
	else
		delta = value - (*node)->max;
		delta=delta/(f*span+1);
	
	(*node)->max = (*node)->max + delta;
	(*node)->min = (*node)->min + delta;
	(*node)->b = (*node)->b-delta*((*node)->a);
}

/*
void changenode(ptr_arbre *tree, float value)
{
	changeseuil(&((*tree)->node),15);
}
* */
/*
int validation(ptr_arbre *tree,char *feature[],float * fvalue){
	ptr_feuille leaf; 
	ptr_feuilleagg leafagg;
	ptr_noeud tmpnode;
	//int i=0;
	char label[NB_CHAR]; //label of leaf
	int l;// length of leaf label
	short sens; // left child:1 right child:0
	float tmpvalue; //input feature value
	float tmpdeg;// apparence degree
	ptr_branch tmp_b;
	ptr_feuilleagg tmpleafagg;
	ptr_combiner allleafagg;
	int c1,c2;
	float mindeg; //min degree in one chemin
	float aggc1,aggc2; // max degree of different class
	aggc1=0;
	aggc2=0;
	c1=0;
	c2=0;
	float tmp;
	mindeg=1; //min degree in one chemin. initialized with 1(maximum possible value)
	//allleafagg = (ptr_feuilleagg) malloc (comp*sizeof (feuilleagg));
	
	leaf=(*tree)->leaf; 
	allleafagg=create_combiner (NULL);
	while (leaf != NULL) { // iterate over all leaves
		print_feuille(leaf);
		leafagg=create_feuilleagg (leaf, mindeg);

		strcpy(label,leaf->label);
		l=strlen(label);
		sens=(int)label[l-1]-(int)'0'; 
		label[l-1]='\0';
		feuillepere((*tree)->node,&tmpnode,label);

		while (tmpnode != NULL){ // iterate over nodes:from leaf to root
			//print_noeud(tmpnode);
			tmpvalue=getfvalue(tmpnode,feature,fvalue);
			tmpdeg=appartenance (tmpnode, tmpvalue);
			tmpdeg=(sens==0)?tmpdeg:(1-tmpdeg);
			//printf("tmpdeg=%f\n",tmpdeg);
			tmp_b=create_branch (tmpnode, sens, tmpdeg);
			leafagg->line=add_branch(leafagg->line, tmp_b);
			if ( (leafagg->min) > tmpdeg ){
				leafagg->min = tmpdeg;
				leafagg->minnode = tmpnode;
			}
			//printf("value=%f   mindeg=%f\n",tmpvalue,leafagg->min);
			l=strlen(tmpnode->label);
			sens=(int)label[l-1]-(int)'0'; 
			tmpnode=tmpnode->pere;
		}
		printf("mindeg=%f\n",leafagg->min);
		// fonction récurssive
		leaf=leaf->suiv;
		allleafagg->leafagg=add_feuilleagg (allleafagg->leafagg, leafagg);
	}
	
	tmpleafagg=allleafagg->leafagg;
	while(tmpleafagg!=NULL)
	{
		c1=(tmpleafagg->leaf)->yes;
		c2=(tmpleafagg->leaf)->no;
		//printf("c1=%d  c2=%d\n",c1, c2);
		mindeg=tmpleafagg->min;
		
		if (c1>=c2) {
			//printf("result= 1 yes class");
			if (aggc1<tmpleafagg->min) 
			{
				aggc1=tmpleafagg->min;
				allleafagg->leafc1=tmpleafagg;
			}
		}
		else {
			//printf("result= 2 no class");
			if (aggc2<tmpleafagg->min) 
			{
				aggc2=tmpleafagg->min;
				allleafagg->leafc2=tmpleafagg;
			}
		}
		tmpleafagg=tmpleafagg->suiv;
	}
		
		if(aggc1 >= aggc2) {
			allleafagg->leafc= allleafagg->leafc1;
			allleafagg->result = 1;
			allleafagg->deg=aggc1;
		}
		else {
			allleafagg->leafc= allleafagg->leafc2;
			allleafagg->result = 2;
			allleafagg->deg=aggc2;
		}
		
		
			
			//evalutation and adaptation 
		
		if (fvalue[2]!=allleafagg->result) {//quand mal classé
			
			printf("!!!!!!!!!!!mal classé\n");
					//if(allleafagg->deg<1)
					tmp=getfvalue((allleafagg->leafc)->minnode,feature,fvalue);
					printf("avant: ");
					print_noeud((allleafagg->leafc)->minnode);
					changeseuil(&((allleafagg->leafc)->minnode),tmp);
					printf("apres: ");
					print_noeud((allleafagg->leafc)->minnode);
					//printf("error");
					
			
		}
		return allleafagg->result;
		
}*/
/*
 * void adaption(ptr_combiner *combineres,char *feature[],float * fvalue){
		int v;
		ptr_noeud node;
		//node = ((*combineres)->leafc)->minnode;
		v = getfvalue(node, feature, fvalue);
		//changeseuil(&node,value);
	}
	* */
	/*
ptr_combiner prediction(ptr_arbre tree,char *feature[],float * fvalue){
	ptr_feuille leaf; 
	ptr_feuilleagg leafagg;
	ptr_noeud tmpnode;
	//int i=0;
	char label[NB_CHAR]; //label of leaf
	int l;// length of leaf label
	short sens; // left child:1 right child:0
	float tmpvalue; //input feature value
	float tmpdeg;// apparence degree
	ptr_branch tmp_b;
	ptr_feuilleagg tmpleafagg;
	ptr_combiner allleafagg;
	int c1,c2;
	float mindeg; //min degree in one chemin
	float aggc1,aggc2; // max degree of different class

	aggc1=0;
	aggc2=0;
	c1=0;
	c2=0;
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
		c1=(tmpleafagg->leaf)->yes;
		c2=(tmpleafagg->leaf)->no;
		printf("c1=%d  c2=%d\n",c1, c2);
		mindeg=tmpleafagg->min;
		
		if (c1>=c2) {
			printf("1 yes class");
			if (aggc1<tmpleafagg->min) 
			{
				aggc1=tmpleafagg->min;
				allleafagg->leafc1=tmpleafagg;
			}
		}
		else {
			printf("2 no class");
			if (aggc2<tmpleafagg->min) 
			{
				aggc2=tmpleafagg->min;
				allleafagg->leafc2=tmpleafagg;
			}
		}
		tmpleafagg=tmpleafagg->suiv;
	}
		
		if(aggc1 >= aggc2) {
			allleafagg->leafc= allleafagg->leafc1;
			allleafagg->result = 1;
			allleafagg->deg=aggc1;
		}
		else {
			allleafagg->leafc= allleafagg->leafc2;
			allleafagg->result = 2;
			allleafagg->deg=aggc2;
		}
		
		return allleafagg;
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

void mincompo(ptr_arbre tree,char *label, char *feature[],float * fvalue, char *minlabel, float *min, ptr_noeud *minnode){
	int l=strlen(label);
	int tl;
	char **list_node;
	ptr_noeud tmpnode;
	int sens;
	char tlabel[NB_CHAR];
	float tmpvalue,tmpdeg;
	int i;
	*min=1;
	//printf("#########min %f\n",(*min));
	list_node = malloc((l-1)*sizeof(char*));
	 for(i=0; i<(l-1); i++){
		list_node[i]=malloc(NB_CHAR*sizeof(char));
		memset(list_node[i],0,NB_CHAR);
		strncpy(list_node[i], label, l-i); 
	 }
 
	 
	 for(i=0; i<(l-1); i++){
		 memset(tlabel,0,NB_CHAR);
		 tl=strlen(list_node[i]);
		 sens=(int)(list_node[i])[tl-1]-(int)'0'; 
		 strncpy(tlabel,list_node[i],tl-1);
		 feuillepere (tree->node,&tmpnode,tlabel);
		 //printf("nowlabel=%s\n",tlabel);
		 //printf("node in from leaf  ");
		 //print_noeud(tmpnode);
		 tmpvalue=getfvalue(tmpnode,feature,fvalue);
		 tmpdeg=appartenance (tmpnode, tmpvalue);
		 //printf("tmpdeg=%f  sens=%d\n",tmpdeg,sens);
		 tmpdeg=(sens==0)?tmpdeg:(1-tmpdeg);
		 //printf("tmpvalue= %f  tmpdeg=%f <=  minglobal=%f  hellohappy\n",tmpvalue,tmpdeg,*min);
		 if(tmpdeg<=(*min)){
			 //print_noeud(tmpnode);
			 (*minnode)=tmpnode;
			 *min = tmpdeg;
		     strcpy(minlabel,tlabel);
		 }
	 }
	 //printf("==================min of this leaf %f  \n",*min);
	  for(int i=0; i<(l-1); i++){
		free(list_node[i]);
		}
	  free(list_node);
	  
}

int prediction(ptr_arbre tree,char *feature[],float * fvalue){
	ptr_feuille leaf;
	ptr_feuille cleaf;
	ptr_noeud minnode=tree->node;
	char minlabel[NB_CHAR];
	char maxlabel[NB_CHAR];
	float tmin,max;
	int result=0;
	max=0;
	tmin=1;
	leaf=tree->leaf; 
	profondeur=0;
	while (leaf != NULL) { // iterate over all leaves
		//print_feuille(leaf);
		profondeur = (strlen(leaf->label)>profondeur) ? (strlen(leaf->label)) : profondeur;	
		mincompo(tree, leaf->label, feature, fvalue, minlabel, &tmin, &minnode);
		
		if (tmin>max) {
			//printf("######## %f >=  max=%f\n",tmin, max);
			cleaf=leaf;
			max=tmin;
			strcpy(maxlabel,minlabel);
		}
		leaf=leaf->suiv;	
	}
	
	if (cleaf->yes >= cleaf->no) result =1;
	else result = 2;
	return result;
}

int adaption(ptr_arbre *tree,char *feature[],float * fvalue, int f){
	ptr_feuille leaf;
	ptr_feuille cleaf;
	ptr_noeud minnode=(*tree)->node;
	ptr_noeud selnode;
	char minlabel[NB_CHAR];
	char maxlabel[NB_CHAR];
	float tmin,max,tmp;
	int result=0;
	max=0;
	
	leaf=(*tree)->leaf; 
	profondeur=0;
	while (leaf != NULL) { // iterate over all leaves
		//print_feuille(leaf);
		profondeur = (strlen(leaf->label)>profondeur) ? (strlen(leaf->label)) : profondeur;
		mincompo((*tree), leaf->label, feature, fvalue, minlabel, &tmin, &minnode);
		if (tmin>=max) {
			cleaf=leaf;
			selnode=minnode;
			//printf("hellohappy\n");
			//print_noeud(minnode);
			//printf("hellohappy\n");
			//print_noeud(selnode);
			max=tmin;
			strcpy(maxlabel,minlabel);
		}
		leaf=leaf->suiv;
	}
	if (cleaf->yes >= cleaf->no) result =1;
	else result = 2;
	
	if (fvalue[2]!=result) {//quand mal classé
			
			//printf("!!!!!!!!!!!mal classé\n");
			//print_noeud(selnode);
					//if(allleafagg->deg<1)
					
					tmp=getfvalue(selnode,feature,fvalue);
					//printf("avant: ");
					//print_noeud(selnode);
					changeseuil(&selnode,tmp,f);
					//printf("apres: ");
					//print_noeud(selnode);
		}
	return result;
}

