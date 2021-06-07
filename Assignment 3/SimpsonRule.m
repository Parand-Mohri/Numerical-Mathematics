function x = SimpsonRule (n, a, b, f)
  h = (b - a ) / n;
  p = 2; 
  x = f(a) + f(b);
  a = a + h;
  b = b - h;
  while a <= b 
    if(mod(p,2) == 0)
    x = x + 4 * f(a);
  else
    x = x + 2 * f(a);
    end
   p = p +1;
    a = a + h;
  end
  x  = x *  (h / 3);
end
