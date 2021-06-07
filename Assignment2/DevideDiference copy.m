  % Copyright (C) 2021 Parand
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <https://www.gnu.org/licenses/>.

% -*- texinfo -*-
% @deftypefn {} {@var{retval} =} DevideDiference (@var{input1}, @var{input2})
%
%@seealso{}
% @end deftypefn

% Author: Parand <macbook@Parands-MacBook-Pro.local>
% Created: 2021-04-25

function fxx = DevideDiference (input1, input2)
DD = @(i,j, y) (y(i+1) - y(i) )  / (input1(i+j) - input1(i)); 
fxx = NaN(length(input1), length(input1) + 1);
 for i = 1: size(fxx,1)
   fxx(i, 1) = input1(i);
   fxx(i,2) = input2(i);
  end 
  x = size(fxx,1) -1 ;
  p = 3;
  while x ~= 0
    for j = 1 : x
      fxx(j,p ) = DD(j,p-2,fxx(:, p-1));
    end
        x = x-1;
        p =p+1;
  end
  

  
end
