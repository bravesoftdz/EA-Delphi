unit Definitions;

// Assuming finding Minimum of functions thus far

interface
Const
  //search space
  INT   = 0;
  REAL  = 1;
  BIN   = 2;

  //crossover types
  ONEPT = 0;
  TWOPT = 1;
  UNIPT = 2;

  //population identifiers
  PA = TRUE;
  PB = FALSE;

  //problem type
  ORI = 0;
  ORIF = 1;
  RAST = 2;
  SCHW = 3;
  OMAX = 4;

  //IndivPosGrid ordering
  POSROW = 1;

  //Page Visibility
  PARAMINDEX  = 0;
  LOCINDEX    = 1;
  PROGINDEX   = 2;
  INDIVINDEX  = 3;
  BATCHINDEX  = 4;
  RUNTAB      = 0;
  BATCHTAB    = 1;

  //constants concerning graphs and stuff
  BUBBLEMAX   = 0.20;

type
  TDArray = array of double;

type
  TIArray = array of integer;

type
  TGeneType = record
    tInt : integer;
    tReal : double;
    tBin  : integer;
  end;

type
  TGeneArray = record
    intArr : TIArray;
    realArr : TDArray;
    binArr : TIArray;
  end;

type
  TPopConfig = record
    crossType: integer; //type of crossover to undertake - 1 pt, 2 pt or uniform (currently coded)
    mRPG : TDArray;  //mutation rate per gene
    mDPG : TDArray; //mutation amount per gene
    nElite: integer; //number of elites in the population (always pass on)
    nSterile: integer; //number of steriles in population (never pass on i.e. breed)
    nTourn: integer; //tournament size
    tThres: double; //tournament threshold
    cThres: double; //crossover threshold
  end;

function GetProbname(pType : integer): string;
function GetCrossName(cType : integer): string;

implementation

function GetProbName(pType : integer): string;
begin
  result := 'N/A';
  case pType of
    OMAX  : result := 'ONE MAX';
    ORI   : result := 'ORIGIN';
    ORIF  : result := 'ORIGIN OFFSET 50';
    RAST  : result := 'RASTRIGIN';
    SCHW  : result := 'SCHWEFEL';
  end;
end;

function GetCrossName(cType : integer): string;
begin
  result := 'N/A';
  case cType of
    ONEPT : result := 'ONE POINT';
    TWOPT : result := 'TWO POINT';
    UNIPT : result := 'UNIFORM';
  end;
end;


end.
