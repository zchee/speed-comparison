#include <stdio.h>
int a[256];
int main(int argc, char *argv[]){
  FILE *fp;
  int c,n;
  fp = fopen(argv[1],"r");
  while((c = fgetc(fp)) != EOF)
    a[c] += 1;
  printf("   ");
  for(n=0; n < 8; n++)
    printf("%8x",n);
  for(n=0; n < 256; n++){
    if(n%8 == 0)
      printf("\n%02x ",n);
    printf("%8d",a[n]);
  }
}
