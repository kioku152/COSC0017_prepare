; 定义常量
@str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@str2 = private unnamed_addr constant [6 x i8] c"error\00", align 1
@str3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1



define void @func(i32* %t, i32* %b, i32* %a, i32* %i) {
entry:  
  ; *t=*b
  %0 = load i32, i32* %b, align 4
  store i32 %0, i32* %t, align 4

  ; *b=*a+*b
  %1 = load i32, i32* %a, align 4
  %2 = load i32, i32* %b, align 4
  %3 = add nsw i32 %1, %2
  store i32 %3, i32* %b, align 4

  ; printf("%d\n",*b);
  %4 = load i32, i32* %b, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str1, i32 0, i32 0), i32 %4)

  ; *a=*t
  %5 = load i32, i32* %t, align 4
  store i32 %5, i32* %a, align 4

  ; *i=*i+1;
  %6 = load i32, i32* %i, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* %i, align 4

  ret void
}



define i32 @main() {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  %t = alloca i32, align 4
  %n = alloca i32, align 4

  ; int c[1]={0}
  %c = alloca [1 x i32], align 4
  %arrayidx = getelementptr inbounds [1 x i32], [1 x i32]* %c, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 4

  ; a=c[0]
  ; b=test
  ; i=test(#define test1)
  %0 = load i32, i32* %arrayidx, align 4
  store i32 %0, i32* %a, align 4
  store i32 1, i32* %b, align 4
  store i32 1, i32* %i, align 4

  ; scanf("%d",&n);
  %call = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str3, i32 0, i32 0), i32* %n)

  ; if(a<0)
  %1 = load i32, i32* %a, align 4
  %cmp1 = icmp slt i32 %1, 0
  br i1 %cmp1, label %if1yes, label %if1no

if1yes:
  ; printf("error")
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str2, i32 0, i32 0))
  br label %if1no

if1no:
  ; if(n<1||n>1000)
  %2 = load i32, i32* %n, align 4
  %cmp2 = icmp slt i32 %2, 1
  %cmp3 = icmp sgt i32 %2, 1000
  %judge = or i1 %cmp2, %cmp3
  br i1 %judge, label %if2yes, label %if2no

if2yes:
  ; printf("error");
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @str2, i32 0, i32 0))
  ret i32 0

if2no:
  ; printf("%d\n",a)
  ; printf("%d\n",b)
  %3 = load i32, i32* %a, align 4
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str1, i32 0, i32 0), i32 %3)
  %4 = load i32, i32* %b, align 4
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str1, i32 0, i32 0), i32 %4)

  br label %while.start

while.start:
  ; while(i<n)
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %n, align 4
  %cmp4 = icmp slt i32 %5, %6
  br i1 %cmp4, label %while.yes, label %while.no

while.yes:
  ; func(&t,&b,&a,&i);
  call void @func(i32* %t, i32* %b, i32* %a, i32* %i)
  br label %while.start

while.no:
  ret i32 0
}


declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)


