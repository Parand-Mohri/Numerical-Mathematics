absoloutErrorFunction = @(p , p1) abs(p1 - p);
f = @(t,y) sin(t) + y - y.^3;
exactValue = -0.6599693029;
stepSize = 0.1;

%add +1 for the value in time 0 
numberOfSteps = (6 / stepSize) + 1;

%creating an array for time steps
for i = 1 : numberOfSteps 
   t(i) =( i *stepSize) - stepSize;
end

AdamBashforth= @(w, t, h,i) w(i) + (1/12) * h * ( 23 * f(t(i),w(i)) - 16 * f(t(i-1) , w(i-1)) + 5 * f(t(i-2),w(i-2)));

RungeKutta = @(wi,ti,h) wi + (1/6)*(ki1(wi,ti,h) + 4 * ki2(wi,ti,h) + ki3(wi,ti,h));
ki1 = @(wi, ti, h) h * f(ti, wi);
ki2 = @(wi, ti, h) h * f(ti + (1/2) * h , wi + (1/2) * ki1(wi,ti,h));
ki3 = @(wi, ti, h) h * f(ti + h, wi - ki1(wi,ti,h) + 2 *ki2(wi,ti,h));

% w is our array with approximitation of y in all the steps
w(1) = 2;
w(2) = RungeKutta(w(1),t(1), stepSize);
w(3) = RungeKutta(w(2), t(2), stepSize);

for j = 4: numberOfSteps
  w(j) = AdamBashforth(w, t, stepSize,j-1);
end

absoloutError = absoloutErrorFunction(exactValue, w(numberOfSteps));
% absouloute error with step size 0.1 is -- > 1.058187862393867e-03
% absolout error with step size 0.05(half) is --> 1.251622983211576e-04
% when we halve the step size the error get smaller that means are calculation get more exact 

%use this to find where the sign is changing
changeSign = find(diff(w>=0),1);

% array of P's for secant method (because we cant have 0 we start at 1)
p(1) = t(changeSign);
p(2) = p(1) + stepSize;

%aaray of f(p) for the secant method 
fp = [w(changeSign), w(changeSign + 1)];
epsilon = 10^-3;

%in this while loop we are using secant method to find the point that y(t) = 0
%here im using mu RungeKutta function to calculate the f(p+1) in each step, 
%for step size im taking the smaller distance between p(i+1) with p(i) or p(i-1) 
%after finding witch one have the shorter distance i use the f of that p and give it as w to RungeKutta
%and for t im giving the p that i choose 
i = 2;
while abs(p(i) - p(i-1)) > epsilon
  p(i+1) = p(i) - ((p(i)-p(i-1))/(fp(i) - fp(i-1) )*fp(i));
  if abs(p(i+1) - p(i)) > abs(p(i+1) - p(i-1))
  fp(i+1) = RungeKutta(fp(i-1),p(i-1), p(i+1) - p(i-1) );
else
  fp(i+1) = RungeKutta(fp(i),p(i), p(i+1) - p(i) );
end
 i =  i + 1; 
endwhile
