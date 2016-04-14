unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ESBPCSSpinEdit, StdCtrls, ExtCtrls, ESBPCSPanel, Grids, Contnrs,
  Menus, ComCtrls, Buttons, Series, TeEngine, TeeProcs, Chart, BubbleCh,
  //added units
  Definitions, Population, ProbFrom, Problem, ESBPCSMatrixEdit;

type
  TMyEA = class(TForm)
    BestFitLbl2: TLabel;
    BestFitGlobalLbl: TLabel;
    EACtrl: TPageControl;
    ParamPage: TTabSheet;
    InitStartBox: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    PartParamBox: TGroupBox;
    EliteBox: TCheckBox;
    SterileBox: TCheckBox;
    EliteEdit: TESBIntSpinEdit;
    SterileEdit: TESBIntSpinEdit;
    GroupBox8: TGroupBox;
    DefMutRateBtn: TRadioButton;
    IndMutRateBtn: TRadioButton;
    MutRateGrid: TStringGrid;
    GroupBox10: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    TournSizeEdit: TESBPosSpinEdit;
    TournThresEdit: TESBFloatSpinEdit;
    CrossRadGrp: TRadioGroup;
    GroupBox7: TGroupBox;
    CrossThresEdit: TESBFloatSpinEdit;
    LocationPage: TTabSheet;
    ProgressPage: TTabSheet;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    BestFitProgLbl: TLabel;
    BestFitGrid: TStringGrid;
    GroupBox3: TGroupBox;
    AllFitChart: TChart;
    BestFitSeries: TFastLineSeries;
    AvFitSeries: TFastLineSeries;
    WorstFitSeries: TFastLineSeries;
    IndivPage: TTabSheet;
    Label11: TLabel;
    IndivGrid: TStringGrid;
    IndivPosGrid: TStringGrid;
    IndivFitChart: TChart;
    IndivSeries: TPointSeries;
    IndivViewEdit: TESBPosSpinEdit;
    BatchViewPage: TTabSheet;
    BFitChart: TChart;
    SBatFit: TFastLineSeries;
    BRunChart: TChart;
    SBatRun: TFastLineSeries;
    PlotBatch: TCheckBox;
    RunCtrl: TPageControl;
    SinglePage: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label21: TLabel;
    InitPopBtn: TButton;
    OneIterBtn: TButton;
    NIterBtn: TButton;
    IterStpBtn: TButton;
    IterGrp: TGroupBox;
    IterLbl: TLabel;
    ThresBtn: TButton;
    NIterEdit: TESBPosSpinEdit;
    IterStpEdit: TESBPosSpinEdit;
    ThresEdit: TESBFloatSpinEdit;
    GroupBox9: TGroupBox;
    ChangeLbl: TLabel;
    ChangeBtn: TButton;
    ChangeEdit: TESBPosSpinEdit;
    BatchSetPage: TTabSheet;
    Label22: TLabel;
    BProgLbl: TLabel;
    GroupBox4: TGroupBox;
    Label19: TLabel;
    GroupBox5: TGroupBox;
    BGenBox: TCheckBox;
    BThresBox: TCheckBox;
    BGenEdit: TESBPosSpinEdit;
    BThresEdit: TESBFloatSpinEdit;
    BChangeBox: TCheckBox;
    BChangeEdit: TESBPosSpinEdit;
    BRunEdit: TESBPosSpinEdit;
    GroupBox6: TGroupBox;
    Label20: TLabel;
    BSaveEdit: TEdit;
    BRunBtn: TButton;
    BStopBtn: TBitBtn;
    BProgBar: TProgressBar;
    StopFlagBtn: TBitBtn;
    BestFitChart: TChart;
    GlobalFitSeries: TFastLineSeries;
    EAMenu: TMainMenu;
    FMenu: TMenuItem;
    AMenu: TMenuItem;
    ExitMenu: TMenuItem;
    GroupBox1: TGroupBox;
    DefMutDistBtn: TRadioButton;
    IndMutDistBtn: TRadioButton;
    MutDistGrid: TStringGrid;
    BestFitDescLbl: TLabel;
    YAxisEdit: TESBPosSpinEdit;
    XAxisEdit: TESBPosSpinEdit;
    LVLbl4: TLabel;
    LVLbl5: TLabel;
    NormalTimer: TTimer;
    LocationChart: TChart;
    LocationSeries: TBubbleSeries;
    LVLbl1: TLabel;
    LVLbl2: TLabel;
    IndivSizeBar: TTrackBar;
    LVLbl3: TLabel;
    LocationGrid: TStringGrid;
    MaxEdit: TESBFloatSpinEdit;
    MinEdit: TESBFloatSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FMenuClick(Sender: TObject);
    procedure InitPopBtnClick(Sender: TObject);
    procedure DefMutRateBtnClick(Sender: TObject);
    procedure IndMutRateBtnClick(Sender: TObject);
    procedure DefMutDistBtnClick(Sender: TObject);
    procedure IndMutDistBtnClick(Sender: TObject);
    procedure IndivViewEditChange(Sender: TObject);
    procedure OneIterBtnClick(Sender: TObject);
    procedure NIterBtnClick(Sender: TObject);
    procedure IterStpBtnClick(Sender: TObject);
    procedure ThresBtnClick(Sender: TObject);
    procedure IndivSizeBarChange(Sender: TObject);
    procedure LocationGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure EACtrlChange(Sender: TObject);
    procedure NormalTimerTimer(Sender: TObject);
    procedure StopFlagBtnClick(Sender: TObject);
    procedure SortBtnClick(Sender: TObject);
    procedure EliteBoxClick(Sender: TObject);
    procedure SterileBoxClick(Sender: TObject);
    procedure YAxisEditChange(Sender: TObject);
    procedure XAxisEditChange(Sender: TObject);
    procedure EliteEditChange(Sender: TObject);
    procedure SterileEditChange(Sender: TObject);
    procedure BRunBtnClick(Sender: TObject);
    procedure RunCtrlChange(Sender: TObject);
    procedure BStopBtnClick(Sender: TObject);
    procedure ChangeBtnClick(Sender: TObject);

  private
    { Private declarations }
    myPop : TPopulation;
    dim, size, pType, gType : integer;
    gen, genChange : integer;
    bestFit : double;
    bestPos : TGeneArray;
    pSize, maxPSize : double;
    runFlag, batchFlag : boolean;

    procedure UpdateIndivChart();
    procedure UpdateLocationChart();
    procedure UpdateBest();
    procedure DoOneGen();
    procedure UpdateProgressChart();
    procedure UpdateForm();
    procedure UpdateLocationPage();
    procedure UpdateProgressPage();
    procedure UpdateIndividualPage();
    procedure UpdateBatchPage();
    procedure SetSize();
  public
    { Public declarations }
  end;

