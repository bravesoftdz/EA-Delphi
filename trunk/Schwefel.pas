unit Schwefel;

//Schwefel's function

interface

uses math, Definitions;

const
  SCHWMAX = 500;
  SCHWMIN = -500;
  SCHWBEST = -300;

function SchwEvaluate(position: array of double): double;
function GetSchwMax(): double;
function GetSchwMin(): double;
function GetSchwBest(): double;

implementation

function SchwEvaluate(position: array of double): double;
var i: integer;
begin
  result := 0;
  for i := 0 to Length(position)-1 do
    result := result - position[i] * Sin(Sqrt(abs(position[i])));
end;

function GetSchwMax(): double;
begin
  result := SCHWMAX;                             
end;

function GetSchwMin(): double;
begin
  result := SCHWMIN;
end;

function GetSchwBest(): double;
begin
  result := SCHWBEST;
end;

end.

