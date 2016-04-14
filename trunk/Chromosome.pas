unit Chromosome;

interface

uses Classes, Problem, Definitions;

type
  TChromosome = class
  private
    genes : TGeneArray;
    dim : integer;
    fit : double;
    gType : integer;
    posBound: double;
    negBound: double;
  protected

  public
    //constructor initialises the size of the relative arrays according to the dimensions of the problem
    constructor Create(geneType : integer);
    procedure Allocate(theDim: integer);
    procedure Initialise(max, min : double);
    function GetGene(theGene: integer): TGeneType;
    function GetFit(): double;
    procedure SetFit(theFit: double);
    procedure SetGene(index : integer; gene : TGeneType);
    function EvaluateFit(): double;
    function GetGeneArray : TGeneArray;
    procedure MutateGene(index: integer; mutRange: double);
end;

implementation

{ TChromosome }

constructor TChromosome.Create(geneType : integer);
begin
  gType := geneType;
  posBound := MAXINT;
  negBound := -MAXINT;
end;

procedure TChromosome.Initialise(max, min: double);
var i : integer;
begin
  case gType of
    INT :begin
      for i := 0 to dim -1 do
        genes.intArr[i] := Round(random * (max - min) + min);
    end;
    REAL : begin
      for i := 0 to dim -1 do
        genes.realArr[i] := (random * (max - min) + min);
    end;
    BIN : begin
      for i := 0 to dim -1 do
        if random > 0.5 then genes.binArr[i] := 1 else genes.binArr[i] := -1;
    end;
  end;
end;

function TChromosome.GetGene(theGene: integer): TGeneType;
begin
  case gType of
    INT : result.tInt := genes.intArr[theGene];
    REAL : result.tReal := genes.realArr[theGene];
    BIN : result.tBin := genes.binArr[theGene];
  end;
end;

procedure TChromosome.Allocate(theDim: integer);
begin
  dim := theDim;

  case gType of
    INT : setLength(genes.intArr, dim);
    REAL: setLength(genes.realArr, dim);
    BIN : setLength(genes.binArr, dim);
  end
end;

procedure TChromosome.SetFit(theFit: double);
begin
  fit := theFit
end;

procedure TChromosome.SetGene(index : integer; gene : TGeneType);
begin
  case gType of
    INT : genes.intArr[index] := gene.tInt;
    REAL : genes.realArr[index] := gene.tReal;
    BIN : genes.binArr[index] := gene.tBin;
  end;
end;

function TChromosome.GetFit: double;
begin
  result := fit;
end;

function TChromosome.EvaluateFit: double;
begin
  case gType of
    INT:  fit := Evaluate(Genes.intArr);
    REAL: fit := Evaluate(Genes.realArr);
    BIN:  fit := Evaluate(Genes.binArr);
  end;
  result := fit;
end;

function TChromosome.GetGeneArray: TGeneArray;
var i : integer;
begin
  case gType of
    INT : begin
      setLength(result.intArr, dim);
      for i := 0 to dim -1 do
        result.intArr[i] := genes.intArr[i];
    end;
    REAL : begin
      setLength(result.realArr, dim);
      for i := 0 to dim -1 do
        result.realArr[i] := genes.realArr[i];
    end;
    BIN :  begin
      setLength(result.binArr, dim);
      for i := 0 to dim -1 do
        result.binArr[i] := genes.binArr[i];
    end;
  end;
end;

procedure TChromosome.MutateGene(index: integer; mutRange: double);
var tmpI : integer;
  tmpR : double;
begin
  case gType of
    INT : begin
      tmpI := Round(mutRange*(Random*2-1)) + genes.intArr[index];
      if tmpI > GetProbMax() then genes.realArr[index] := Round(GetProbMax())
      else if tmpI < GetProbMin() then genes.realArr[index] := Round(GetProbMin())
      else genes.intArr[index] := tmpI;
    end;
    REAL: begin
      tmpR := mutRange*(Random*2-1) + genes.realArr[index];
      if tmpR > GetProbMax() then genes.realArr[index] := GetProbMax()
      else if tmpR < GetProbMin() then genes.realArr[index] := GetProbMin()
      else genes.realArr[index] := tmpR;
    end;
    BIN : if Random > 0.5 then genes.binArr[index] := 1 else genes.binArr[index] := -1;
  end;
end;


end.