var
  MyEA: TMyEA;

implementation

{$R *.dfm}


procedure TMyEA.FormCreate(Sender: TObject);
begin
  myPop := TPopulation.Create();
  size := 50;
  dim := 20;
  LocationGrid.ColWidths[0] := 64;
  IndivGrid.Cells[0,0] := 'Fitness';
  BestFitDescLbl.Visible := false;
  runFlag := false;
  BatchViewPage.TabVisible := false;

end;

procedure TMyEA.FMenuClick(Sender: TObject);
var functionForm : TPForm;
  i, j: integer;
begin
  functionForm := TPForm.Create(nil);
  functionForm.InitForm(pType, dim, size);
  try
  //if ok is clicked, change the number of dimensions, enable the program to run
    if (functionForm.ShowModal = mrOK) then begin

      ///////////////////////// SET UP MAIN VARIABLES //////////////////////////
      RandSeed := functionForm.SeedEdit.Value; //sets random seed to given value
      pType := functionForm.ProbRadGrp.ItemIndex;
      setProb(pType);
      dim := functionForm.DimSpin.Value;
      size := functionForm.SizeEdit.Value;
      gType := functionForm.GeneRadGrp.ItemIndex;

      case gType of
        INT : setLength(bestPos.intArr, dim);
        REAL: setLength(bestPos.realArr, dim);
        BIN : setLength(bestPos.binArr, dim);
      end;
      if gType <> BIN then begin
        maxPSize := (GetProbMax() - GetProbMin()) * BUBBLEMAX;
        SetSize();
        with LocationChart.BottomAxis do begin
          Automatic := false;
          Maximum := GetProbMax();
          Minimum := GetProbMin();
        end;
        with LocationChart.LeftAxis do begin
          Automatic := false;
          Maximum := GetProbMax();
          Minimum := GetProbMin();
        end;
      end;

      /////////////// SET UP POPULATION VARIABLES //////////////////////////////
      myPop.Allocate(dim, size, gType);

      ///////////////////////// PARAMETER PAGE /////////////////////////////////
      MaxEdit.Enabled := true;
      MinEdit.Enabled := true;
      MaxEdit.Max := GetProbMax();
      MaxEdit.Min := GetProbMin();
      MinEdit.Max := GetProbMax();
      MinEdit.Min := GetProbMin();

      EliteBox.Enabled := true;
      SterileBox.Enabled := true;
      EliteEdit.Max := size;
      SterileEdit.Max := size;

      DefMutRateBtn.Enabled := true;
      IndMutRateBtn.Enabled := true;
      MutRateGrid.Enabled := true;
      MutRateGrid.Color := clWhite;
      MutRateGrid.Cells[1,1]    := FloatToStr(0.05);


      DefMutDistBtn.Enabled := true;
      IndMutDistBtn.Enabled := true;
      MutDistGrid.Enabled := true;
      MutDistGrid.Color := clWhite;
      MutDistGrid.Cells[1,1]  := FloatToStr(GetProbMax()/20);

      TournSizeEdit.Enabled := true;
      TournSizeEdit.Max     := size;
      TournThresEdit.Enabled := true;
      CrossThresEdit.Enabled := true;
      CrossRadGrp.Enabled := true;

      ////////////////////// LOCATION PAGE ////////////////////////////////////
      XAxisEdit.Enabled     := false;
      YAxisEdit.Enabled     := false;
      IndivSizeBar.Enabled  := false;
      LocationGrid.Enabled  := false;
      LocationChart.Enabled := false;
      LocationSeries.Clear;
      if gType = BIN then begin
        LocationChart.Visible := false;
        XAxisEdit.Visible     := false;
        YAxisEdit.Visible     := false;
        IndivSizeBar.Visible  := false;
        LVLbl1.Visible := false;
        LVLbl2.Visible := false;
        LVLbl3.Visible := false;
        LVLbl4.Visible := false;
        LVLbl5.Visible := false;

        with LocationGrid do begin
          Visible  := true;
          ColCount := dim+1;
          RowCount := size+1;
          for i := 0 to dim-1  do Cells[i+1,0] := IntToStr(i);
          for i := 0 to size-1 do Cells[0,i+1] := 'Indiv ' + IntToStr(i);
          for i := 0 to dim-1   do for j := 0 to size-1 do Cells[i+1,j+1] := '';
        end;
      end else begin
        LocationGrid.Visible  := false;
        LocationChart.Visible := true;
        XAxisEdit.Visible     := true;
        XAxisEdit.Max         := dim -1;
        YAxisEdit.Visible     := true;
        YAxisEdit.Max         := dim -1;
        LVLbl1.Visible := true;
        LVLbl2.Visible := true;
        LVLbl3.Visible := true;
        LVLbl4.Visible := true;
        LVLbl5.Visible := true;
      end;

      /////////////////////////// PROGRESS PAGE ////////////////////////////////
      BestFitGrid.Enabled   := false;
      BestFitGrid.ColCount  := dim+1;
      for i := 0 to dim-1   do BestFitGrid.Cells[i+1,0] := IntToStr(i);

      AvFitSeries.Clear;
      BestFitSeries.Clear;
      WorstFitSeries.Clear;

      ///////////////////////// INDIVIDUAL PAGE ////////////////////////////////
      IndivPosGrid.ColCount := dim+1;
      for i := 0 to dim-1   do IndivPosGrid.Cells[i+1,0]:= IntToStr(i);
      IndivPosGrid.Enabled  := false;
      IndivGrid.Enabled     := false;
      IndivViewEdit.Enabled := false;
      IndivViewEdit.Max     := size -1;

      /////////////////////////// RUN CTRL /////////////////////////////////////
      RunCtrl.Enabled := true;
      InitPopBtn.Enabled  := true;
      OneIterBtn.Enabled  := false;
      NIterBtn.Enabled    := false;
      IterStpBtn.Enabled  := false;
      ThresBtn.Enabled    := false;
      ChangeBtn.Enabled   := false;

      //////////////////////// BATCH CTRL //////////////////////////////////////
      BRunEdit.Enabled    := true;
      BGenBox.Enabled     := true;
      BGenEdit.Enabled    := true;
      BChangeBox.Enabled  := true;
      BChangeEdit.Enabled := true;
      BThresBox.Enabled   := true;
      BThresEdit.Enabled  := true;
      BSaveEdit.Enabled   := true;
      BRunBtn.Enabled     := true;
      BStopBtn.Enabled    := true;

      ////////////////////////// MISCELLANEOUS GUI /////////////////////////////
      BestFitDescLbl.Visible := false;
      BestFitGlobalLbl.Visible := false;
      GlobalFitSeries.Clear;
      IterLbl.Caption := '';
      ChangeLbl.Caption := '';

    end;
  finally
    functionForm.Release();
  end;
