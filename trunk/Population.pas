unit Population;

interface

uses Contnrs, Classes, Grids, SysUtils,
  Chromosome, Definitions;

type
  TPopulation = class
  private
    popA, popB : TObjectList;
    size : integer;
    dim : integer;
    popFlag : boolean;
    pCfg : TPopConfig;
    avgFit : double;
    gType : integer; //the gene type to be used
    function Crossover1PT(P1, P2: integer): TChromosome;
    function Crossover2PT(P1, P2: integer): TChromosome;
    function CrossoverUni(P1, P2: integer): TChromosome;
    function CloneChild(P1, P2: integer): TChromosome;
    function CopyChromosome(Chromo: TChromosome): TChromosome;
    function MutateChild(Child: TChromosome): TChromosome;
    function SelectParent(): integer;
    function BreedChild(P1, P2: integer): TChromosome;

  protected

  public
    constructor Create();
    procedure Allocate(theDim, theSize, theType: integer);
    procedure Initialise(max, min : double);
    procedure FillLocation(theGrid: TStringGrid);

    procedure DoOneGeneration();
    procedure SetMDistAll(amount : double);
    procedure SetMDistInd(distArray: TDArray);
    procedure SetMRateAll(rate : double);
    procedure SetMRateInd(rateArray: TDArray);
    procedure EvaluateAll();
    function  EvaluateOne(index: integer): double;
    procedure FillPosition(index: integer; theGrid: TStringGrid);

    //GET FUNCTIONS

    function GetFit(index : integer): double;
    function GetBestPos(): TGeneArray;
    function GetBestFit(): double;
    function GetWorstFit(): double;
    function GetAvgFit(): double;
    function GetIndivGene(index, gene: integer): TGeneType;

    //SET FUNCTIONS

    procedure SetTournSize(theSize: integer);
    procedure SetTournThres(theThres: double);
    procedure SetCrossType(theType : integer);
    procedure SetCrossThres(theThres: double);
    procedure SetSterile(theSterile: integer);
    procedure SetElite(theElite: integer);
    procedure SetGeneType(theType: integer);

    //HOPEFULLY SORT
    procedure SortList();

end;

Implementation
{ TPopulation }

procedure TPopulation.Allocate(theDim, theSize, theType: integer);
var i : integer;
begin
  dim := theDim;
  size := theSize;
  gType := theType;
  setLength(pCfg.mRPG, dim);
  setLength(pCfg.mDPG, dim);
  //if there are individuals in the population, go ahead and clear them
  if (popA.Count <> 0) then begin
    popA.Clear;
    popB.Clear;
  end;
  for i := 0 to size - 1 do begin
    popA.Add(TChromosome.Create(gType));
    popB.Add(TChromosome.Create(gType));
    TChromosome(popA.Items[i]).Allocate(dim);
    TChromosome(popB.Items[i]).Allocate(dim);
  end;

end;

function TPopulation.BreedChild(P1, P2: integer): TChromosome;
begin
  //make a new child
  if Random < pCfg.cThres then begin
    case pCfg.crossType of
      ONEPT: result := Crossover1Pt(P1, P2);
      TWOPT: result := Crossover2Pt(P1, P2);
      UNIPT: result := CrossoverUni(P1, P2);
    end;
  end
  else begin
    result := CloneChild(P1, P2);
  end;

  result := MutateChild(result);
end;

function TPopulation.CloneChild(P1, P2: integer): TChromosome;
begin
  if popFlag = PA then begin
    if Random > 0.5 then
      result := CopyChromosome(TChromosome(popA.Items[P1]))
    else
      result := CopyChromosome(TChromosome(popA.Items[P2]));
  end
  else begin
    if Random > 0.5 then
      result := CopyChromosome(TChromosome(popB.Items[P1]))
    else
      result := CopyChromosome(TChromosome(popB.Items[P2]));
  end;
end;

function TPopulation.CopyChromosome(Chromo: TChromosome): TChromosome;
var i: integer;
begin
  result := TChromosome.Create(gType);
  result.Allocate(dim);
  //copy the individual gene values over to ensure it is not a reference and not disappear later
  for i := 0 to dim -1 do
    result.SetGene(i, Chromo.GetGene(i));

  result.SetFit(Chromo.GetFit());  //make sure the copy has the correct fitness copied over

end;

constructor TPopulation.Create;
begin
  popA := TObjectList.Create(true);
  popB := TObjectList.Create(true);

end;

