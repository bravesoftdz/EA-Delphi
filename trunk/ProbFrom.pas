unit ProbFrom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ESBPCSSpinEdit, StdCtrls, ExtCtrls, ESBPCSPanel, Buttons, Grids,
  Definitions, Problem;

type
  TPForm = class(TForm)
    ProbMemo: TMemo;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    ProbRadGrp: TRadioGroup;
    GroupBox1: TGroupBox;
    SeedEdit: TESBIntSpinEdit;
    GroupBox2: TGroupBox;
    SizeEdit: TESBPosSpinEdit;
    GroupBox3: TGroupBox;
    DimSpin: TESBPosSpinEdit;
    GroupBox4: TGroupBox;
    EvalBtn: TButton;
    PSFitLbl: TLabel;
    EvalFitGrid: TStringGrid;
    GeneRadGrp: TRadioGroup;
    procedure EvalBtnClick(Sender: TObject);
    procedure DimSpinChange(Sender: TObject);
    procedure ProbRadGrpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GeneRadGrpClick(Sender: TObject);
  private
    { Private declarations }
    pType :  integer;
    gType : integer;
    dim : integer;
  public
    { Public declarations }
    procedure InitForm(theProb, theDim, theSize : integer);
    procedure InitGrid();
    procedure FillMemo();
  end;

var
  PForm: TPForm;

implementation

{$R *.dfm}

procedure TPForm.InitForm(theProb, theDim, theSize : integer);
begin
  pType := theProb;
  dim := theDim;
  DimSpin.Value := dim;
  ProbRadGrp.ItemIndex := pType;
  SizeEdit.Value := theSize;
  FillMemo();
  InitGrid();
  case pType of
    ORI  : begin
      GeneRadGrp.Controls[INT].Enabled := true;
      GeneRadGrp.Controls[REAL].Enabled := true;
      GeneRadGrp.Controls[BIN].Enabled := false;
    end;
    ORIF : begin
      GeneRadGrp.Controls[INT].Enabled := true;
      GeneRadGrp.Controls[REAL].Enabled := true;
      GeneRadGrp.Controls[BIN].Enabled := false;
    end;
    RAST : begin
      GeneRadGrp.Controls[INT].Enabled := false;
      GeneRadGrp.Controls[REAL].Enabled := true;
      GeneRadGrp.Controls[BIN].Enabled := false;
      GeneRadGrp.ItemIndex := REAL;
    end;
    SCHW : begin
      GeneRadGrp.Controls[INT].Enabled := false;
      GeneRadGrp.Controls[REAL].Enabled := true;
      GeneRadGrp.Controls[BIN].Enabled := false;
      GeneRadGrp.ItemIndex := REAL;
    end;
    OMAX : begin
      GeneRadGrp.Controls[INT].Enabled := false;
      GeneRadGrp.Controls[REAL].Enabled := false;
      GeneRadGrp.Controls[BIN].Enabled := true;
      GeneRadGrp.ItemIndex := BIN;
    end;
  end;
  gType := GeneRadGrp.ItemIndex;
end;

procedure TPForm.InitGrid;
var i: integer;
begin
  EvalFitGrid.ColCount := dim + 1;
  for i:= 0 to dim -1 do begin
    EvalFitGrid.Cells[i+1,0]  := 'Dim ' + IntToStr(i);
    EvalFitGrid.Cells[i+1,1]  := '0';
  end;
  EvalFitGrid.Cells[0,1] := 'Value';

end;

procedure TPForm.EvalBtnClick(Sender: TObject);
var pos : TGeneArray;
    i: integer;
    fitness : double;
    tInt, tBin : integer;
    tReal : double;
begin
  fitness := MAXINT; //placeholder to see if anything stuffs up
  case GeneRadGrp.ItemIndex of
    INT : begin
      setLength(pos.intArr, dim);
      for i:= 0 to dim - 1 do begin
        tInt := StrToIntDef(EvalFitGrid.Cells[i+1,1], MAXINT);
        if tInt = MAXINT then begin
          ShowMessage('Invalid character '+EvalFitGrid.Cells[i+1,1]);
          exit;
        end else
          pos.intArr[i] := tInt;
      end;
      fitness :=  evaluate(pos.intArr, pType);
    end;
    REAL: begin
      setLength(pos.realArr, dim);
      for i:= 0 to dim - 1 do begin
        tReal := StrToFloatDef(EvalFitGrid.Cells[i+1,1], MAXINT);
        if tReal = MAXINT then begin
          ShowMessage('Invalid character '+EvalFitGrid.Cells[i+1,1]);
          exit;
        end else
          pos.realArr[i] := tReal;
      end;
      fitness :=  evaluate(pos.realArr, pType);
    end;
    BIN : begin
      setLength(pos.binArr, dim);
      for i:= 0 to dim - 1 do begin
        tBin := StrToIntDef(EvalFitGrid.Cells[i+1,1], MAXINT);
        if ((tBin = MAXINT) or not ((tBin = -1) or (tBin = 0) or (tBin = 1))) then begin
          ShowMessage('Invalid character '+EvalFitGrid.Cells[i+1,1]);
          exit;
        end else
          pos.binArr[i] := tBin;
      end;
      fitness :=  evaluate(pos.binArr, pType);
    end;
  end;
  PSFitLbl.Caption := 'Fitness = ' +floatToStr(fitness);
end;

