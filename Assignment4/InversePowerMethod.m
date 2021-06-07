function [x,lemda] = InversePowerMethod (A,accurecy )
x = eye(length(A));
for i = 1 : length(A)
    mu(i) = A(i,i);
end
for j = 1: length(A)
t = inv(A - eye(length(A)) * mu(j) ); 
lemda(j) = mu(j);
x0 = x(:,j);
error = 1;
while error > accurecy
y = t * x(:,j);
x(:,j) = y / norm(y,inf);
lemda(j) = max(A*x(:,j));
error = max(A*x0) - max(A * x(:,j) );
x0 = x;
end
end

end