end;

procedure TMyEA.InitPopBtnClick(Sender: TObject);
var i : integer;
  tmpArray : TDArray;
  cancelFlag : boolean;
begin
  ////////////////////SET POPULATION VARIABLES /////////////////////////////////
  cancelFlag := false;
  setLength(tmpArray, dim); //array for mutation amount/rate
  if DefMutRateBtn.Checked = true then
    myPop.SetMRateAll(StrToFloat(MutRateGrid.Cells[1,1]))
  else begin
    for i := 0 to dim -1 do
      if StrToFloatDef(MutRateGrid.Cells[i+1,1], MAXINT) = MAXINT then
        cancelFlag := true
      else
      tmpArray[i] := StrToFloat(MutRateGrid.Cells[i+1,1]);
    myPop.SetMRateInd(tmpArray);
  end;
  if DefMutDistBtn.Checked = true then
    myPop.SetMDistAll(StrToFloat(MutDistGrid.Cells[1,1]))
  else begin
    for i := 0 to dim -1 do begin
      if StrToFloatDef(MutDistGrid.Cells[i+1,1], MAXINT) = MAXINT then
        cancelFlag := true
      else
        tmpArray[i] := StrToFloat(MutDistGrid.Cells[i+1,1]);
    end;
    myPop.SetMDistInd(tmpArray);
  end;
  if (cancelFlag = true) then
    ShowMessage('Invalid characters detected, Initialisation failure')
  else begin

    myPop.SetTournSize(TournSizeEdit.Value);
    myPop.SetTournThres(TournThresEdit.Value);
    myPop.SetCrossType(CrossRadGrp.ItemIndex);
    myPop.SetCrossThres(CrossThresEdit.Value);
    if EliteBox.Checked = true then myPop.SetElite(EliteEdit.Value) else myPop.SetElite(0);
    if SterileBox.Checked = true then myPop.SetSterile(SterileEdit.Value) else myPop.SetSterile(0);

    //////////////////////// INITIALISE THE POPULATION ///////////////////////////
    myPop.Initialise(MaxEdit.Value, MinEdit.Value);
    bestFit := MAXINT;
    UpdateBest();

    ////////////////////////// INITIALISE THE GUI ////////////////////////////////
    BestFitDescLbl.Visible := true;
    GlobalFitSeries.Clear;
    AvFitSeries.Clear;
    BestFitSeries.Clear;
    WorstFitSeries.Clear;

    BestFitGlobalLbl.Caption := FloatToStr(bestFit);
    OneIterBtn.Enabled := true;
    NIterBtn.Enabled := true;
    NIterEdit.Enabled := true;
    IterStpBtn.Enabled := true;
    IterStpEdit.Enabled := true;
    ThresBtn.Enabled := true;
    ThresEdit.Enabled := true;
    ChangeBtn.Enabled := true;
    ChangeEdit.Enabled := true;

    gen := 0;
    genChange := 0;
    IterLbl.Caption := '0';
    ChangeLbl.Caption := '0';

    BestFitDescLbl.Visible := true;
    BestFitGlobalLbl.Visible := true;

    //////////////////////////// LOCATION VIEWER /////////////////////////////////
    if gType = BIN then begin
      LocationGrid.Enabled := true
    end else begin
      LocationChart.Enabled := true;
      XAxisEdit.Enabled := true;
      YAxisEdit.Enabled := true;
      IndivSizeBar.Enabled := true;
    end;


    //////////////////////////// PROGRESS VIEWER /////////////////////////////////
    AllFitChart.Enabled := true;
    BestFitGrid.Enabled := true;
    UpdateProgressChart();

    ////////////////////////// INDIVIDUAL VIEWER /////////////////////////////////
    IndivViewEdit.Enabled := true;
    IndivFitChart.Enabled := true;
    IndivPosGrid.Enabled  := true;

    UpdateForm;
  end;
