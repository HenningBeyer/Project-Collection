//Formular, um Parameter des Bildeffekts Resample einzustellen

unit ResampleForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TResampleFormular }

  TResampleFormular = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Editheight: TEdit;
    Editwidth: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure EditheightChange(Sender: TObject);
    procedure EditheightEditingDone(Sender: TObject);
    procedure EditheightKeyPress(Sender: TObject; var Key: char);
    procedure EditwidthChange(Sender: TObject);
    procedure EditwidthEditingDone(Sender: TObject);
    procedure EditwidthKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  ResampleFormular: TResampleFormular;

implementation

{$R *.lfm}

uses Hauptunit;

{ TResampleFormular }


procedure TResampleFormular.EditheightKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9',#8]) then key := #0;
end;

procedure TResampleFormular.EditwidthKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9',#8]) then key := #0;
end;


procedure TResampleFormular.EditwidthChange(Sender: TObject);
begin
  if not (Editwidth.text = '') then
  begin
    if strtoint(Editwidth.text) > 5000 then Editwidth.text := '5000';
    if strtoint(Editwidth.text) = 0 then Editwidth.text := '1';
    Formular.PreviewResample(StrToInt(EditHeight.Text),StrToInt(Editwidth.text));
  end;
end;

procedure TResampleFormular.EditwidthEditingDone(Sender: TObject);
begin
  if (Editwidth.text = '') then Editwidth.text := '200';
end;

procedure TResampleFormular.EditheightEditingDone(Sender: TObject);
begin
  if (EditHeight.text = '') then EditHeight.text := '200';
end;

procedure TResampleFormular.EditheightChange(Sender: TObject);
begin
  if not (EditHeight.text = '') then
  begin
    if strtoint(Editheight.text) > 5000 then Editheight.text := '5000';
    if strtoint(Editheight.text) = 0 then Editheight.text := '1';
    Formular.PreviewResample(StrToInt(EditHeight.Text),StrToInt(Editwidth.text));
  end;
end;

procedure TResampleFormular.CancelButtonClick(Sender: TObject);
begin
  ResampleFormular.Close;
  Formular.Rezoom;
  Formular.Bild.Picture.Assign(HauptUnit.LastBmp);
end;

procedure TResampleFormular.OKButtonClick(Sender: TObject);
begin
  ResampleFormular.Close;
  Formular.ApplyResample(StrToInt(EditHeight.Text),StrToInt(Editwidth.text));
end;


procedure TResampleFormular.FormShow(Sender: TObject);
begin
   EditHeight.SetFocus;
   Formular.PreviewResample(StrToInt(EditHeight.Text),StrToInt(Editwidth.text));
end;

procedure TResampleFormular.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  ResampleFormular.Close;
  Formular.Rezoom;
  Formular.Bild.Picture.Assign(HauptUnit.LastBmp);
end;

end.

