program BildEditor;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, HauptUnit, NeuForm, SpeicherForm, MotionBlurForm, PixelateForm,
  ResampleForm
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='BildEditor';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFormular, Formular);
  Application.CreateForm(TNeuFormular, NeuFormular);
  Application.CreateForm(TSpeicherFormular, SpeicherFormular);
  Application.CreateForm(TMotionBlurFormular, MotionBlurFormular);
  Application.CreateForm(TPixelateFormular, PixelateFormular);
  Application.CreateForm(TResampleFormular, ResampleFormular);
  Application.Run;
end.