end;

procedure TMyEA.DefMutRateBtnClick(Sender: TObject);
begin
  mutRateGrid.ColCount := 2;
end;

procedure TMyEA.IndMutRateBtnClick(Sender: TObject);
var i : integer;
  temp : string;
begin
  mutRateGrid.ColCount := dim + 1;
  temp := mutRateGrid.Cells[1,1];
  for i := 0 to dim -1 do begin
    mutRateGrid.Cells[i+1,0] := 'gene ' + IntToStr(i);
    mutRateGrid.Cells[i+1,1] := temp;
  end;
end;

procedure TMyEA.DefMutDistBtnClick(Sender: TObject);
begin
  mutDistGrid.ColCount := 2;
end;

procedure TMyEA.IndMutDistBtnClick(Sender: TObject);
var i : integer;
  temp : string;
begin
  mutDistGrid.ColCount := dim + 1;
  temp := mutDistGrid.Cells[1,1];
  for i := 0 to dim -1 do begin
    mutDistGrid.Cells[i+1,0] := 'gene ' + IntToStr(i);
    mutDistGrid.Cells[i+1,1] := temp;
  end;
end;

procedure TMyEA.IndivViewEditChange(Sender: TObject);
begin
  myPop.FillPosition(IndivViewEdit.Value, IndivPosGrid);
  UpdateIndivChart();
  IndivGrid.Cells[1,0] := FloatToStr(myPop.GetFit(IndivViewEdit.Value));
