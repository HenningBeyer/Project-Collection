// Formular, um Maße und Name einer Neuen Bitmap zu definieren

unit NeuForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TNeuFormular }

  TNeuFormular = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    Editheight: TEdit;
    Editwidth: TEdit;
    EditFilename: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure EditFilenameEditingDone(Sender: TObject);
    procedure EditFilenameKeyPress(Sender: TObject; var Key: char);
    procedure EditheightChange(Sender: TObject);
    procedure EditheightEditingDone(Sender: TObject);
    procedure EditheightKeyPress(Sender: TObject; var Key: char);
    procedure EditwidthChange(Sender: TObject);
    procedure EditwidthEditingDone(Sender: TObject);
    procedure EditwidthKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  NeuFormular: TNeuFormular;

implementation

{$R *.lfm}

uses Hauptunit;

{ TNeuFormular }

procedure TNeuFormular.EditheightKeyPress(Sender: TObject; var Key: char);
begin
   if not (key in ['0'..'9',#8]) then key := #0;
end;

procedure TNeuFormular.EditheightChange(Sender: TObject);
begin
  if not (EditHeight.text = '') then
  begin
    if strtoint(Editheight.text) > 5000 then Editheight.text := '5000';
    if strtoint(Editheight.text) = 0 then Editheight.text := '1';
  end;
end;

procedure TNeuFormular.EditheightEditingDone(Sender: TObject);
begin
  if (EditHeight.text = '') then EditHeight.text := '200';
end;

procedure TNeuFormular.EditwidthChange(Sender: TObject);
begin
  if not (Editwidth.text = '') then
  begin
    if strtoint(Editwidth.text) > 5000 then Editwidth.text := '5000';
    if strtoint(Editwidth.text) = 0 then Editwidth.text := '1';
  end;
end;

procedure TNeuFormular.EditwidthEditingDone(Sender: TObject);
begin
  if (Editwidth.text = '') then Editwidth.text := '200';
end;

procedure TNeuFormular.EditwidthKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9',#8]) then key := #0;
end;

procedure TNeuFormular.EditFilenameEditingDone(Sender: TObject);
var
  i,j : Byte;
  str : String;
begin
   if (EditFilename.text = '') or (length(EditFilename.text) > 40)
     then EditFilename.text := 'Unbenannt';
   (* falsche mit Strg-V eingefügte Zeichen löschen *)
   str := EditFileName.text;
   j := 0;
   for i:=1 to (length(EditFilename.text) -1) do
   begin
     if (str[i-j] in ['/','\',':','*','?','"','<','>','|']) then
       Begin
         str := str.Remove(i-j-1,1);
         Inc(j);
       end;
   end;
   EditFilename.text := str;
end;

procedure TNeuFormular.EditFilenameKeyPress(Sender: TObject; var Key: char);
begin
  if key in ['/','\',':','*','?','"','<','>','|'] then key := #0
  else if (length(EditFilename.Text) > 40) then key := #0;
end;

procedure TNeuFormular.OKButtonClick(Sender: TObject);
begin
   Formular.CreateNewBmp(StrToInt(EditHeight.Text), StrtoInt(EditWidth.Text), EditFilename.Text);
end;

procedure TNeuFormular.CancelButtonClick(Sender: TObject);
begin
  NeuFormular.Close;
end;

end.