procedure TPForm.DimSpinChange(Sender: TObject);
begin
  dim := DimSpin.Value;
  InitGrid();
end;


procedure TPForm.FillMemo();
begin
  ProbMemo.Clear();
  case pType of
    OMAX : begin
      ProbMemo.Lines.Add('Simple One High problem');
      ProbMemo.Lines.Add('Fitness decreases as number of 1''s increase');
      ProbMemo.Lines.Add('Global Minimum is 0 for all 1''s');
      ProbMemo.Lines.Add('');
      ProbMemo.Lines.Add('Maximum problem bounds are not applicable to boolean problems');
    end;
    ORI : begin
      ProbMemo.Lines.Add('Simple Euclidean distance problem without offset');
      ProbMemo.Lines.Add('Fitness increases uniformly in all directions from 0');
      ProbMemo.Lines.Add('Global Minimum is at 0 for all dimensions');
      ProbMemo.Lines.Add('Fitness is given by Sqrt(a2+b2+c2...n2)');
      ProbMemo.Lines.Add('');
      ProbMemo.Lines.Add('Problem bounds are +/-400');
    end;
    ORIF : begin
      ProbMemo.Lines.Add('Simple Euclidean distance problem with an offset');
      ProbMemo.Lines.Add('Fitness increases uniformly in all directions from focal point of 50 for all dimensions');
      ProbMemo.Lines.Add('Global Minimum is at 0 for all dimensions');
      ProbMemo.Lines.Add('Fitness is given by Sqrt((a-50)2+(b-50)2+(c-50)2...(n-50)2)');
      ProbMemo.Lines.Add('');
      ProbMemo.Lines.Add('Problem bounds are +/-400');
    end;
    RAST : begin
      ProbMemo.Lines.Add('Based on the Origin Equation but with the addition of Cosine modulation.');
      ProbMemo.Lines.Add('This produces many local Minima that are locally distributed');
      ProbMemo.Lines.Add('Global Minimum is at 0 for all dimensions');
      ProbMemo.Lines.Add('Fitness is given by 10*n + sum(x2 - 10*Cos(2*PI*x))');
      ProbMemo.Lines.Add('');
      ProbMemo.Lines.Add('Problem bounds are +/- 5.12');
    end;
    SCHW : begin
      ProbMemo.Lines.Add('Schwefel''s function  is deceptive in that the global minimum is geometrically distant from the next best minima');
      ProbMemo.Lines.Add('Therefore, potentially prone to convergence in the wrong direction.');
      ProbMemo.Lines.Add('Global Minimum is 420.9687 in all dimensions');
      ProbMemo.Lines.Add('Fitness is given by sum(-x·sin(sqrt(abs(x)))');
      ProbMemo.Lines.Add('');
      ProbMemo.Lines.Add('Problem bounds are +/- 500');
    end;
  end;
end;


procedure TPForm.ProbRadGrpClick(Sender: TObject);
begin
  pType := ProbRadGrp.ItemIndex;
  FillMemo();
  case pType of
    ORI  : begin
      GeneRadGrp.Controls[INT].Enabled := true;
      GeneRadGrp.Controls[REAL].Enabled := true;
      GeneRadGrp.Controls[BIN].Enabled := false;
      if GeneRadGrp.ItemIndex = BIN then GeneRadGrp.ItemIndex := INT;
    end;
    ORIF : begin
      GeneRadGrp.Controls[INT].Enabled := true;
      GeneRadGrp.Controls[REAL].Enabled := true;
      GeneRadGrp.Controls[BIN].Enabled := false;
      if GeneRadGrp.ItemIndex = BIN then GeneRadGrp.ItemIndex := INT;
    end;
    RAST : begin
      GeneRadGrp.Controls[INT].Enabled := false;
      GeneRadGrp.Controls[REAL].Enabled := true;
      GeneRadGrp.Controls[BIN].Enabled := false;
      GeneRadGrp.ItemIndex := REAL;
    end;
    SCHW : begin
      GeneRadGrp.Controls[INT].Enabled := false;
      GeneRadGrp.Controls[REAL].Enabled := true;
      GeneRadGrp.Controls[BIN].Enabled := false;
      GeneRadGrp.ItemIndex := REAL;
    end;
    OMAX : begin
      GeneRadGrp.Controls[INT].Enabled := false;
      GeneRadGrp.Controls[REAL].Enabled := false;
      GeneRadGrp.Controls[BIN].Enabled := true;
      GeneRadGrp.ItemIndex := BIN;
    end;
  end;
end;

procedure TPForm.FormCreate(Sender: TObject);
begin
  TRadioButton(ProbRadGrp.Controls[0]).Font.Style := [];
  TRadioButton(ProbRadGrp.Controls[1]).Font.Style := [];
  TRadioButton(ProbRadGrp.Controls[2]).Font.Style := [];
  TRadioButton(ProbRadGrp.Controls[3]).Font.Style := [];
  TRadioButton(ProbRadGrp.Controls[4]).Font.Style := [];
  TRadioButton(GeneRadGrp.Controls[0]).Font.Style := [];
  TRadioButton(GeneRadGrp.Controls[1]).Font.Style := [];
  TRadioButton(GeneRadGrp.Controls[2]).Font.Style := [];
end;


procedure TPForm.GeneRadGrpClick(Sender: TObject);
begin
  gType := GeneRadGrp.ItemIndex;
end;

end.