end;

procedure TMyEA.UpdateIndivChart;
var i : integer;
begin
  IndivSeries.Clear;
  for i := 0 to size - 1 do begin
    if(IndivViewEdit.Value = i) then
      IndivSeries.AddY(myPop.GetFit(i), '', clRed)
    else
      IndivSeries.AddY(myPop.GetFit(i), '', clBlue)
  end;
end;

procedure TMyEA.UpdateBest;
var i: integer;
  tmpArray : TGeneArray;
begin
  if(myPop.GetBestFit < bestFit) then begin
    bestFit := myPop.GetBestFit;
    //BestFitProgLbl.Caption := FloatToStr(bestFit);
    genChange := 0;
    tmpArray := myPop.GetBestPos;
    case gType of
      INT: for i := 0 to dim -1 do
        bestPos.intArr[i] := tmpArray.intArr[i];
      REAL: for i := 0 to dim -1 do
        bestPos.realArr[i] := tmpArray.realArr[i];
      BIN: for i := 0 to dim -1 do
        bestPos.binArr[i] := tmpArray.binArr[i];
    end;
  end;
end;

procedure TMyEA.DoOneGen;
begin
  inc(gen);
  inc(genChange);
  myPop.DoOneGeneration();
  UpdateBest();
  UpdateForm();
end;

procedure TMyEA.OneIterBtnClick(Sender: TObject);
begin
  DoOneGen();
  IterLbl.Caption := IntToStr(gen);
  ChangeLbl.Caption := IntToStr(genChange);
  BestFitGlobalLbl.Caption := FloatToStr(BestFit);
  UpdateProgressChart();
  UpdateForm();
end;

procedure TMyEA.UpdateProgressChart;
begin
  BestFitSeries.AddY(myPop.GetBestFit, '');
  WorstFitSeries.AddY(myPop.GetWorstFit,'');
  AvFitSeries.AddY(myPop.GetAvgFit,'');
  GlobalFitSeries.AddY(myPop.GetBestFit,'');
end;

procedure TMyEA.NIterBtnClick(Sender: TObject);
var i : integer;
begin
  NormalTimer.Enabled := true;
  runFlag := false;
  StopFlagBtn.Visible := true;
  i := 0;
  while ((i < NIterEdit.Value) and (runFlag = false)) do begin
    DoOneGen();
    inc(i);
  end;
  StopFlagBtn.Visible := false;
end;

