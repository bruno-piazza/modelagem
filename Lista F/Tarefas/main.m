clc
clear
close

A = [1 0 2; 0 1 1; 0 5 1];
t = linspace(0,20,100);
x0 = [464 ; 4 ; 0]
X = integrador2(A,t,x0)
