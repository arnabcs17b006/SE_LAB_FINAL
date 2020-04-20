#include<stdio.h>
int main(){
 int a[10];
int newVar;
newVar=a[0];
a[0]=newVar;
 a[0]=0;

 a[11]=6;

 printf("hello\n");

 return 0;

}