function TPopulation.Crossover1PT(P1, P2: integer): TChromosome;
var i, cP: integer; //cP is crossover point
begin
  result := TChromosome.Create(gType);
  result.Allocate(dim);

  cP := Random(dim); //get a random point between 0 and end of gene array
  for i := 0 to dim - 1 do begin
    if popFlag = PA then begin
      if i < cP then
        result.SetGene(i, TChromosome(popA.Items[P1]).GetGene(i))
      else
        result.SetGene(i, TChromosome(popA.Items[P2]).GetGene(i));
    end
    else begin
      if i < cP then
        result.SetGene(i, TChromosome(popB.Items[P1]).GetGene(i))
      else
        result.SetGene(i, TChromosome(popB.Items[P2]).GetGene(i));
    end;
  end;
end;

function TPopulation.Crossover2PT(P1, P2: integer): TChromosome;
var i, cP1, temp, cP2: integer;
begin
  result := TChromosome.Create(gType);
  result.Allocate(dim);

  cP1 := Random(dim);
  cP2 := Random(dim);
  while (cP2 = cP1) do
    cP2 := Random(dim);

  if cP1 > cP2 then begin//need to swap the points
    temp  := cP2;
    cP2   := cP1;
    cP1   := temp;
  end;

  for i := 0 to dim - 1 do begin
    if popFlag = PA then begin
      if i < cP1 then
        result.SetGene(i, TChromosome(popA.Items[P1]).GetGene(i))
      else if i < cP2 then
        result.SetGene(i, TChromosome(popA.Items[P2]).GetGene(i))
      else
        result.SetGene(i, TChromosome(popA.Items[P1]).GetGene(i));
    end
    else begin
      if i < cP1 then
        result.SetGene(i, TChromosome(popB.Items[P1]).GetGene(i))
      else if i < cP2 then
        result.SetGene(i, TChromosome(popB.Items[P2]).GetGene(i))
      else
        result.SetGene(i, TChromosome(popB.Items[P1]).GetGene(i));
    end;
  end;

end;

function TPopulation.CrossoverUni(P1, P2: integer): TChromosome;
var i: integer;
begin
  result := TChromosome.Create(gType);
  result.Allocate(dim);
  for i:= 0 to dim - 1 do begin
    if popFlag = PA then begin
      if Random > 0.5 then
        result.SetGene(i, TChromosome(popA.Items[P1]).GetGene(i))
      else
        result.SetGene(i, TChromosome(popA.Items[P2]).GetGene(i));
    end
    else begin
      if Random > 0.5 then
        result.SetGene(i, TChromosome(popB.Items[P1]).GetGene(i))
      else
        result.SetGene(i, TChromosome(popB.Items[P2]).GetGene(i));
    end;
  end;
end;

procedure TPopulation.DoOneGeneration;
var i: integer;
begin
  if (popFlag = PA) then begin
    popB.Clear;
    if (pCfg.nElite > 0) then begin//copy the best individual(s) to the first position(s) of the array
      for i := 0 to pCfg.nElite -1 do
        popB.Add(TChromosome(CopyChromosome(TChromosome(popA.Items[i]))));
      for i := pCfg.nElite to size -1 do
        popB.Add(TChromosome(BreedChild(SelectParent, SelectParent)));
    end
    else begin
      for i := 0 to size -1 do
        popB.Add(TChromosome(BreedChild(SelectParent, SelectParent)));
    end;

  end
  else begin   //population B
    popA.Clear;
    if (pCfg.nElite > 0) then begin//copy the best individual(s) to the first position(s) of the array
      for i := 0 to pCfg.nElite -1 do
        popA.Add(TChromosome(CopyChromosome(TChromosome(popB.Items[i]))));
      for i := pCfg.nElite to size -1 do
        popA.Add(TChromosome(BreedChild(SelectParent, SelectParent)));
    end
    else begin
      for i := 0 to size -1 do
        popA.Add(TChromosome(BreedChild(SelectParent, SelectParent)));
    end;
  end;
  if popFlag = PA then
    popFlag := PB
  else
    popFlag := PA;

  EvaluateAll();
end;


procedure TPopulation.EvaluateAll;
var i: integer;
begin
  avgFit := 0.0;
  if(popFlag = PA) then begin
    for i := 0 to size -1 do
      avgFit := avgFit + TChromosome(popA.Items[i]).EvaluateFit();
  end
  else begin
    for i := 0 to size -1 do
      avgFit := avgFit + TChromosome(popB.Items[i]).EvaluateFit();
  end;
  avgFit := avgFit / size;
  sortList();
