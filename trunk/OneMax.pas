unit OneMax;

//origin function: 0 at origin, uses euclidean distance equation
//fitness at a given position is = sqrt(a2+b2+c2+d2....n2)

interface

uses math, Definitions;

function OMaxEvaluate(position: array of integer) : double;

implementation

function OMaxEvaluate(position: array of integer): double;
var i: integer;
begin
  result := 0;
  for i := 0 to Length(position)-1 do
    if position[i] = 1 then
      result := result + 1;

  result := 1 - (result / Length(position)); //gives a decimal between 0 and 1, 1 being the highest
end;


end.
