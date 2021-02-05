#include <stdio.h>
#include "sum.h"

int sum(int a, int b); //?

int main(){
    printf("This is makedfile test project\n");
    int test = sum(2, 3);
    printf("%d", test);
    return 0;
}