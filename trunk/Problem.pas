unit Problem;

interface

uses math,
    //user created units
    Rastrigin, OriginOff, Schwefel, Definitions, OneMax, Origin;

//public methods and variables

//overloading the evaluate function. both take an array of doubles and return a
//fitness value associated with that position
//first evaluate uses the stored problem as the basis problem unit
//NOTE: Double array does not handle OMAX
function Evaluate(position: TIArray): double; overload;
function Evaluate(position: TIArray; theProblem: integer): double; overload;
function Evaluate(position: TDArray): double; overload;
function Evaluate(position: TDArray; theProblem: integer): double; overload;
procedure SetProb(theProb : integer);

//two functions for getting the maximum and minimum of the problem (for assymmetrical problems)
function GetProbMax(): double;
function GetProbMin(): double;
function GetProbBest(): double;

implementation
//private variables and methods
var prob: integer;

function Evaluate(position: TIArray) : double;
begin
  result := 0.0;
  case prob of
    OMAX: result := OMaxEvaluate(position);
    ORI:  result := OriEvaluate(position);
    ORIF: result := OriOffEvaluate(position);
 end;
end;

function Evaluate(position: TIArray; theProblem: integer): double;
begin
  result := 0.0;
  case theProblem of
    OMAX: result := OMaxEvaluate(position);
    ORI:  result := OriEvaluate(position);
    ORIF: result := OriOffEvaluate(position);
  end;
end;

function Evaluate(position: TDArray) : double;
begin
  result := 0.0;
  case prob of
    ORI:  result := OriEvaluate(position);
    ORIF: result := OriOffEvaluate(position);
    RAST: result := RastEvaluate(position);
    SCHW: result := SchwEvaluate(position);
 end;
end;

function Evaluate(position: TDArray; theProblem: integer): double;
begin
  result := 0.0;
  case theProblem of
    ORI:  result := OriEvaluate(position);
    ORIF: result := OriOffEvaluate(position);
    RAST: result := RastEvaluate(position);
    SCHW: result := SchwEvaluate(position);
  end;
end;

function GetProbMax(): double;
begin
  result := 0.0;
  case prob of
    ORI:  result := GetOriMax();
    ORIF: result := GetOriOffMax();
    RAST: result := GetRastMax();
    SCHW: result := GetSchwMax();
  end;
end;

function GetProbMin(): double;
begin
  result := 0.0;
  case prob of
    ORI:  result := GetOriMin();
    ORIF: result := GetOriOffMin();
    RAST: result := GetRastMin();
    SCHW: result := GetSchwMin();
  end;
end;

function GetProbBest(): double;
begin
  result := 0.0;
  case prob of
    ORI:  result := GetOriBest();
    ORIF: result := GetOriOffBest();
    RAST: result := GetRastBest();
    SCHW: result := GetSchwBest();
  end;
end;

procedure SetProb(theProb : integer);
begin
  prob := theProb;
end;

end.
