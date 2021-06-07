%i made 3 function for this assignment "SimpsonRule" for calculating integral
% FindCofficent for finding coffitient of fourier series (as and bs) 
% and TriognemetricPlonomyal that make the ending funtion 
f = @(x) cos(2*x) / (3 + 2 * sin(x));

% here i am calculating the function and "as" and "bs" with different coffitients
[as1,bs1] = FindCofficent(1,f)
t1 = TriognemetricPlonomyal(as1,bs1)

[as2,bs2] = FindCofficent(2,f)
t2 = TriognemetricPlonomyal(as2,bs2)

[as3,bs3] = FindCofficent(3,f)
t3 = TriognemetricPlonomyal(as3,bs3)

[as4,bs4] = FindCofficent(4,f)
t4 = TriognemetricPlonomyal(as4,bs4)

[as5,bs5] = FindCofficent(5,f)
t5 = TriognemetricPlonomyal(as5,bs5)

[as6,bs6] = FindCofficent(6,f)
t6 = TriognemetricPlonomyal(as6,bs6)

%Ploting the result plonomyals with k = 1,2,3 
fplot(t1);hold on; fplot(t2); hold on; fplot(t3); hold on;

% calculating the error for all the plonomyals with different coefficent
%as you can see error become smaller as we have bigger k
Error1 = SimpsonRule(30,-pi,pi,@(x) (f(x) - t1(x))^2 ) 
Error2 = SimpsonRule(30,-pi,pi,@(x) (f(x) - t2(x))^2 ) 
Error3 = SimpsonRule(30,-pi,pi,@(x) (f(x) - t3(x))^2 ) 
Error4 = SimpsonRule(30,-pi,pi,@(x) (f(x) - t4(x))^2 ) 
Error5 = SimpsonRule(30,-pi,pi,@(x) (f(x) - t5(x))^2 ) 
Error6 = SimpsonRule(30,-pi,pi,@(x) (f(x) - t6(x))^2 ) 

