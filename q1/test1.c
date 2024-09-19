#include<stdio.h>

#define test 1

void FB(int *t,int *b,int *a,int *i){
    *t=*b;
    *b=*a+*b;
    printf("%d\n",*b);
    *a=*t;
    *i=*i+1;
    return;
}


int main(){
    int a,b,i,t,n;

    a=0;
    b=test;
    i=test;

    scanf("%d",&n);
    printf("%d\n",a);
    printf("%d\n",b);

    if(a<0)
        printf("error");

    while(i<n)
    {
        // t=b;
        // b=a+b;
        // printf("%d\n",b);
        // a=t;
        // i=i+1;
        FB(&t,&b,&a,&i);
    }

}

