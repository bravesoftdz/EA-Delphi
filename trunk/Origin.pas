unit Origin;

//origin function: 0 at origin, uses euclidean distance equation
//fitness at a given position is = sqrt(a2+b2+c2+d2....n2)

interface

uses math, Definitions;

const
  ORIMAX = 400;
  ORIMIN = -400;
  ORIBEST = 0.1;

function OriEvaluate(position: TIArray) : double; overload;
function OriEvaluate(position: TDArray) : double; overload;
function GetOriMax(): double;
function GetOriMin(): double;
function GetOriBest(): double;

implementation

function OriEvaluate(position: TIArray): double;
var i: integer;
begin
  result := 0;
  for i := 0 to Length(position)-1 do
    result := result + Sqr(position[i]);

  result := Sqrt(result);
end;

function OriEvaluate(position: TDArray): double;
var i: integer;
begin
  result := 0;
  for i := 0 to Length(position)-1 do
    result := result + Sqr(position[i]);

  result := Sqrt(result);
end;

function GetOriMax(): double;
begin
  result := ORIMAX;
end;

function GetOriMin(): double;
begin
  result := ORIMIN;
end;

function GetOriBest(): double;
begin
  result := ORIBEST;
end;

end.