procedure TMyEA.IterStpBtnClick(Sender: TObject);
begin
  NormalTimer.Enabled := true;
  runFlag := false;
  StopFlagBtn.Visible := true;
  while ((gen < IterStpEdit.Value) and (runFlag = false)) do begin
    DoOneGen();
  end;
  StopFlagBtn.Visible := false;
  NormalTimer.Enabled := false;
end;

procedure TMyEA.ThresBtnClick(Sender: TObject);
begin
  NormalTimer.Enabled := true;
  runFlag := false;
  StopFlagBtn.Visible := true;
  while ((bestFit > ThresEdit.Value) and (runFlag = false))do begin
    DoOneGen();
  end;
  StopFlagBtn.Visible := false;
  NormalTimer.Enabled := false;
end;

procedure TMyEA.ChangeBtnClick(Sender: TObject);
begin
  NormalTimer.Enabled := true;
  runFlag := false;
  StopFlagBtn.Visible := true;
  while ((genChange < ChangeEdit.Value) and (runFlag = false))do begin
    DoOneGen();
  end;
  StopFlagBtn.Visible := false;
  NormalTimer.Enabled := false;
end;


procedure TMyEA.UpdateBatchPage;
begin

end;

procedure TMyEA.UpdateForm;
begin
  case EACtrl.ActivePageIndex of
    LOCINDEX   : UpdateLocationPage();
    PROGINDEX  : UpdateProgressPage();
    INDIVINDEX : UpdateIndividualPage();
    BATCHINDEX : UpdateBatchPage();
  end;
  iterLbl.Caption := IntToStr(gen);
  changeLbl.Caption := IntToStr(genChange);
  BestFitGlobalLbl.Caption := FloatToStr(BestFit);
end;

procedure TMyEA.UpdateIndividualPage;
begin
  if IndivFitChart.Enabled = true then begin
    UpdateIndivChart();
    myPop.FillPosition(IndivViewEdit.Value, IndivPosGrid);
    IndivGrid.Cells[0,1] := FloatToStr(myPop.GetFit(IndivViewEdit.Value));
  end;
end;

procedure TMyEA.UpdateLocationPage;
begin
  case gType of
    INT : if LocationChart.Enabled = true then UpdateLocationChart();
    REAL: if LocationChart.Enabled = true then UpdateLocationChart();
    BIN : if LocationGrid.Enabled  = true then myPop.FillLocation(LocationGrid);
  end;
end;

procedure TMyEA.UpdateProgressPage;
var i : integer;
begin
  if BestFitGrid.Enabled = true then begin
    case gType of
      INT : for i := 0 to dim -1 do
        BestFitGrid.Cells[i+1,1] := IntToStr(BestPos.intArr[i]);
      REAL: for i := 0 to dim -1 do
        BestFitGrid.Cells[i+1,1] := FloatToStr(BestPos.realArr[i]);
      BIN : for i := 0 to dim -1 do
        BestFitGrid.Cells[i+1,1] := IntToStr(BestPos.binArr[i]);
    end;
  end;
end;

procedure TMyEA.UpdateLocationChart;
var i, xDim, yDim: integer;
  x,y: double;
begin
  with LocationSeries do begin
    clear;
    //default values
    x := 0;
    y := 0;
    xDim := XAxisEdit.Value;
    yDim := YAxisEdit.Value;
    for i:= size -1 downto 0 do begin
      case gType of
        INT : begin
          x := myPop.getIndivGene(i, xDim).tInt;
          y := myPop.getIndivGene(i, yDim).tInt;
        end;
        REAL: begin
          x := myPop.getIndivGene(i, xDim).tReal;
          y := myPop.getIndivGene(i, yDim).tReal;
        end;
        //no binary as we use a table to show the location
      end;
      if i = 0 then
        addbubble(x, y, pSize, '', clBlue)
      else
        addbubble(x, y, pSize, '', clRed);
    end;
  end;
end;

procedure TMyEA.IndivSizeBarChange(Sender: TObject);
begin
  SetSize();
  UpdateLocationChart();
end;

procedure TMyEA.SetSize;
begin
  pSize := (IndivSizeBar.Position/IndivSizeBar.Max) * maxPSize;
end;

procedure TMyEA.LocationGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var s: string;
begin
  with Sender as TStringGrid do begin
    if Enabled = true then begin
      if((ACol > 0) and (ARow > 0)) then begin //as long as it is in non-fixed tables
        //Population Grid
        if(StrToInt(Cells[ACol, ARow]) = -1) then
          Canvas.Brush.Color := clBlue
        else
          Canvas.Brush.Color := clRed;

        Canvas.FillRect(Rect);
        s := Cells[ACol, ARow];
        Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, s);
      end;
    end;
  end;
