xi= [2.5,2.0,3.0,1.5,3.5,1.0,4.0,0.5,4.5,0.0,5.0];
yi=[0.68, 0.66,0.90,0.79,1.31,1.02,1.77,1.30,1.87,1.50,1.33];
yii= [0.70,0.74,0.94,0.79,1.34,1.05,1.78,1.33,1.87, 1.49,1.31];

%this is the table of devide and difference and the cofficient of the Nested form
%(basically the first row of the table without the first column) for (xi, yi)
tableDevideDifferenceYI = DevideDiference(xi,yi)
cofficientNestedFormYI = tableDevideDifferenceYI(1,2:length(tableDevideDifferenceYI))
NestedFormYI = @(x) NestedForm(tableDevideDifferenceYI, x) ;

%here i made two graphs, one from my data and one with the methods of matlab
d = length(xi) -1 ;
cs = polyfit(xi,yi,d);
t = @(x) polyval(cs,x);
fplot(NestedFormYI,[-0.1,5.1]);hold on;fplot(t,[-0.1,5.1]);hold off;

% this is the table of devide and difference and the cofficient of the Nested form 
% for (xi, ~yi)
tableDevideDifferenceYII = DevideDiference(xi,yii)
cofficientNestedFormYII = tableDevideDifferenceYII(1,2:length(tableDevideDifferenceYII))
NestedFormYII = @(x) NestedForm(tableDevideDifferenceYII, x) ;

% with respect ot the 0.04 deviation we can see that the general form of both functions y and ~y are pretty similar
%so we can conclude that even with some noises we can predict the behavior of the real function 

