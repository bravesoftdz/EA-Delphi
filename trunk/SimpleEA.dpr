program SimpleEA;

uses
  Forms,
  Main in 'Main.pas' {MyEA},
  Chromosome in 'Chromosome.pas',
  Population in 'Population.pas',
  ProbFrom in 'ProbFrom.pas' {PForm},
  Problem in 'Problem.pas',
  OneMax in 'OneMax.pas',
  Definitions in 'Definitions.pas',
  Origin in 'Origin.pas',
  OriginOff in 'OriginOff.pas',
  Rastrigin in 'Rastrigin.pas',
  Schwefel in 'Schwefel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMyEA, MyEA);
  Application.CreateForm(TPForm, PForm);
  Application.Run;
end.