end;

procedure TMyEA.EACtrlChange(Sender: TObject);
begin
  UpdateForm();
end;

procedure TMyEA.NormalTimerTimer(Sender: TObject);
begin
  Application.ProcessMessages;
end;

procedure TMyEA.StopFlagBtnClick(Sender: TObject);
begin
  runFlag := true;
end;

procedure TMyEA.SortBtnClick(Sender: TObject);
begin
 myPop.SortList;
 UpdateForm;
end;

procedure TMyEA.EliteBoxClick(Sender: TObject);
begin
  EliteEdit.Enabled := EliteBox.Checked;
end;

procedure TMyEA.SterileBoxClick(Sender: TObject);
begin
  SterileEdit.Enabled := SterileBox.Checked;
end;

procedure TMyEA.YAxisEditChange(Sender: TObject);
begin
  UpdateLocationChart();
end;

procedure TMyEA.XAxisEditChange(Sender: TObject);
begin
  UpdateLocationChart();
end;

procedure TMyEA.EliteEditChange(Sender: TObject);
begin
  if SterileBox.Checked = true then
    SterileEdit.Max := size - EliteEdit.Value;
end;

procedure TMyEA.SterileEditChange(Sender: TObject);
begin
  if EliteBox.Checked = true then
    EliteEdit.Max := size - SterileEdit.Value;
end;

procedure TMyEA.BRunBtnClick(Sender: TObject);
var i, totalGen, theGen, theChange: integer;
  fileName : string;
  txt : TextFile;
  totalFit,theThres : double;
  thresFlag, genFlag, changeFlag : boolean;
  tmpArray : TDArray;
  tmpString :  string;
