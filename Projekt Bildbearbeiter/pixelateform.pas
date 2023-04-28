//Formular, um Parameter des Bildeffekts Verpixeln einzustellen

unit PixelateForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TPixelateFormular }

  TPixelateFormular = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    EditPixelSize: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure EditPixelSizeChange(Sender: TObject);
    procedure EditPixelSizeEditingDone(Sender: TObject);
    procedure EditPixelSizeKeyPress(Sender: TObject; var Key: char);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  PixelateFormular: TPixelateFormular;

implementation

{$R *.lfm}

uses Hauptunit;

{ TPixelateFormular }

procedure TPixelateFormular.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  PixelateFormular.Close;
  Formular.Rezoom;
  Formular.Bild.Picture.Assign(HauptUnit.LastBmp);
end;

procedure TPixelateFormular.FormShow(Sender: TObject);
begin
  EditPixelsize.SetFocus;
  Formular.PreviewPixelate(StrToInt(EditPixelsize.text));
end;

procedure TPixelateFormular.EditPixelSizeChange(Sender: TObject);
begin
   if not (EditPixelSize.text = '') then
   begin
     if strtoint(EditPixelSize.text) > 500 then EditPixelSize.text := '500';
     if strtoint(EditPixelSize.text) = 0 then EditPixelSize.text := '1';
     Formular.PreviewPixelate(StrToInt(EditPixelsize.text));
   end;
end;

procedure TPixelateFormular.EditPixelSizeEditingDone(Sender: TObject);
begin
  if (EditPixelSize.text = '') then EditPixelSize.text := '5';
end;

procedure TPixelateFormular.EditPixelSizeKeyPress(Sender: TObject; var Key: char);
begin
   if not (key in ['0'..'9',#8]) then key := #0;
end;

procedure TPixelateFormular.CancelButtonClick(Sender: TObject);
begin
  PixelateFormular.Close;
  Formular.Rezoom;
  Formular.Bild.Picture.Assign(HauptUnit.LastBmp);
end;

procedure TPixelateFormular.OKButtonClick(Sender: TObject);
begin
  PixelateFormular.Close;
  Formular.ApplyPixelate(StrToInt(EditPixelsize.text));
end;

end.
