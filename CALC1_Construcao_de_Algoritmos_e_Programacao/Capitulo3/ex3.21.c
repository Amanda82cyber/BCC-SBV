#include <stdio.h>
#include <stdlib.h>

int main() {
    int altura;

    printf("Altura: ");
    scanf("%d", &altura);

    if(altura > 0){
        for(int i = altura; i > 0; i--){
            for(int j = 0; j < (i-1); j++){
                printf(" ");
            }

            for(int k = altura; k >= i; k--){
                printf("*");
            }

            for(int l = i; l < altura; l++){
                printf("*");
            }

            printf("\n");
        }
    }else if(altura < 0){
        for(int i = 0; i > altura; i--){
            for(int j = 0; j > i; j--){
                printf(" ");
            }

            for(int k = i; k > altura; k--){
                printf("*");
            }

            for(int l = altura; l < (i-1); l++){
                printf("*");
            }

            printf("\n");
        }
    }

    return 0;
}