begin
  fileName := BSaveEdit.Text;
  if FileExists(fileName) then begin
    if (MessageDlg('File ' + FileName + ' exists. Overwrite?', mtConfirmation,
        [mbOk, mbCancel], 0) = mrCancel) then
        Exit;
  end;

  thresFlag   := BThresBox.Checked;
  genFlag     := BGenBox.Checked;
  changeFlag  := BChangeBox.Checked;

  if((thresFlag = True) or (genFlag = true) or (changeFlag = true)) then begin
    batchFlag := false;
    totalGen := 0;
    totalFit := 0.0;

    theThres  := BThresEdit.Value;
    theGen    := BGenEdit.Value;
    theChange := BChangeEdit.Value;

    AssignFile(txt, fileName);
    Rewrite(txt);
    WriteLn(txt,'EA BATCH FILE TEST at time ' + DateToStr(Date));
    WriteLn(txt,'Problem = '+ GetProbName(pType) + ' Dimensions = '+IntToStr(dim));
    WriteLn(txt,'Parameters');
    WriteLn(txt,'Start Conditions : Max - '+FloatToStrF(MaxEdit.Value, ffExponent,3,2)+
          ' Min - '+FloatToStrF(MinEdit.Value, ffExponent,3,2));
    WriteLn(txt,'Breeding Parameters: CrossType = ' + GetCrossName(CrossRadGrp.ItemIndex)+
          ' CThres - '+FloatToStrF(CrossThresEdit.Value,ffExponent,3,2)+
          ' TSize - '+IntToStr(TournSizeEdit.Value)+
          ' TThres - '+FloatToStrF(TournThresEdit.Value,ffExponent,3,2));
    if EliteBox.Checked = true then
      WriteLn(txt, 'Elites - '+IntToStr(EliteEdit.Value));
    if SterileBox.Checked = true then
      WriteLn(txt, 'Steriles - '+IntToStr(SterileEdit.Value));

    if DefMutRateBtn.Checked = true then
      WriteLn(txt, 'Uniform Mutation Rate - ' + MutRateGrid.Cells[1,1])
    else begin
      tmpString := 'Individual Mutation Rate -';
      for i := 0 to dim -1 do
        tmpString := tmpString + ' ' + MutRateGrid.Cells[i+1,1];
      WriteLn(txt, tmpString);
    end;

    if DefMutDistBtn.Checked = true then
      WriteLn(txt, 'Uniform Mutation Distance - ' + MutDistGrid.Cells[1,1])
    else begin
      tmpString := 'Individual Mutation Distance -';
      for i := 0 to dim -1 do
        tmpString := tmpString + ' ' + MutDistGrid.Cells[i+1,1];
      WriteLn(txt, tmpString);
    end;

    WriteLn(txt,'Stop Conditions:'+
          ' Threshold '+BoolToStr(thresFlag, true)+' - '+FloatToStrF(theThres, ffExponent,3,2)+
          ' Iterations '+BoolToStr(genFlag, true)+' - '+IntToStr(theGen)+
          ' Iter Change '+BoolToStr(changeFlag, true)+' - '+IntToStr(theChange));

    //set up the progress bar and charts
    BProgBar.Max := BRunEdit.Value;

     //set up the stop button
    BStopBtn.Visible := true;
    SBatFit.Clear;
    SBatRun.Clear;

    ////////////////////////////// SET UP CONDITIONS FOR TEST ////////////////

    setLength(tmpArray, dim); //array for mutation amount/rate
    if DefMutRateBtn.Checked = true then
      myPop.SetMRateAll(StrToFloat(MutRateGrid.Cells[1,1]))
    else begin
      for i := 0 to dim -1 do
        tmpArray[i] := StrToFloat(MutRateGrid.Cells[i+1,1]);
      myPop.SetMRateInd(tmpArray);
    end;
    if DefMutDistBtn.Checked = true then
      myPop.SetMDistAll(StrToFloat(MutDistGrid.Cells[1,1]))
    else begin
      for i := 0 to dim -1 do
        tmpArray[i] := StrToFloat(MutDistGrid.Cells[i+1,1]);
      myPop.SetMDistInd(tmpArray);
    end;

    myPop.SetTournSize(TournSizeEdit.Value);
    myPop.SetTournThres(TournThresEdit.Value);
    myPop.SetCrossType(CrossRadGrp.ItemIndex);
    myPop.SetCrossThres(CrossThresEdit.Value);
    if EliteBox.Checked = true then myPop.SetElite(EliteEdit.Value) else myPop.SetElite(0);
    if SterileBox.Checked = true then myPop.SetSterile(SterileEdit.Value) else myPop.SetSterile(0);
    i := 0;
    while ((i < BRunEdit.Value) and (BatchFlag = false)) do begin
      myPop.Initialise(MaxEdit.Value, MinEdit.Value);
      gen := 0;
      genChange := 0;
      BestFit := MAXINT;
      while(((thresFlag = false) or (BestFit > theThres))
            and ((genFlag = false) or (gen < theGen))
            and ((changeFlag = false) or (genChange < theChange))) do begin
        DoOneGen();
      end;
      totalGen := gen + totalGen;
      totalFit := BestFit + totalFit;
      WriteLn(txt,'Run '+IntToStr(i)+': Generations '+IntToStr(gen)+
              ' Best '+FloatToStrF(BestFit, ffExponent,3,2));

      SBatFit.AddY(BestFit,'',clRed);
      SBatRun.AddY(gen,'',clRed);
      BProgBar.Position := i;
      application.ProcessMessages;
    end; //completed all the runs
    if BatchFlag = true then begin
      //user stopped the batch run prematurely
      WriteLn(txt, 'Batch Incomplete');
      WriteLn(txt, '');
      CloseFile(txt);
    end
    else begin
      //pad with line and close file
      WriteLn(txt, 'Batch Complete');
      WriteLn(txt, 'Average Iterations - '+FloatToStrF(totalGen/ BRunEdit.Value,ffExponent,3,2));
      WriteLn(txt, 'Average Fitness - '+FloatToStrF(totalFit/ BRunEdit.Value,ffExponent,3,2));
      WriteLn(txt,'');
      CloseFile(txt);
      BStopBtn.Visible := false;
    end;
  end
  else
    ShowMessage('Sorry, at least one termination criterion must be selected');
end;


procedure TMyEA.RunCtrlChange(Sender: TObject);
begin
  case RunCtrl.ActivePageIndex of
    RUNTAB    : BatchViewPage.TabVisible := false;
    BATCHTAB  : BatchViewPage.TabVisible := true;
  end;
end;

procedure TMyEA.BStopBtnClick(Sender: TObject);
begin
  BatchFlag := true;
end;

end.