end;

function TPopulation.EvaluateOne(index: integer): double;
begin
  if(popFlag = PA) then
    result := TChromosome(popA.Items[index]).EvaluateFit()
  else
    result := TChromosome(popB.Items[index]).EvaluateFit();
end;

procedure TPopulation.FillLocation(theGrid: TStringGrid);
var i, j: integer;
begin
  for i := 0 to size -1 do begin
    for j := 0 to dim -1 do begin
      if (PopFlag = PA) then begin
        case gType of
          INT : theGrid.Cells[j+1,i+1] := IntToStr(TChromosome(popA.Items[i]).GetGene(j).tInt);
          REAL: theGrid.Cells[j+1,i+1] := FloatToStr(TChromosome(popA.Items[i]).GetGene(j).tReal);
          BIN : theGrid.Cells[j+1,i+1] := FloatToStr(TChromosome(popA.Items[i]).GetGene(j).tBin);
        end;
      end else begin
        case gType of
          INT : theGrid.Cells[j+1,i+1] := IntToStr(TChromosome(popB.Items[i]).GetGene(j).tInt);
          REAL: theGrid.Cells[j+1,i+1] := FloatToStr(TChromosome(popB.Items[i]).GetGene(j).tReal);
          BIN : theGrid.Cells[j+1,i+1] := FloatToStr(TChromosome(popB.Items[i]).GetGene(j).tBin);
        end;
      end;
    end;
  end;
end;

procedure TPopulation.FillPosition(index: integer; theGrid: TStringGrid);
var i : integer;
begin
  for i := 0 to dim -1 do begin
    if popFlag = PA then begin
      case gType of
        INT : theGrid.Cells[i+1,POSROW] := IntToStr(TChromosome(popA.Items[index]).GetGene(i).tInt);
        REAL: theGrid.Cells[i+1,POSROW] := FloatToStr(TChromosome(popA.Items[index]).GetGene(i).tReal);
        BIN : theGrid.Cells[i+1,POSROW] := IntToStr(TChromosome(popA.Items[index]).GetGene(i).tBin);
      end;
    end else begin
      case gType of
        INT : theGrid.Cells[i+1,POSROW] := IntToStr(TChromosome(popB.Items[index]).GetGene(i).tInt);
        REAL: theGrid.Cells[i+1,POSROW] := FloatToStr(TChromosome(popB.Items[index]).GetGene(i).tReal);
        BIN : theGrid.Cells[i+1,POSROW] := IntToStr(TChromosome(popB.Items[index]).GetGene(i).tBin);
      end;
    end;
  end;
end;

procedure TPopulation.Initialise(max, min: double);
var i : integer;
begin
  popFlag := PA;
  for i := 0 to size -1 do begin
    TChromosome(popA.Items[i]).Initialise(max, min);
  end;
  EvaluateAll();
end;

function TPopulation.MutateChild(Child: TChromosome): TChromosome;
var i: integer;
begin
  result := Child;
  for i := 0 to dim - 1 do begin
    if (Random < pCfg.mRPG[i]) then
      result.MutateGene(i, pCfg.mDPG[i]);
  end;
end;

function TPopulation.SelectParent: integer;
var i: integer;
  tmpPool: array of integer;
  pIndex: integer; //index of individual chosen, either best or worst
  theFit: double;  //fitness of best/worst individual
begin
  setLength(tmpPool, pCfg.nTourn);
  for i := 0 to pCfg.nTourn -1 do
    tmpPool[i] := Random(size - pCfg.nSterile); //range excludes the 'sterile' individuals

  pIndex := 0;
  if(Random < pCfg.tThres) then begin //select BEST in tmpPool
    theFit := MAXINT;
    if popFlag = PA then begin
      for i := 0 to pCfg.nTourn -1 do begin
        if(TChromosome(popA.Items[tmpPool[i]]).GetFit() < theFit) then begin
          pIndex := i;
          theFit := TChromosome(popA.Items[tmpPool[i]]).GetFit;
        end;
      end;
    end
    else begin
      for i := 0 to pCfg.nTourn -1 do begin
        if(TChromosome(popB.Items[tmpPool[i]]).GetFit() < theFit) then begin
          pIndex := i;
          theFit := TChromosome(popB.Items[tmpPool[i]]).GetFit;
        end;
      end;
    end;
  end
  else begin  //get worst in group
    theFit := MAXINT * -1;
    if popFlag = PA then begin
      for i := 0 to pCfg.nTourn -1 do begin
        if(TChromosome(popA.Items[tmpPool[i]]).GetFit() > theFit) then begin
          pIndex := i;
          theFit := TChromosome(popA.Items[tmpPool[i]]).GetFit;
        end;
      end;
    end
    else begin
      for i := 0 to pCfg.nTourn -1 do begin
        if(TChromosome(popB.Items[tmpPool[i]]).GetFit() > theFit) then begin
          pIndex := i;
          theFit := TChromosome(popB.Items[tmpPool[i]]).GetFit;
        end;
      end;
    end;
  end;
  result := tmpPool[pIndex];
