#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NB_CHAR 32
void main(){
 char label[]="100";
 int nb_node=10;
 int l  = strlen(label);
 char **list_node;
 char tlabel[NB_CHAR];
 int tl;
 list_node = malloc((l-1)*sizeof(char*));
 for(int i=0; i<(l-1); i++){
	list_node[i]=malloc(NB_CHAR*sizeof(char));
	strncpy(list_node[i], label, l-i); 
 }
 printf("label=%s\n",label);
 for(int i=0; i<(l-1); i++){
	printf("node[%d]=%s\n",i,list_node[i]);
 }
 for(int i=0; i<(l-1); i++){
	 memset(tlabel,0,NB_CHAR);
	tl=strlen(list_node[i]);
	strncpy(tlabel,list_node[i],tl-1);
	printf("%s\n",tlabel);
 }
 
 
 for(int i=0; i<(l-1); i++){
	free(list_node[i]);
 }
 free(list_node);
 
}
