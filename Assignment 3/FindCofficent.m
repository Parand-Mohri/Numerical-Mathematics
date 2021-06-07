function   [as,bs] = FindCofficent (degree, f)
ak = @(k) (1 / pi)  * (SimpsonRule(30, -pi, pi, @(x) f(x) * cos(k *x))) ;
bk = @(k) (1 / pi)  * (SimpsonRule(30, -pi, pi, @(x) f(x) * sin(k *x))) ;
for i = 0 : degree
  as(i + 1) = ak(i);
  if i > 0
    bs(i) = bk(i);
  end
end

end
