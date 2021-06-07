%Parand Mohri i6234307 
A = [6.25,0.63,0,0;0.63,3.34,0.47,0;0,0.47,0.54,1.00;0,0,1.0,-1.78];

[eignevalues,eignevectors]  = InversePowerMethod(A,10^-6)
