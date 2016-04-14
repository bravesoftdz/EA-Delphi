unit OriginOff;

//origin function: 0 at 50,50,50...to n, uses euclidean distance equation
//fitness at a given position is = sqrt((a-50)2+(b-50)2+(c-50)2+(d-50)2....(n-50)2)

interface

uses math, Definitions;

const
  ORIOFFMAX = 400;
  ORIOFFMIN = -400;
  ORIOFFBEST = 0.1;

function OriOffEvaluate(position: TIArray) : double; overload;
function OriOffEvaluate(position: TDArray) : double; overload;
function GetOriOffMax(): double;
function GetOriOffMin(): double;
function GetOriOffBest(): double;

implementation

function OriOffEvaluate(position: TIArray): double;
var i: integer;
begin
  result := 0;
  for i := 0 to Length(position)-1 do
    result := result + Sqr(position[i] - 50);

  result := Sqrt(result);
end;

function OriOffEvaluate(position: TDArray): double;
var i: integer;
begin
  result := 0;
  for i := 0 to Length(position)-1 do
    result := result + Sqr(position[i] - 50);

  result := Sqrt(result);
end;


function GetOriOffMax(): double;
begin
  result := ORIOFFMAX;
end;

function GetOriOffMin(): double;
begin
  result := ORIOFFMIN;
end;

function GetOriOffBest(): double;
begin
  result := ORIOFFBEST;
end;

end.
