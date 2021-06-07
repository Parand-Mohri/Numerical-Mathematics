c = single([1.01,0, - 5.26 , -0.0173,0.839, -1.91]);
x = single(2.39);
n = 3;
r = @(x) rnd(x,n);    
fdirect=@(x) c(1) * x^5 + c(3)*x^3 + c(4) * x^2 + c(5) * x +c(6);
fnested = @(x) (((c(1)*x^2 + c(3))*x + c(4))*x + c(5))*x + c(6);
fdirectrounded = @(x) r(r(r(r(r(c(1) * r(r(r(r(x*x)*x)*x)*x)) + r(c(3) * r(r(x*x)*x))) + r(c(4) * r(x*x)))+ r(c(5) * x)) + c(6));
fnestedrounded = @(x) r(r(r(r(r(r(r(r(r(x*x)*c(1)) + c(3))*x)+c(4))*x)+c(5))*x)+c(6))

%nested and direct calculate the exact answer
%directrounded calculate the answer of direct but rounded
%nestedrounded calculate the answer of nested but rounded
exactAnswer= fdirect(x)
directrounded = fdirectrounded(x)
nestedrounded = fnestedrounded(x)

%i wrote two functions to calculate absoloute and relative errors
%here we calculating the absouloute and relative error of directrounded
absouloutErrorDirect = absoloutError(exactAnswer, directrounded)
relativeErrorDirect = relativeError(exactAnswer, directrounded)

%here we calculate the errors of nested rounded
absouloutErrorNested = absoloutError(exactAnswer, nestedrounded)
relativeErrorNested = relativeError(exactAnswer, nestedrounded)

%as its obviouse from the answers, nested method has much smaller relative and
%absouloute error

