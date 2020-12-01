//This Source file is written by Nikita Rath (18BLC1131)
clear;
exec("F:\APP MAIN\Scilab\Ex_9_8_lru.sci")
exec("F:\APP MAIN\Scilab\Ex_9_8_fifo.sci")
exec("F:\APP MAIN\Scilab\Ex_9_8_optimal.sci")
clc;

//MAIN: (Given Conditions)
printf("\n Given Page Reference String :\n \t")
n = 20
a = [1 2 3 4 2 1 5 6 2 1 2 3 7 6 3 2 1 2 3 6]
for i = 1:n
    printf("%d ",a(i)) 
end

printf("\n\n  1) LRU replacement :\n\n")
lru(a,n)

printf("\n  2) FIFO replacement :\n\n")
fifo(a,n)

printf("\n  3) Optimal replacement :\n\n")
op(a,n)
