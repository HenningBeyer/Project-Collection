//Formular, um Parameter des Bildeffekts Motionblur einzustellen

unit MotionBlurForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TMotionBlurFormular }

  TMotionBlurFormular = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    EditDistance: TEdit;
    EditAngle: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure EditDistanceChange(Sender: TObject);
    procedure EditDistanceEditingDone(Sender: TObject);
    procedure EditDistanceKeyPress(Sender: TObject; var Key: char);
    procedure EditAngleChange(Sender: TObject);
    procedure EditAngleEditingDone(Sender: TObject);
    procedure EditAngleKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  MotionBlurFormular: TMotionBlurFormular;

implementation

{$R *.lfm}

uses Hauptunit;

{ TMotionBlurFormular }

procedure TMotionBlurFormular.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  MotionBlurFormular.Close;
  Formular.Rezoom;
  Formular.Bild.Picture.Assign(HauptUnit.LastBmp);
end;

procedure TMotionBlurFormular.FormShow(Sender: TObject);
begin
  EditDistance.SetFocus;
  Formular.PreviewMotionBlur(StrToInt(EditDistance.Text),StrToInt(EditAngle.text));
end;

procedure TMotionBlurFormular.EditAngleChange(Sender: TObject);
begin
  if not (EditAngle.text = '') then
  begin
    if strtoint(EditAngle.text) > 360 then EditAngle.text := '360'; //ein großer Winkel (etwa 1000°) läuft viel langsamer
    if strtoint(EditAngle.text) = 0 then EditAngle.text := '0';
    Formular.PreviewMotionBlur(StrToInt(EditDistance.Text),StrToInt(EditAngle.text));
  end;
end;

procedure TMotionBlurFormular.EditAngleKeyPress(Sender: TObject; var Key: char);
begin
   if not (key in ['0'..'9',#8]) then key := #0;
end;


procedure TMotionBlurFormular.EditDistanceChange(Sender: TObject);
begin
   if not (EditDistance.text = '') then
   begin
     if strtoint(EditDistance.text) > 1000 then EditDistance.text := '1000';
     if strtoint(EditDistance.text) = 0 then EditDistance.text := '1';
     Formular.PreviewMotionBlur(StrToInt(EditDistance.Text),StrToInt(EditAngle.text));
   end;
end;

procedure TMotionBlurFormular.EditDistanceEditingDone(Sender: TObject);
begin
   if (EditDistance.text = '') then EditDistance.text := '10';
end;

procedure TMotionBlurFormular.EditAngleEditingDone(Sender: TObject);
begin
   if (EditDistance.text = '') then EditAngle.text := '0';
end;

procedure TMotionBlurFormular.EditDistanceKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9',#8]) then key := #0;
end;

procedure TMotionBlurFormular.OKButtonClick(Sender: TObject);
begin
  MotionBlurFormular.Close;
  Formular.ApplyMotionBlur(StrToInt(EditDistance.Text),StrToInt(EditAngle.text));
end;

procedure TMotionBlurFormular.CancelButtonClick(Sender: TObject);
begin
  MotionBlurFormular.Close;
  Formular.Rezoom;
  Formular.Bild.Picture.Assign(HauptUnit.LastBmp);
end;

end.

