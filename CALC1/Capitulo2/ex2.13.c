#include <stdio.h>
#include <stdlib.h>

int main() {
    float av1;
    float av2;
    float avOptativa;
    float media;

    printf("Nota Av. 1: ");
    scanf("%f", &av1);

    printf("Nota Av. 2: ");
    scanf("%f", &av2);

    printf("Nota Optativa: ");
    scanf("%f", &avOptativa);

    if(avOptativa > 0){
        if(av1 < av2){
            if(avOptativa > av1){
                av1 = avOptativa;
            }
        }else{
            if(avOptativa > av2){
                av2 = avOptativa;
            }
        }
    }

    media = (av1+av2)/2;

    printf("Media: %.2f \n", media);

    if(media >= 6){
        printf("Aprovado!");
    }else if(4 <= media && media < 6){
        printf("Exame.");
    }else{
        printf("Reprovado...");
    }


    return 0;
}
