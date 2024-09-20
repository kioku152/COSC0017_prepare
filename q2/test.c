#include<stdio.h>

#define test 1

void func(int *t,int *b,int *a,int *i){
    *t=*b;
    *b=*a+*b;
    printf("%d\n",*b);
    *a=*t;
    *i=*i+1;
    return;
}


int main(){
    int a,b,i,t,n;
    int c[1]={0};

    a=c[0];
    b=test;
    i=test;

    scanf("%d",&n);
    if(a<0)
        printf("error");
    if(n<1||n>1000)
        {
            printf("error");
            return 0;
        }


    printf("%d\n",a);
    printf("%d\n",b);


    while(i<n)
    {
        func(&t,&b,&a,&i);
    }

    return 0;

}

