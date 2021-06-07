% Copyright (C) 2021 Parand
%
%This program is free software: you can redistribute it and/or modify
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
% @deftypefn {} {@var{retval} =} NestedForm (@var{input1}, @var{input2})
%
% @seealso{}
% @end deftypefn

% Author: Parand <macbook@Parands-MacBook-Pro.local>
% Created: 2021-04-26

function pxx = NestedForm (fxx,x)
  pxx =  fxx(1,columns(fxx)) * (x - fxx(columns(fxx)-2,1))  ;
  j= 1;
  while j ~= rows(fxx) 
    pxx = pxx + fxx(1,columns(fxx) - j);
    if columns(fxx)-2 - j ~= 0
    pxx = pxx * (x - fxx(columns(fxx)-2 - j ,1));
    end
    j = j+1;
  end
end
