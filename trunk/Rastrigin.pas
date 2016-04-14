unit Rastrigin;

//Rastrigin's function:

interface

uses math, Definitions;

const
  RASTMAX = 5.12;
  RASTMIN = -5.12;
  RASTBEST = 0.1;

function RastEvaluate(position: array of double): double;
function GetRastMax(): double;
function GetRastMin(): double;
function GetRastBest(): double;

implementation

function RastEvaluate(position: array of double): double;
var i: integer;
begin
  result := 0;
  for i := 0 to Length(position)-1 do
    result := result + (sqr(position[i])- 10*Cos(2 * Pi * position[i]));

  result := result + 10 * (Length(position));
end;

function GetRastMax(): double;
begin
  result := RASTMAX;
end;

function GetRastMin(): double;
begin
  result := RASTMIN;
end;

function GetRastBest(): double;
begin
  result := RASTBEST;
end;

end.

