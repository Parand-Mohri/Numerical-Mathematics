function s = TriognemetricPlonomyal (as, bs)
s = @(x) as(1) /2 ;
for i = 1 : length(bs)
  s = @(x) s(x) + as(i+1) * cos(i * x);
  s = @(x) s(x) + bs(i) * sin( i * x);
end

end