end;

/////////////////////////////////////////////////////////
///////////////////////GET FUNCTIONS/////////////////////
/////////////////////////////////////////////////////////

function TPopulation.GetAvgFit: double;
begin
  result := avgFit;
end;

function TPopulation.GetBestFit: double;
begin
  if popFlag = PA then
    result := TChromosome(popA.Items[0]).GetFit()
  else
    result := TChromosome(popB.Items[0]).GetFit();
end;

function TPopulation.GetBestPos: TGeneArray;
begin
  if popFlag = PA then
    result := TChromosome(popA.Items[0]).GetGeneArray
  else
    result := TChromosome(popB.Items[0]).GetGeneArray;
end;

function TPopulation.GetFit(index: integer): double;
begin
  if popFlag = PA then
    result := TChromosome(popA.Items[index]).GetFit
  else
    result := TChromosome(popB.Items[index]).GetFit;
end;

function TPopulation.GetWorstFit: double;
begin
  if popFlag = PA then
    result := TChromosome(popA.Items[size-1]).GetFit()
  else
    result := TChromosome(popB.Items[size-1]).GetFit();
end;


function TPopulation.GetIndivGene(index, gene: integer): TGeneType;
begin
  if popFlag = PA then begin
    case gType of
      INT : result  := TChromosome(popA.Items[index]).GetGene(gene);
      REAL: result  := TChromosome(popA.Items[index]).GetGene(gene);
      BIN : result  := TChromosome(popA.Items[index]).GetGene(gene);
    end;
  end else begin
    case gType of
      INT : result  := TChromosome(popB.Items[index]).GetGene(gene);
      REAL: result  := TChromosome(popB.Items[index]).GetGene(gene);
      BIN : result  := TChromosome(popB.Items[index]).GetGene(gene);
    end;
  end;
end;
/////////////////////////////////////////////////////////
///////////////////////SET FUNCTIONS/////////////////////
/////////////////////////////////////////////////////////

procedure TPopulation.SetCrossThres(theThres: double);
begin
  pCfg.cThres := theThres;
end;

procedure TPopulation.SetCrossType(theType: integer);
begin
  pCfg.crossType := theType;
end;

procedure TPopulation.SetElite(theElite: integer);
begin
  pCfg.nElite := theElite;
end;

procedure TPopulation.SetGeneType(theType: integer);
begin
  gType := theType;
end;

procedure TPopulation.SetMDistAll(amount: double);
var i : integer;
begin
  for i := 0 to dim -1 do
    pCfg.mDPG[i] := amount;
end;

procedure TPopulation.SetMDistInd(distArray: TDArray);
var i : integer;
begin
  for i := 0 to dim -1 do
    pCfg.mDPG[i] := DistArray[i];
end;

procedure TPopulation.SetMRateAll(rate: double);
var i: integer;
begin
  for i := 0 to dim - 1 do
    pCfg.mRPG[i] := rate;
end;

procedure TPopulation.SetMRateInd(rateArray: TDArray);
var i: integer;
begin
  for i := 0 to dim - 1 do
    pCfg.mRPG[i] := rateArray[i];
end;

procedure TPopulation.SetSterile(theSterile: integer);
begin
  pCfg.nSterile := theSterile;
end;

procedure TPopulation.SetTournSize(theSize: integer);
begin
  pCfg.nTourn := theSize;
end;

procedure TPopulation.SetTournThres(theThres: double);
begin
  pCfg.tThres := theThres;
end;


function CompareFitness(Item1, Item2: Pointer): Integer;
begin
  if (TChromosome(Item1).GetFit < TChromosome(Item2).GetFit) then
    result := -1
  else if (TChromosome(Item1).GetFit > TChromosome(Item2).GetFit) then
    result := 1
  else
    result := 0;
end;

procedure TPopulation.SortList;
begin
  if popFlag = PA then
    popA.Sort(@CompareFitness)
  else
    popB.Sort(@CompareFitness);
end;

end.