// Formular zum Speichern von Bilddateien

unit SpeicherForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  PairSplitter, BGRABitmap, BGRABitmapTypes;

type

  { TSpeicherFormular }

  TSpeicherFormular = class(TForm)
    Bevel1: TBevel;
    PathEdit: TEdit;
    AuswahlenButton: TButton;
    FileExtentionCB: TComboBox;
    Bild: TImage;
    Label1: TLabel;
    Label2: TLabel;
    LB: TListBox;
    CancelButton: TButton;
    OKButton: TButton;
    RG: TRadioGroup;
    procedure CancelButtonClick(Sender: TObject);
    procedure AuswahlenButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LBSelectionChange(Sender: TObject; User: boolean);
    procedure OKButtonClick(Sender: TObject);
    procedure RGSelectionChanged(Sender: TObject);
    procedure AddElementsToLB();
  private

  public

  end;

var
  SpeicherFormular: TSpeicherFormular;

type
  WordArray = Array of Word;
implementation

{$R *.lfm}

uses Hauptunit;

{ TSpeicherFormular }

function RemoveSelectedSaveIndexes(const Array_ : Array of Word) : WordArray;
// Löscht die in BildListBox ausgewählten Bitmaps in BmpisSavedArray & gibt neues Array zurück
var i,j,k : integer;
  arr : Array of Word;
begin
  j := 0;
  k := 0;
  Setlength(arr, (length(SaveIndexes) - 1));
  for i:=0 to (SpeicherFormular.LB.Items.Count - 1) do //weißt arr Elemente zu, die nicht selected sind
    begin
      if not (i = SpeicherFormular.LB.ItemIndex) then
      begin
        arr[k] := SaveIndexes[i];
        inc(k);
      end
      else inc(j);
    end;
  result := arr;
end;

procedure TSpeicherFormular.AddElementsToLB();
//Fügt die Namen der zum Speichern festgelegten Dateien zur Lsitbox in Speicherformular zu
var
  i : SmallInt;
begin
  SpeicherFormular.LB.Items.Clear;
  for i in SaveIndexes do
      SpeicherFormular.LB.Items.Add(Formular.BildListBox.Items[i]);
  SpeicherFormular.LB.Selected[0] := True;
end;

procedure TSpeicherFormular.RGSelectionChanged(Sender: TObject);
//Beim Wechsel der Auswahl in der Radiogroup:
begin
  if (RG.ItemIndex = 0) then
  begin
    PathEdit.Enabled:=true;
    FileExtentionCB.Enabled:=True;
    AuswahlenButton.Enabled := True;
  end
  else if (RG.ItemIndex = 1) then
  begin
    PathEdit.Enabled:=False;
    FileExtentionCB.Enabled:=False;
    AuswahlenButton.Enabled := False;
  end;
end;



procedure TSpeicherFormular.OKButtonClick(Sender: TObject);
//Speichert je nach Auswahl in Radiogroup die Dateien
var
  i,j : Word;
  arr : Array of Word;
  path : String;
begin
    if (RG.ItemIndex = 0) then //Alle Dateien Speichern
    begin
      j := 0;
      if (DirectoryExists(PathEdit.Text)) then
      begin
       path := PathEdit.Text; //gelegentlich muss ein '\' angefügt werden
       if (path[length(path)-1] <> '\') then
         path := path + '\';
       for i in SaveIndexes do
       begin
         BmpArray[i].SaveToFile(path + LB.Items[j] + FileextentionCb.Text);
         SavePathArray[i] := path + LB.Items[j] +  FileextentionCb.Text;
         Inc(j);
         BmpisSavedArray[i] := True;
       end;
       SaveIndexes := arr;
       LB.Items.Clear;
       SpeicherFormular.Close;
      end
      else showmessage('Der angegebene Dateipfad ist nicht vorhanden.' + #13 + 'Bitte geben Sie einen neuen Pfad an!');
    end;
    if (RG.Itemindex = 1) //Nur Auswahl einzeln vom Nutzer festgelegten Speicherort speichern
    and (Formular.SavePictureDialog.Execute) then
    begin
      BmpArray[SaveIndexes[LB.ItemIndex]].SaveToFile(Formular.SavePictureDialog.FileName);
      SavePathArray[LB.ItemIndex] := Formular.SavePictureDialog.FileName;
      BmpisSavedArray[LB.ItemIndex] := True;
      SaveIndexes := RemoveSelectedSaveIndexes(SaveIndexes);
      LB.Items.Delete(LB.ItemIndex);
      if (LB.Items.Count = 0) then SpeicherFormular.Close
      else SpeicherFormular.LB.Selected[0] := True;
    end;
end;

procedure TSpeicherFormular.LBSelectionChange(Sender: TObject; User: boolean);
begin
  Bild.Picture.Assign(BmpArray[SaveIndexes[LB.ItemIndex]]);
end;

procedure TSpeicherFormular.CancelButtonClick(Sender: TObject);
begin
  SpeicherFormular.Close;
end;

procedure TSpeicherFormular.AuswahlenButtonClick(Sender: TObject);
begin
  If not (Formular.SelectDirectoryDialog.Execute) then exit;
  PathEdit.Text := Formular.SelectDirectoryDialog.FileName;
end;

procedure TSpeicherFormular.FormShow(Sender: TObject); //Lädt beim Laden das erste Bild der Listbox
begin
  Bild.Picture.Assign(BmpArray[SaveIndexes[LB.ItemIndex]]);
end;



end.

