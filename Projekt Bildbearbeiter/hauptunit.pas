{ Henning Beyer         08.05-18.06.21
  Lazarus 2.0.12
  Programm 'BildEditor'
  Ein Bildbearbeitungsprogramm         }


{ Shortcuts zur Übersicht im IDE: LShift + alt + 1: Alles einklappen
                                  LShift + alt + 0: Alles ausklappen  }

unit HauptUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, Menus, ActnList, ExtDlgs, Buttons, Spin, Math,
  BGRABitmap, BGRABitmapTypes;  //beinhaltet TRGBABitmap und TPointF

type

  { TFormular }

  TFormular = class(TForm)
    Label1: TLabel;
    MMRedoShortcut: TMenuItem;
    MMUndoShortcut: TMenuItem;
    MMEingravierung: TMenuItem;
    MMKonturen: TMenuItem;
    Resample: TMenuItem;
    MMBewegungsunscharfe: TMenuItem;
    MMBildverarbeitung: TMenuItem;
    MMVerpixeln: TMenuItem;
    MMGrauton: TMenuItem;
    MMFarbkorrektur: TMenuItem;
    MMWeicheFilter: TMenuItem;
    MMRadialerWeichzeichner: TMenuItem;
    MMVerscharfen: TMenuItem;
    MMMedian: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MMAllesAuswahlen: TMenuItem;
    SelectDirectoryDialog: TSelectDirectoryDialog;
    TTBBUndo: TToolButton;
    ToolButton14: TToolButton;
    TTBBRedo: TToolButton;
    TTBSEEcken: TSpinEdit;
    TTBCBFullung: TCheckBox;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton8: TToolButton;
    TTBTBLineWidth: TTrackBar;
    Bild: TImage;
    BildListbox: TListBox;            //ListBox, welche Namen der erzeugten/hochgeladenen Dateien enthält
    TTBLabelLineWidth: TLabel;
    TTBLabelLineWidthValue: TLabel;
    TTBPrimCB: TColorButton;
    TTBSecCB: TColorButton;
    TTBLabelAlpha: TLabel;
    TTBLabelAlphaValue: TLabel;
    MenuItem10: TMenuItem;
    MMAuswahlSpeichernUnter: TMenuItem;
    MMMehrfachauswahl: TMenuItem;
    MMLinksDrehung: TMenuItem;
    MMRechtsdrehung: TMenuItem;
    MMHorizontalSpiegeln: TMenuItem;
    MMVertikalSpiegeln: TMenuItem;
    Dateiliste: TMenuItem;
    MMAnzeigen: TMenuItem;
    MMAuswahlaufheben: TMenuItem;
    MMAuswahlloschen: TMenuItem;
    MMAlleEintrageloschen: TMenuItem;
    MenuItem3: TMenuItem;
    MMNeu: TMenuItem;
    MMAuswahlSpeichern: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem7: TMenuItem;
    OpenPictureDialog: TOpenPictureDialog; //Dialog mit welchem der Nutzer seine Bilddateien hochlädt
    SavePictureDialog: TSavePictureDialog; //Dialog zum Speichern der Bilddateien
    ScrollBarhor: TScrollBar;        //Scrollbars welche für das Bewegen des Bildes benutzt werden
    ScrollBarvrt: TScrollBar;
    Icons: TImageList;               //32x32 Icons für die Schaltflächen
    MainMenu: TMainMenu;             //Mainmenu für die Schaltflächen 'Datei', 'Bearbeiten', Dateiliste
    MenuItem1: TMenuItem;
    MMDateienOffnen: TMenuItem;
    MMAlleSpeichern: TMenuItem;
    MMBeenden: TMenuItem;
    LTBDivider: TToolButton;
    LTBBPipette: TToolButton;
    ToolButton11: TToolButton;
    LTBBEraser: TToolButton;
    LTBBShape: TToolButton;
    LTBBLine: TToolButton;
    LTBBBucket: TToolButton;
    LTBBPencil: TToolButton;
    LTBBrush: TToolButton;
    LTBBZoomout: TToolButton;
    ToolButton13: TToolButton;
    ToolButton15: TToolButton;
    ToolButton2: TToolButton;
    LTBBZoomin: TToolButton;
    LTBBMove: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    LTBBCircle: TToolButton;
    LTBBGradient: TToolButton;
    TopToolBar: TToolBar;
    LeftToolBar: TToolBar;
    TTBTBAlpha: TTrackBar;
    procedure BildListboxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BildMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure BildMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure BildMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LTBBGradientClick(Sender: TObject);
    procedure MMAllesAuswahlenClick(Sender: TObject);
    procedure MMAuswahlSpeichernClick(Sender: TObject);
    procedure MMAuswahlSpeichernUnterClick(Sender: TObject);
    procedure MMBeendenClick(Sender: TObject);
    procedure MMBewegungsunscharfeClick(Sender: TObject);
    procedure MMEingravierungClick(Sender: TObject);
    procedure MMFarbkorrekturClick(Sender: TObject);
    procedure MMGrautonClick(Sender: TObject);
    procedure MMHorizontalSpiegelnClick(Sender: TObject);
    procedure MMKonturenClick(Sender: TObject);
    procedure MMLinksDrehungClick(Sender: TObject);
    procedure MMMedianClick(Sender: TObject);
    procedure MMNeuClick(Sender: TObject);
    procedure MMRadialerWeichzeichnerClick(Sender: TObject);
    procedure MMRechtsdrehungClick(Sender: TObject);
    procedure MMRedoShortcutClick(Sender: TObject);
    procedure MMUndoShortcutClick(Sender: TObject);
    procedure MMVerpixelnClick(Sender: TObject);
    procedure MMVerscharfenClick(Sender: TObject);
    procedure MMVertikalSpiegelnClick(Sender: TObject);
    procedure MMWeicheFilterClick(Sender: TObject);
    procedure ResampleClick(Sender: TObject);
    procedure TTBBRedoClick(Sender: TObject);
    procedure TTBBUndoClick(Sender: TObject);
    procedure TTBPrimCBColorChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure LTBBBucketClick(Sender: TObject);
    procedure LTBBCircleClick(Sender: TObject);
    procedure LTBBEraserClick(Sender: TObject);
    procedure LTBBMoveClick(Sender: TObject);
    procedure LTBBPencilClick(Sender: TObject);
    procedure LTBBPipetteClick(Sender: TObject);
    procedure LTBBLineClick(Sender: TObject);
    procedure LTBBShapeClick(Sender: TObject);
    procedure LTBBZoomoutClick(Sender: TObject);
    procedure MMMehrfachauswahlClick(Sender: TObject);
    procedure MMAuswahlaufhebenClick(Sender: TObject);
    procedure MMAuswahlloschenClick(Sender: TObject);
    procedure MMAlleEintrageloschenClick(Sender: TObject);
    procedure MMAnzeigenClick(Sender: TObject);
    procedure MMDateienOffnenClick(Sender: TObject);
    procedure MMAlleSpeichernClick(Sender: TObject);
    procedure ScrollBarhorChange(Sender: TObject);
    procedure ScrollBarvrtChange(Sender: TObject);
    procedure LTBBrushClick(Sender: TObject);
    procedure LTBBZoominClick(Sender: TObject);
    procedure TTBSecCBColorChanged(Sender: TObject);
    procedure TTBSEEckenChange(Sender: TObject);
    procedure TTBSEEckenKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure TTBTBAlphaChange(Sender: TObject);
    procedure TTBTBLineWidthChange(Sender: TObject);
    (* Selbstdefinitionen: *) //diese werden auch aus anderen Units aufgerufen
    procedure ReZoom();
    procedure CreateNewBmp(h,w : Word; filename : String);
    procedure PreviewResample(h,w : Word);
    procedure PreviewMotionBlur(len,angle : Real);
    procedure PreviewPixelate(Pixelsize : Word);
    procedure ApplyResample(h,w : Word);
    procedure ApplyMotionBlur(len,angle : Real);
    procedure ApplyPixelate(Pixelsize : Word);
  private
  public
  end;

var
  Formular: TFormular;

  BmpArray : Array of TBGRABitmap;     //Array mit allen geladenen Bitmaps
  LastBmp  : TBGRABitmap;              //Bitmap die gerade bearbeitet wird

  SelBildLBIndexes : Array of integer; //Indexe der Ausgewählten BildListBox-Elemente
  CurrSelLBIndex   : SmallInt = -1;    //Gerade ausgewählter ListBoxIndex; Ersatz für BildListBox.itemIndex,
                                       // welcher bei Mehrfachauswahl den letzten Index angibt
  ImageZoomFactor  : Real = 1.0;

  SelColor    : TColor = clBlack;      //Primär-Farbe
  SelSecColor : TColor = clWhite;      //Sekundär-Farbe
  Selalpha    : Byte = 255;            //Deckkraft
  SelPenWidth : Byte = 1;              //Strichstärke


  LastMousePos      : TPointF;         //Letzte Maus-Position auf Bild
  LastMouseClickPos : TPointF;         //Letzte Mausklick-Position auf Bild
  LastFormMousePos  : TPointF;

  pts               : Array of TPointF;
  SelPointCount     : Byte     = 3;    //Ecken-Anzahl

  LMBpressed        : Boolean = False;
  RMBPressed        : Boolean = False;  //Nur für Shortcut benutzt: Rechtsklick auf Bild --> Movetool
  ClickedOnImage    : Boolean = False;
  LastbmpCreated    : Boolean = False;
  DidSelectionChange: Boolean = False;

  SaveIndexes     : Array of Word;   // BmpArray-Indexe, welche gespeichert werden sollen
  BmpisSavedArray : Array of Boolean;// Gibt für Jedes Element an, ob es gespeichert ist
  SavePathArray   : Array of String; //Array mit den angegebenen Speicherpfaden
  UndoArray       : Array of TBGRABitmap; // Array mit letzten Bearbeitungsschritten
  RedoArray       : Array of TBGRABitmap; // Array mit rückgängiggemachten Schritten


implementation

{$R *.lfm}

uses NeuForm,      //Popup-Fenster, um Einstellung für die Erzeugung einer neuen Datei zu ermöglichen
     SpeicherForm, //Popup-Fenster, um Speicher-Einstellungen vor dem Speichern vorzunehmen
     (* Fenster für Effektparameter: *)
     MotionBlurForm,
     PixelateForm,
     ResampleForm;

type  //spezielle Rückgabe-Typen für Funktionen
  IntegerArray    = Array of Integer;
  WordArray       = Array of Word;
  BGRABitmapArray = Array of TBGRABitmap;
  StringArray     = Array of String;
  BoolArray       = Array of Boolean;


{ ### Hilfsfunktionen ### }

{ *** Paths *** }

function GetNameFromPath(const path : String) : String;
var len, ld : Integer;
begin
  len := length(path);
  ld := Lastdelimiter('\', path);
  result := copy(path, ld + 1, len - ld);
end;

{ *** Farben *** }
procedure TColor2RGB(const Color: TColor; var R, G, B: Byte);
begin //Quelle: https://www.delphipraxis.net/4067-rgb-tcolor-rgb.html
  R := Color and $FF;
  G := (Color shr 8) and $FF;
  B := (Color shr 16) and $FF;
end;

function TColor2TBGRAPixel(Color : TColor) : TBGRAPixel;
var  R,G,B : Byte;
begin
  TColor2RGB(Color, R,G,B);
  result := BGRA(R,G,B, SelAlpha);
end;

{ *** Zoom *** }

procedure PlaceImageInCenter(); //Platziert das Bild in der Mitte des Fensters
begin
  Formular.Bild.Left := (Formular.width div 2) -
  (Formular.LeftToolBar.Width) - (Formular.Bild.Width div 2);
  Formular.Bild.Top := (Formular.Height div 2) -
  (Formular.TopToolBar.Height) - (Formular.Bild.Height div 2);
  Formular.ScrollBarvrt.Position:= Formular.ScrollBarvrt.Max div 2;
  Formular.ScrollBarhor.Position:= Formular.ScrollBarhor.Max div 2;
end;

procedure ResetZoom(); //Setzt auf den normalen Zoom zurück
begin
  ImageZoomfactor := 1.0;
  Formular.Bild.Height := LastBmp.Height;
  Formular.Bild.Width := LastBmp.Width;
  PlaceImageInCenter;
end;

procedure BildZoom(zoomout : boolean); //rein- und rauszoomen
const
  min : Real = 0.7;  //0.7^6 = 10%
  max : Real = 1.8; //1.8^6 = 3500%
begin
  if (Zoomout)
      and (ImageZoomFactor < max)
      and (Formular.Bild.Height < 20000)
      and (Formular.Bild.Width < 20000) //Gegen Fehler bei Rießigen Bildern
  then ImageZoomFactor := ImageZoomFactor + 0.025
  else if (not Zoomout) and (ImageZoomFactor > min)
    then ImageZoomFactor := ImageZoomFactor - 0.025;
  Formular.Bild.Height := round(LastBmp.Height * power(Imagezoomfactor, 6));
  Formular.Bild.Width := round(LastBmp.Width * power(Imagezoomfactor, 6));
  PlaceImageInCenter;
end;

procedure TFormular.ReZoom();   // Wendet den aktuellen Zoom wieder an
begin
    Formular.Bild.Height := round(LastBmp.Height * power(Imagezoomfactor, 6));
    Formular.Bild.Width := round(LastBmp.Width * power(Imagezoomfactor, 6));
    PlaceImageInCenter;
end;

{ *** Arrays *** }

{ ... SelBildLBIndexes-Array ... }

function GetSelectedLBIndexes() : IntegerArray; //Gibt alle Indexe der BildListBox in steigender Reihenfolge zurück
var i,j : integer;
  arr : Array of integer;
begin
  j := 0;
  Setlength(arr, Formular.BildListBox.SelCount);
  if ((Formular.BildListBox.Items.Count - 1) > 0) then
  begin
  for i:=0 to (Formular.BildListBox.Items.Count - 1) do
    begin
      if Formular.BildListBox.Selected[i] = True then
      begin
      arr[j] := i;
      Inc(j);
      end;
    end;
  end;
  result := arr;
end;

{ ... BmpArray ... }

function AppendNewEntries(const newarr, oldarr : Array of TBGRABitmap) : BGRABitmapArray; overload;
//Gibt Array mit angefügten Elementen zurück
var arr : Array of TBGRABitmap;
  i : integer;
begin
  Setlength(arr, length(newarr) + length(oldarr));
  for i:=0 to (length(oldarr)-1) do
    arr[i] := oldarr[i];
  for i:=(length(oldarr)) to (length(arr)-1) do
    arr[i] := newarr[i-length(oldarr)];
  result := arr;
end;

function RemoveSelected(const Array_ : Array of TBGRABitmap) : BGRABitmapArray; overload;
// Löscht die in BildListBox ausgewählten Bitmaps in BmpArray & gibt neues BGRABitmapArray zurück
var i,j,k : integer;
  arr : Array of TBGRABitmap;
begin
  j := 0;
  k := 0;
  Setlength(arr, (length(BmpArray) - length(SelBildLBIndexes)));
  for i:=0 to (Formular.BildListBox.Items.Count - 1) do //weißt arr Elemente zu, die nicht selected sind
    begin
      if not (i = SelBildLBIndexes[j]) then
      begin
        arr[k] := BmpArray[i];
        inc(k);
      end
      else
      begin
        BmpArray[i].Bitmap.Free; //Memory freigeben
        Inc(j);
      end;
    end;
  result := arr;
end;

{ ... BmpisSavedArray ... }

function AddNEntries(n : Word; const arr : Array of Boolean) : BoolArray; overload;
//Gibt Array mit N angefügten Elementen zurück
var
  arr_ : Array of Boolean;
  i : Word;
begin
  Setlength(arr_, length(arr) + n);
  if (length(arr) > 0) then
  begin
    for i:=0 to (length(arr) - 1) do
    begin
      arr_[i] := arr[i];
    end;
    for i:=(length(arr)) to (length(arr) - 1 + n) do arr_[i] := True; //Alle neuen Einträge zählen als gespeichert
  end
  (* Falls BmpArray zu ersten mal initialisiert wird *)
  else
    for i:=0 to n do arr_[i] := True; //Alle neuen Einträge zählen als gespeichert
  result := arr_;
end;

function RemoveSelected(const Array_ : Array of Boolean) : BoolArray; overload;
// Löscht die in BildListBox ausgewählten Bitmaps in BmpisSavedArray & gibt neues Array zurück
var i,j,k : integer;
  arr : Array of Boolean;
begin
  j := 0;
  k := 0;
  Setlength(arr, (length(BmpisSavedArray) - length(SelBildLBIndexes)));
  for i:=0 to (Formular.BildListBox.Items.Count - 1) do //weißt arr Elemente zu, die nicht selected sind
    begin
      if not (i = SelBildLBIndexes[j]) then
      begin
        arr[k] := BmpisSavedArray[i];
        inc(k);
      end
      else inc(j);
    end;
  result := arr;
end;

{ ... SaveIndexesArray ... }

function AddNEntries(n : Word; const arr : Array of Word) : WordArray; overload;
//Gibt Array mit N angefügten leeren Elementen zurück
var
  arr_ : Array of Word;
  i : Word;
begin
  Setlength(arr_, length(arr) + n);
  for i:=0 to (length(arr) - 1) do arr_[i] := arr[i];
  result := arr_;
end;

{ ... SavepathArray ... }

function AppendNewEntries(const newarr, oldarr : Array of String) : StringArray; overload;
//Gibt Array mit angefügten Elementen zurück
var arr : Array of String;
  i : integer;
begin
  Setlength(arr, length(newarr) + length(oldarr));
  for i:=0 to (length(oldarr)-1) do
    arr[i] := oldarr[i];
  for i:=(length(oldarr)) to (length(arr)-1) do
    arr[i] := newarr[i-length(oldarr)];
  result := arr;
end;

function AddNEntries(n : Word; const arr : Array of String) : StringArray; overload;
//Gibt Array mit N angefügten leeren Elementen zurück
var
  arr_ : Array of String;
  i : Word;
begin
  Setlength(arr_, length(arr) + n);
  if (length(arr) > 0) then
  begin
    for i:=0 to (length(arr) - 1) do
    begin
      arr_[i] := arr[i];
    end;
  end;
  result := arr_;
end;

function RemoveSelected(const Array_ : Array of String) : StringArray; overload;
// Löscht die in BildListBox ausgewählten Bitmaps in BmpisSavedArray & gibt neues Array zurück
var i,j,k : integer;
  arr : Array of String;
begin
  j := 0;
  k := 0;
  Setlength(arr, (length(SavepathArray) - length(SelBildLBIndexes)));
  for i:=0 to (Formular.BildListBox.Items.Count - 1) do //weißt arr Elemente zu, die nicht selected sind
    begin
      if not (i = SelBildLBIndexes[j]) then
      begin
        arr[k] := SavepathArray[i];
        inc(k);
      end
      else inc(j);
    end;
  result := arr;
end;

{ ... Undo, Redo, UndoArray & RedoArray ... }

procedure Undo();
// das Derzeitige Bild wird in RedoArray bei Index 0 eingefügt und andere Elemente hochgeschoben
// Das letzte Element in UndoArray wird entfernt und der derzeitigen Bitmap zugewiesen
var i : Word;
  arr, arr_ : Array of TBGRABitmap;
begin
  if length(UndoArray) = 0 then exit;
  Setlength(arr,  length(UndoArray) - 1);
  Setlength(arr_, length(RedoArray) + 1);
  BmpisSavedArray[CurrSelLBIndex] := False;
  arr_[0] := LastBmp.Duplicate;
  LastBmp.Assign(UndoArray[length(UndoArray) - 1]);
  Formular.Bild.Picture.Assign(LastBmp);
  (* RedoArray-Elemente hochschieben *)
  if (length(RedoArray) > 0) then
    for i:=1 to length(RedoArray) do
        arr_[i] := RedoArray[i-1].Duplicate;
  (* letztes Element löschen und UndoArray-Elemente hochschieben *)
  if (length(UndoArray) > 1) then
    for i:=0 to (length(UndoArray) - 2) do
      arr[i] := UndoArray[i].Duplicate;
  if length(UndoArray) > 0 then
    for i:=0 to length(UndoArray) -1 do Undoarray[i].Free;
  if length(redoarray) > 0 then
    for i:=0 to length(RedoArray) -1 do Redoarray[i].Free;
  UndoArray := arr;
  RedoArray := arr_;
  if length(UndoArray) = 0 then
    Formular.TTBBUndo.Enabled := False;
  Formular.TTBBRedo.Enabled := True;
  Formular.Bild.refresh;
end;

procedure Redo();
// Das letzte Bild wird hinten an UndoArray angefügt.
// Das erste RedoArray-Element wird angezeigt und aus RedoArray entfernt. Elemente werden runtergeschoben
var i : Word;
  arr, arr_ : Array of TBGRABitmap;
begin
  if length(RedoArray) = 0 then exit;
  Setlength(arr,  length(UndoArray) + 1);
  Setlength(arr_, length(RedoArray) - 1);
  BmpisSavedArray[CurrSelLBIndex] := False;
  (* letztes UndoArray-Element mit aktueller Bitmap setzen *)
  arr[length(arr) - 1] := LastBmp.Duplicate;
  (* Letzte Bitmap auf erstes Element in Redoarray setzen *)
  LastBmp.Assign(RedoArray[0]);
  Formular.Bild.Picture.Assign(LastBmp);
  (* Alte UndoArray-Elemente unter dem neuen Element einfügen *)
  if (length(UndoArray) > 0) then
    for i:=0 to length(UndoArray) - 1 do
      arr[i] := UndoArray[i].Duplicate;
  (* erstes Element in RedoArray löschen und Elemente eine Stelle runterschieben *)
  for i:=1 to length(RedoArray) - 1 do
    arr_[i-1] := RedoArray[i].Duplicate;
  if length(UndoArray) > 0 then
    for i:=0 to length(UndoArray) -1 do Undoarray[i].Free;
  if length(redoarray) > 0 then
    for i:=0 to length(RedoArray) -1 do Redoarray[i].Free;
  UndoArray := arr;
  RedoArray := arr_;
  Formular.TTBBUndo.Enabled := True;
  if length(RedoArray) = 0 then
    Formular.TTBBRedo.Enabled := False;
  Formular.Bild.refresh;
end;

procedure UndoRedoOnDraw();
// aktualisiert Undo- ud RedoArray bei jedem Malschritt
// Am Ende von UndoArray wird aktuelle Bitmap angefügt; RedoArray wird neu definiert
var i : Word;
  arr, arr_ : Array of TBGRABitmap;
  test : Array of TBGRABitmap;
begin
  (* Maximale Undo- und Redoschritte werden auf 15 beschränkt *)
  if (length(UndoArray) < 15) then
     Setlength(arr,  length(UndoArray) + 1)
  else Setlength(arr, 15);
  Setlength(arr_, 0);
  if (length(UndoArray) > 0) then
  begin
    if (length(UndoArray) < 15) then
          for i:=0 to length(UndoArray) - 1 do arr[i] := UndoArray[i].Duplicate //Kopieren der alten Elemente
    else  for i:=1 to length(UndoArray) - 1 do arr[i-1] := UndoArray[i].Duplicate; //Bei Limitüberschreitung wird ältestes Element gelöscht
  end;
  (* letzte Elemente anfügen *)
  if (length(UndoArray) < 15) then arr[length(UndoArray)] := LastBmp.Duplicate
                             else arr[length(UndoArray) - 1] := LastBmp.Duplicate;

  if length(UndoArray) > 0 then for i:=0 to length(UndoArray) -1 do Undoarray[i].Free;
  if length(redoarray) > 0 then for i:=0 to length(RedoArray) -1 do Redoarray[i].Free;
  UndoArray := arr;
  RedoArray := arr_;
  Formular.TTBBUndo.Enabled := True;
  Formular.TTBBRedo.Enabled := False;
end;

procedure ClearUndoRedoArrays();
//setzt Undo- und RedoArray zurück
var i : Word;
  arr : Array of TBGRABitmap;
begin
  if length(UndoArray) > 0 then
    for i:=0 to length(UndoArray) -1 do Undoarray[i].Free;
  if length(redoarray) > 0 then
    for i:=0 to length(RedoArray) -1 do Redoarray[i].Free;
  UndoArray := arr;
  RedoArray := arr;
  Formular.TTBBUndo.Enabled := False;
  Formular.TTBBRedo.Enabled := False;
end;

{ *** Punkte *** }

procedure ReCreatePointArray(n : byte);
var arr : Array of TPointF;
  i : Byte;
begin
  SetLength(arr, n);
  pts := arr;
end;

procedure MakePolygon(center : TPointF; n : byte; r,startangle : Real);
//Erzeugt das Punkte-Array für das Formenmalen
var angle : Real; //angle in Grad
  i : Byte;
begin
   ReCreatePointArray(n);
   angle := startangle;
   for i:=0 to (n-1) do
   begin
     pts[i].X := 0 * cos(degtorad(angle)) - r * sin(degtorad(angle)) + center.X; //rotationsmatrix
     pts[i].Y := 0 * sin(degtorad(angle)) + r * cos(degtorad(angle)) + center.Y;
     angle := angle + 360/n;
   end;
end;

{ ### Komponenten ### }

{ *** Scroolbars *** }

procedure TFormular.ScrollBarhorChange(Sender: TObject);
// Bewegt Bild mit Scrollbar
begin
  if not (LMBPressed) then
   Bild.Left := round(Formular.width*(ScrollBarhor.Position/ScrollBarHor.Max)) -
             (Formular.LeftToolBar.Width) - (Bild.Width div 2);
end;

procedure TFormular.ScrollBarvrtChange(Sender: TObject);
// Bewegt Bild mit Scrollbar
begin
  if not (LMBPressed) then
   Bild.Top := round(Formular.height*(ScrollBarvrt.Position/ScrollBarvrt.Max)) -
            (Formular.TopToolBar.Height) - (Bild.Height div 2);
end;

{ *** Formular *** }

procedure TFormular.FormCreate(Sender: TObject);
begin
  LastBmp := TBGRABitmap.Create(0,0,BGRAWhite);
  OpenPictureDialog.InitialDir := ExtractFilePath(Application.ExeName);
  SavePictureDialog.InitialDir := ExtractFilePath(Application.ExeName);
  OpenPictureDialog.Options := OpenPictureDialog.Options + [ofAllowMultiSelect]; //hiermit kann man mehrere Dateien gleichzeitig öffnen
  Formular.ScrollBarvrt.Visible := False;
  Formular.ScrollBarhor.Visible := False;
end;

{ *** LeftToolbar *** }

procedure UnDownAllLTBButtons();
// Alle Schaltflächen der linken Toolbar zählen nach dieser Prozedur nicht mehr als gedrückt
var i : integer;
begin
   for i:=0 to (Formular.LeftToolBar.ButtonCount -1) do
   Formular.LeftToolBar.Buttons[i].Down := False;
end;


{ ### KeyEvents ### }

{ *** MainMenu *** }

{ ... Datei ... }

procedure TFormular.MMBeendenClick(Sender: TObject);
begin
  Formular.Close;
end;

procedure TFormular.MMNeuClick(Sender: TObject);
begin
  NeuFormular.ShowModal;
end;

procedure TFormular.CreateNewBmp(h,w : Word; filename : String);
//Aufruf von NeuFormular bei Bestätigung
//Erzeugt neue Bitmap für das Malen
begin
  NeuFormular.Close;
    if (CurrSelLBIndex <> -1) then // letzte Änderung Speichern
       BmpArray[CurrSelLBIndex].Assign(LastBmp);
    LastBmp := TBGRABitmap.Create(w,h,BGRAWhite);
    BmpArray := AppendNewEntries(TBGRABitmap.Create(w,h,BGRAWhite), BmpArray);
    BmpisSavedArray := AddNEntries(1,BmpisSavedArray);
    SavePathArray := AddNEntries(1, SavePathArray);
    Formular.BildListBox.Items.Add(filename); //fügt den Name der Listbox hinzu
    Bild.Picture.Bitmap.Assign(LastBmp);
    Bild.Canvas.Refresh;
    BildListBox.Selected[Bildlistbox.Items.Count - 1] := True; //letztes Element auswählen
    BildListBox.ItemIndex := Bildlistbox.Items.Count - 1;
    CurrSelLBIndex := BildListBox.ItemIndex;
    BildListBox.Visible := True;
    Bild.Visible := True;
    MMAnzeigen.Checked:= True;
    SelBildLBIndexes := GetSelectedLBIndexes;
    PlaceImageinCenter;
    Formular.ScrollBarvrt.Visible := True;
    Formular.ScrollBarhor.Visible := True;
    ResetZoom;
    LastBmpCreated := True;
    ClearUndoRedoArrays;
end;

procedure TFormular.MMDateienOffnenClick(Sender: TObject);
var path : string;
  i      : integer;
  bmparr : Array of TBGRABitmap;
begin
  i := 0;
  if not OpenPictureDialog.Execute then exit;
  for path in OpenPictureDialog.Files do //Dateinamen der ListBox hinzufügen
  begin
    Inc(i);
    BildListBox.Items.Add(GetNameFromPath(path));
  end;
  Setlength(bmparr, OpenPictureDialog.Files.Count);
  i := 0;
  for path in OpenPictureDialog.Files do  // Dateien dem BmpArray hinzufügen
  begin
    bmparr[i] := TBGRABitmap.Create(path);
    Inc(i);
  end;
  BmpArray := AppendNewEntries(bmparr,BmpArray);
  BmpisSavedArray := AddNEntries(OpenPictureDialog.Files.Count,BmpisSavedArray);
  SavePathArray := AddNEntries(OpenPictureDialog.Files.Count, SavePathArray);
  (* bei einem ausgewählten Element wird dieses abgewählt (egal ob Mehrfachauswahl) *)
  if BildListBox.SelCount = 1 then
  begin
    BmpArray[CurrSelLBIndex].Assign(LastBmp);
    BildListBox.Selected[CurrSelLBIndex] := False;
    CurrSelLBIndex := -1;
  end;
  (* Nur bei einem/keinem ausgewählten Element wird das erste neugeladene Element ausgwählt *)
  if not (BildListBox.SelCount > 1) then
  begin
      BildlistBox.selected[length(BmpArray) - OpenPictureDialog.Files.Count] := True;
      BildListBox.ItemIndex := length(BmpArray) - OpenPictureDialog.Files.Count;
      CurrSelLBIndex := BildListBox.ItemIndex;
  end;
  (* Laden des aktuellen Bildes *)
  if (CurrSelLBIndex <> -1) then
    begin
     LastBmp.Assign(BmpArray[CurrSelLBIndex]);
     Bild.Picture.Assign(LastBmp);
     Bild.Canvas.Refresh;
    end
  else
   begin
    LastBmp.Assign(BmpArray[0]);
    Bild.Picture.Assign(LastBmp);
    Bild.Canvas.Refresh;
   end;
  BildListBox.Visible := True;
  Bild.Visible := True;
  LastBmpCreated := True;
  MMAnzeigen.Checked:= True;
  SelBildLBIndexes := GetSelectedLBIndexes;
  PlaceImageinCenter;
  Formular.ScrollBarvrt.Visible := True;
  Formular.ScrollBarhor.Visible := True;
  ResetZoom;
  ClearUndoRedoArrays;
end;

procedure TFormular.MMAuswahlSpeichernClick(Sender: TObject);
//Speichert alle ausgewählten Elemente, welche verändert wurden oder nicht gespeichert sind
var
    i : ShortInt;
    j : ShortInt = 0;
  arr : Array of Word;
begin
  if (BildListBox.Count > 0) then
   begin
     if (CurrSelLBIndex <> -1) then // letzte Änderung Speichern
        BmpArray[CurrSelLBIndex].Assign(LastBmp);
     SelBildLBIndexes := GetSelectedLBIndexes;
     for i in SelBildLBIndexes do
     begin
       if (SavePathArray[i] <> '') and not (BmpisSavedArray[i]) then //Falls Speicherort festgelegt wird dort gespeichert
        begin
         BmpArray[i].SaveToFile(SavePathArray[i]);
         BmpisSavedArray[i] := True;
        end
       else if (SavePathArray[i] = '') and not (BmpisSavedArray[i]) then Inc(j);
     end;
     if (j > 0) then
     begin
       Setlength(arr,j);
       j := 0;
       for i in SelBildLBIndexes do
       begin
         if not (BmpisSavedArray[i]) then
         begin
           arr[j] := i;
           Inc(j);
         end;
       end;
       if (j <> 0) then
       (* Falls es Elemente gibt, für welche der Speicherort vom Nutzer festgelegt werden muss,
          werden ausgewählte Elemente in ListBox in Speicherform üertragen *)
         SaveIndexes := arr;
         SpeicherFormular.AddElementsToLB;
         SpeicherFormular.ShowModal;
       end;
   end;
  ClearUndoRedoArrays;
end;

procedure TFormular.MMAuswahlSpeichernUnterClick(Sender: TObject);
// legt den Speicherort für alle Elemente neu fest
var
    i,j : ShortInt;
    arr : Array of Word;
begin
  if (BildListBox.ItemIndex <> -1) then
  begin
    if (CurrSelLBIndex <> -1) then // letzte Änderung Speichern
       BmpArray[CurrSelLBIndex].Assign(LastBmp);
    SelBildLBIndexes := GetSelectedLBIndexes;
    Setlength(arr, length(SelBildLBIndexes));
    j := 0;
    for i in SelBildLBIndexes do
    begin
      arr[j] := i;
      Inc(j);
    end;
    SaveIndexes := arr;
    SpeicherFormular.AddElementsToLB; //Überträgt ausgewählte Elemente in ListBox in Speicherform
    SpeicherFormular.ShowModal;
  end;
  ClearUndoRedoArrays;
end;

procedure TFormular.MMAlleSpeichernClick(Sender: TObject);
//Speichert alle Bitmaps, welche verändert wurden oder nicht gespeichert sind
var
  i,j : SmallInt;
  arr: Array of Word;
begin
  if (BildListBox.Count > 0) then
  begin
    if (CurrSelLBIndex <> -1) then // letzte Änderung Speichern
       BmpArray[CurrSelLBIndex].Assign(LastBmp);
    SetLength(arr,BildListBox.Items.Count);
    j := 0;
    for i:=0 to (BildListBox.Items.Count - 1) do
    begin
      if (SavePathArray[i] <> '') and not (BmpisSavedArray[i]) then //Falls Speicherort festgelegt wird dort gespeichert
       begin
        BmpArray[i].SaveToFile(SavePathArray[i]);
        BmpisSavedArray[i] := True;
       end
      else if (SavePathArray[i] = '') and not (BmpisSavedArray[i]) then Inc(j);
    end;
    Setlength(arr, j);
    j := 0;
    for i:=0 to (BildListBox.Items.Count - 1) do
    begin
      if not (BmpisSavedArray[i]) then
      begin
        arr[j] := i;
        Inc(j);
      end;
    end;
    if (j <> 0) then
    (* Falls es Elemente gibt, für welche der Speicherort vom Nutzer festgelegt werden muss,
       werden ausgewählte Elemente in ListBox in Speicherform üertragen *)
    begin
      SaveIndexes := arr;
      SpeicherFormular.AddElementsToLB;
      SpeicherFormular.ShowModal;
    end;
  end;
  ClearUndoRedoArrays;
end;

{ ... Dateiliste ... }

procedure TFormular.MMAnzeigenClick(Sender: TObject);
begin
  BildListBox.Visible := not BildListBox.Visible;
  MMAnzeigen.Checked := BildListBox.Visible;
end;

procedure TFormular.MMMehrfachauswahlClick(Sender: TObject);
begin
  BildListBox.MultiSelect:= not MMMehrfachauswahl.Checked;
  MMMehrfachauswahl.Checked := not MMMehrfachauswahl.Checked;
  SelBildLBIndexes := GetSelectedLBIndexes;
end;

procedure TFormular.MMAuswahlaufhebenClick(Sender: TObject);
begin
  BmpArray[CurrSelLBIndex].Assign(LastBmp);
  BildListBox.ClearSelection;
  SelBildLBIndexes := GetSelectedLBIndexes;
  Bild.Canvas.Clear;
  Bild.Visible := False;
  Formular.ScrollBarvrt.Visible := False;
  Formular.ScrollBarhor.Visible := False;
end;

procedure TFormular.MMAuswahlloschenClick(Sender: TObject);
var i : integer;
  delcount : integer = 0;
begin
  CurrSelLBindex := -1;
  SelBildLBIndexes := GetSelectedLBIndexes;
  if length(SelBildLBIndexes) = 0 then exit;
  BmpArray := RemoveSelected(BmpArray);
  BmpisSavedArray := RemoveSelected(BmpisSavedArray);
  SavePathArray := RemoveSelected(SavePathArray);
  for i in SelBildLBIndexes do
  begin
  BildListBox.Items.Delete(i-delcount);
  Inc(delcount);
  end;
  SelBildLBIndexes := GetSelectedLBIndexes;
  Bild.Canvas.Clear;
  Bild.Visible := False;
  Formular.ScrollBarvrt.Visible := False;
  Formular.ScrollBarhor.Visible := False;
  ClearUndoRedoArrays;
end;

procedure TFormular.MMAlleEintrageloschenClick(Sender: TObject);
var
  arr : Array of TBGRABitmap;
  arr_ : Array of String;
  arr__ : Array of Boolean;
  i : SmallInt;
begin
  for i:=0 to (BildListBox.Count - 1) do BmpArray[i].Free;
  BildListBox.Items.Clear;
  BmpArray := arr;
  BmpisSavedArray := arr__;
  SavePathArray := arr_;
  BildListBox.Visible:=False;
  MMAnzeigen.Checked:=False;
  SelBildLBIndexes := GetSelectedLBIndexes;

  Bild.Picture.Bitmap.Clear;
  Formular.ScrollBarvrt.Visible := False;
  Formular.ScrollBarhor.Visible := False;
  CurrSelLBIndex := -1;
  ClearUndoRedoArrays;
end;

procedure TFormular.MMAllesAuswahlenClick(Sender: TObject);
begin
  BildListBox.MultiSelect:=True;
  MMMehrfachauswahl.Checked := True;
  BildListBox.SelectAll;
  SelBildLBIndexes := GetSelectedLBIndexes;
end;


{ ### BildEffekte ### }


procedure TFormular.MMBewegungsunscharfeClick(Sender: TObject);
begin
  if (LastBmpCreated) then
  MotionBlurFormular.Showmodal;
end;

procedure TFormular.PreviewMotionBlur(len,angle : Real);
// Preview bei welchem nur auf die Bildfläche gemalt wird
var
  bmp : TBGRABitmap;
begin
  bmp := LastBmp.Duplicate;
  bmp := Bmp.FilterBlurMotion(len,angle,False);
  Formular.Bild.Picture.Assign(bmp);
  Rezoom;
  Formular.Bild.refresh;
  bmp.Free;
end;

procedure TFormular.ApplyMotionBlur(len,angle : Real);
begin
  UndoRedoOnDraw;
  LastBmp := LastBmp.FilterBlurMotion(len,angle,False);
  Formular.Bild.Picture.Assign(LastBmp);
  Rezoom;
  Formular.Bild.refresh;
  BmpisSavedArray[CurrSelLBIndex] := False;
end;

procedure TFormular.MMEingravierungClick(Sender: TObject);
var
  p : TPoint;
begin
  if (LastBmpCreated) then
  begin
   UndoRedoOnDraw;
   p := Point(0,0);
   LastBmp := LastBmp.FilterEmbossHighlight(False,TColor2TBGRAPixel(SelColor),p);
   LastBmp.Draw(Formular.Bild.Canvas,0,0);
   Formular.Bild.refresh;
   BmpisSavedArray[CurrSelLBIndex] := False;
  end;
end;

procedure TFormular.MMFarbkorrekturClick(Sender: TObject);
begin
  if (LastBmpCreated) then
  begin
   UndoRedoOnDraw;
   LastBmp := LastBmp.FilterNormalize;
   LastBmp.Draw(Formular.Bild.Canvas,0,0);
   Formular.Bild.refresh;
   BmpisSavedArray[CurrSelLBIndex] := False;
  end;
end;

procedure TFormular.MMGrautonClick(Sender: TObject);
begin
  if (LastBmpCreated) then
  begin
   UndoRedoOnDraw;
   LastBmp := LastBmp.FilterGrayscale;
   LastBmp.Draw(Formular.Bild.Canvas,0,0);
   Formular.Bild.refresh;
   BmpisSavedArray[CurrSelLBIndex] := False;
  end;
end;

procedure TFormular.MMHorizontalSpiegelnClick(Sender: TObject);
begin
  if (LastBmpCreated) then
  begin
   UndoRedoOnDraw;
   LastBmp.HorizontalFlip;
   LastBmp.Draw(Formular.Bild.Canvas,0,0);
   Formular.Bild.refresh;
   BmpisSavedArray[CurrSelLBIndex] := False;
  end;
end;

procedure TFormular.MMKonturenClick(Sender: TObject);
begin
  if (LastBmpCreated) then
  begin
  UndoRedoOnDraw;
  LastBmp := LastBmp.FilterContour(False);
  LastBmp.Draw(Formular.Bild.Canvas,0,0);
  Formular.Bild.refresh;
  BmpisSavedArray[CurrSelLBIndex] := False;
  end;
end;

procedure TFormular.MMLinksDrehungClick(Sender: TObject);
begin
  if (LastBmpCreated) then
  begin
   UndoRedoOnDraw;
   LastBmp := LAstBmp.RotateCCW;
   Bild.Picture.Assign(LastBmp);
   Formular.Bild.refresh;
   BmpisSavedArray[CurrSelLBIndex] := False;
  end;
end;

procedure TFormular.MMMedianClick(Sender: TObject);
var i : Byte;
begin
  if (LastBmpCreated) then
  begin
   UndoRedoOnDraw;
   for i:=0 to 5 do
     LastBmp := LastBmp.FilterMedian(moHighSmooth);
   LastBmp.Draw(Formular.Bild.Canvas,0,0);
   Formular.Bild.refresh;
   BmpisSavedArray[CurrSelLBIndex] := False;
  end;
end;

procedure TFormular.MMRadialerWeichzeichnerClick(Sender: TObject);
begin
  if (LastBmpCreated) then
  begin
  UndoRedoOnDraw;
  if (Bild.Width > Bild.Height) then
    LastBmp := LastBmp.FilterBlurRadial(Bild.Picture.Width div 40,rbfast)
  else
   LastBmp := LastBmp.FilterBlurRadial(Bild.Picture.Height div 40,rbfast);
   LastBmp.Draw(Formular.Bild.Canvas,0,0);
   Bild.refresh;
   BmpisSavedArray[CurrSelLBIndex] := False;
  end;
end;

procedure TFormular.MMRechtsdrehungClick(Sender: TObject);
begin
  if (LastBmpCreated) then
  begin
   UndoRedoOnDraw;
   LastBmp := LastBmp.RotateCW;
   Bild.Picture.Assign(LastBmp);
   Formular.Bild.refresh;
   BmpisSavedArray[CurrSelLBIndex] := False;
  end;
end;

procedure TFormular.MMUndoShortcutClick(Sender: TObject); //Unsichtbare Schaltfläche (Shortcut Strg + Z)
begin
  Undo;
end;

procedure TFormular.MMRedoShortcutClick(Sender: TObject); //Unsichtbare Schaltfläche (Shortcut Strg + R)
begin
  Redo;
end;

procedure TFormular.MMVerpixelnClick(Sender: TObject);
begin
  if (LastBmpCreated) then
   PixelateFormular.Showmodal;
end;

procedure TFormular.PreviewPixelate(pixelsize : Word);
// Preview bei welchem nur auf die Bildfläche gemalt wird
var
  bmp : TBGRABitmap;
begin
  bmp := LastBmp.Duplicate;
  bmp := Bmp.FilterPixelate(Pixelsize,True);
  Formular.Bild.Picture.Assign(bmp);
  Rezoom;
  Formular.Bild.refresh;
  bmp.Free;
end;

procedure TFormular.ApplyPixelate(pixelsize : Word);
begin
  UndoRedoOnDraw;
  LastBmp := LastBmp.FilterPixelate(Pixelsize,True);
  Formular.Bild.Picture.Assign(LastBmp);
  Rezoom;
  Formular.Bild.refresh;
  BmpisSavedArray[CurrSelLBIndex] := False;
end;

procedure TFormular.MMVerscharfenClick(Sender: TObject);
begin
  if (LastBmpCreated) then
  begin
    UndoRedoOnDraw;
    LastBmp := LAstbmp.FilterSharpen(2);
    LastBmp.Draw(Formular.Bild.Canvas,0,0);
    Formular.Bild.refresh;
    BmpisSavedArray[CurrSelLBIndex] := False;
  end;
end;

procedure TFormular.MMVertikalSpiegelnClick(Sender: TObject);
begin
  if (LastBmpCreated) then
  begin
   UndoRedoOnDraw;
   LastBmp.VerticalFlip;
   LastBmp.Draw(Formular.Bild.Canvas,0,0);
   Formular.Bild.refresh;
   BmpisSavedArray[CurrSelLBIndex] := False;
  end;
end;

procedure TFormular.MMWeicheFilterClick(Sender: TObject);
var i : Byte;
begin
  if (LastBmpCreated) then
  begin
    UndoRedoOnDraw;
    for i:=0 to 5 do
       LastBmp := LastBmp.FilterSmooth;
    LastBmp.Draw(Formular.Bild.Canvas,0,0);
    Formular.Bild.refresh;
    BmpisSavedArray[CurrSelLBIndex] := False;
  end;
end;

procedure TFormular.ResampleClick(Sender: TObject);
begin
  if (LastBmpCreated) then
    ResampleFormular.Showmodal;
end;

procedure TFormular.PreviewResample(h,w : Word);
// Preview bei welchem nur auf die Bildfläche gemalt wird
var
  bmp : TBGRABitmap;
begin
  bmp := LastBmp.Duplicate;
  bmp := Bmp.Resample(w,h);
  Formular.Bild.Picture.Assign(bmp);
  (* Rezoom, aber nicht an den Maßen von LastBmp*)
  Formular.Bild.Height := round(h * power(Imagezoomfactor, 6));
  Formular.Bild.Width := round(w * power(Imagezoomfactor, 6));
  PlaceImageInCenter;
  Formular.Bild.refresh;
  bmp.Free;
end;

procedure TFormular.ApplyResample(h,w : Word);
begin
  UndoRedoOnDraw;
  LastBmp := LastBmp.Resample(w,h);
  Formular.Bild.Picture.Assign(LastBmp);
  Rezoom;
  Formular.Bild.refresh;
  BmpisSavedArray[CurrSelLBIndex] := False;
end;

{ ### ZeichenTools ### }

procedure TFormular.BildMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   r : Real; //Bitmap to Zoom ratio
begin
  r := LastBmp.Width / Bild.Width;
  if (Button = mbLeft) then LMBPressed := True;
  if (Button = mbRight) then RMBPressed := True;
  ClickedOnImage := True;

  if (LTBBBucket.Down) then  //Eimer-Tool
  begin
    UndoRedoOnDraw;
    LastBmp.FloodFill(round(X*r),round(Y*r),TColor2TBGRAPixel(SelColor),fmDrawWithTransparency,50);
    Bild.Picture.Assign(LastBmp);
    BmpisSavedArray[CurrSelLBIndex] := False;
  end;
  if (LTBBPipette.Down) then //Pipette-Tool
  begin
    SelColor := Bild.Canvas.Pixels[round(X*r),round(Y*r)];
    TTBPrimCB.ButtonColor:= SelColor;
  end;
  (* Bild vor Malen mit Stift und Pinsel in UndoArray speichern *)
  if (LTBBPencil.Down) then UndoRedoOnDraw;
  if (LTBBrush.Down) then UndoRedoOnDraw;
  LastMouseClickPos.X := X;
  LastMouseClickPos.Y := Y;
end;

procedure DragImage(LastClickPos : TpointF; X,Y : Integer);   // Beweg-Tool Prozedur
begin
  Formular.Bild.Top  := Y - round(LastClickPos.Y) + Formular.Bild.Top;
  Formular.Bild.Left := X - round(LastClickPos.X) + Formular.Bild.Left;
end;

procedure TFormular.BildMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
var r : Real; //Bitmap to Zoom ratio
    i : Byte;
  bmp : TBGRABitmap;
  radius, angle : single;
   pnt : TpointF;
   max_ : Real;
begin
  if (LMBpressed) then
  begin
    r := LastBmp.Width / Bild.Width;
    if (LTBBPencil.Down = True) then //Bleistift
    begin
      LastBmp.DrawLine(round(LastMousePos.X*r), round(LastMousePos.Y*r), round(X*r),
                             round(Y*r),SelColor,True,dmDrawWithTransparency,SelAlpha*257);
      LastBmp.Draw(Bild.Canvas,0,0,True);
      BmpisSavedArray[CurrSelLBIndex] := False;
      Bild.Repaint;
    end;
    if (LTBBrush.Down = True) and (LMBPressed) then //Pinsel
    begin
      LastBmp.DrawLineAntialias(LastMousePos.X*r,LastMousePos.Y*r,X*r,Y*r,
                                TColor2TBGRAPixel(SelColor),SelPenwidth,False);
      LastBmp.Draw(Bild.Canvas,0,0);
      bmp := LastBmp.Duplicate();
      (* Malen eines Preview-Punktes, da sonst wie mit einer Sichelform gezeichnet wird *)
      bmp.EllipseAntialias(LastMousePos.X*r,LastMousePos.Y*r, SelPenwidth/2-0.7,
                           SelPenwidth/2-0.7, TColor2TBGRAPixel(SelColor), 1,
                           TColor2TBGRAPixel(SelColor));
      bmp.Draw(Bild.Canvas,0,0);
      BmpisSavedArray[CurrSelLBIndex] := False;
      Bild.Repaint;
      bmp.Free;
    end;
    if (LTBBLine.Down) then  //Linie
    begin
      (*Ein Preview der Linie wird gezeichnet*)
      LastBmp.Draw(Bild.Canvas,0,0);
      bmp := LastBmp.Duplicate;
      if (ssShift in Shift) then //Wenn shift gedrückt
      begin
        pnt := LastMouseClickPos - PointF(X,Y);
        begin
          if (abs(pnt.X) < abs(pnt.Y)) then  //vertikale Linie
          bmp.DrawLineAntialias(LastMouseClickPos.X*r, LastMouseClickPos.Y*r,
                                LastMouseClickPos.X*r, Y*r, TColor2TBGRAPixel(SelColor),SelPenwidth)
          else                               // horizontale Linie
          bmp.DrawLineAntialias(LastMouseClickPos.X*r, LastMouseClickPos.Y*r,
                                X*r, LastMouseClickPos.Y*r, TColor2TBGRAPixel(SelColor),SelPenwidth);
        end;
      end
      else    //normale Linie
        bmp.DrawLineAntialias(LastMouseClickPos.X*r, LastMouseClickPos.Y*r,
                              X*r, Y*r, TColor2TBGRAPixel(SelColor),SelPenwidth);
      bmp.Draw(Bild.Canvas,0,0);
      Bild.refresh;
      bmp.Free;
    end;
    if (LTBBEraser.Down) then //Radierer
    begin
      LastBmp.EraseLineAntialias(LastMousePos.X*r, LastMousePos.Y*r, X*r,Y*r,
                                 SelAlpha,SelPenwidth);
      LastBmp.Draw(Bild.Canvas,0,0,True);
      BmpisSavedArray[CurrSelLBIndex] := False;
      Bild.Repaint;
    end;
    if (LTBBMove.Down) and (ClickedOnImage) then // Beweg-Tool
    begin
      DragImage(LastMouseClickPos,X,Y);
    end;
    if (LTBBShape.Down) then //Form-Tool
    begin
     (* Ein Preview der Form wird gezeichnet*)
      LastBmp.Draw(Bild.Canvas,0,0);
      bmp := LastBmp.Duplicate;
      radius := PointF(X,Y).Distance(LastMouseClickPos);
      (* Winkel der Curser-Position zur Klickposition berechnen *)
        if (ssShift in Shift) then  //Wenn Shift gedrückt
           MakePolygon(LastMouseclickPos,SelPointCount,radius, 180/SelPointCount)  // Form mit Grundseite unten
        else
        begin
          if ((PointF(X,Y)-LastMouseclickPos).Length = 0) then angle := arccos(0) //fix für: SIGFPE

          else if ((PointF(X,Y)-LastMouseclickPos).X < 0) then
            angle := arccos((PointF(0,10) * (PointF(X,Y)-LastMouseclickPos))/
                        (PointF(0,10).Length * (PointF(X,Y)-LastMouseclickPos).Length))
          else
            angle := arccos((PointF(0,10) * -1 * (PointF(X,Y)-LastMouseclickPos))/
                        (PointF(0,10).Length * (PointF(X,Y)-LastMouseclickPos).Length)) - pi();

          MakePolygon(LastMouseclickPos,SelPointCount,radius,radtodeg(angle));
        end;
        for i:=0 to (length(pts) - 1) do pts[i] := pts[i]*r;
        if (TTBCBFullung.Checked) then
        bmp.DrawPolygonAntialias(pts,TColor2TBGRAPixel(SelColor),SelPenwidth,TColor2TBGRAPixel(SelSecColor))
        else bmp.DrawPolygonAntialias(pts,TColor2TBGRAPixel(SelColor),SelPenwidth);
        bmp.Draw(Bild.Canvas,0,0);
        Bild.refresh;
        bmp.Free;
    end;
    if (LTBBCircle.Down) then //Kreis
    begin
      (* Preview Kreis *)
      LastBmp.Draw(Bild.Canvas,0,0);
      bmp := LastBmp.Duplicate;
      if (ssShift in Shift) then //Wenn shift gedrückt
      begin //Kreis
        max_ := max(abs(LastMouseClickPos.x - X), abs(LastMouseClickPos.Y -Y)); //größter Radius des Kreises
        if TTBCBFullung.Checked then
        bmp.EllipseAntialias(LastMouseClickPos.X*r, LastMouseClickPos.Y*r,
                             max_*r,max_*r,
                             TColor2TBGRAPixel(SelColor),SelPenwidth,TColor2TBGRAPixel(SelSecColor))
        else
        bmp.EllipseAntialias(LastMouseClickPos.X*r, LastMouseClickPos.Y*r,
                             max_*r,max_*r,
                             TColor2TBGRAPixel(SelColor),SelPenwidth);
      end
      else //ellipse
      begin
        if TTBCBFullung.Checked then
        bmp.EllipseAntialias(LastMouseClickPos.X*r, LastMouseClickPos.Y*r,
                            (LastMouseClickPos.x - X)*r,(LastMouseClickPos.Y -Y)*r,
                             TColor2TBGRAPixel(SelColor),SelPenwidth,TColor2TBGRAPixel(SelSecColor))
        else
        bmp.EllipseAntialias(LastMouseClickPos.X*r, LastMouseClickPos.Y*r,
                            (LastMouseClickPos.x - X)*r,(LastMouseClickPos.Y -Y)*r,
                             TColor2TBGRAPixel(SelColor),SelPenwidth);
      end;
      bmp.Draw(Bild.Canvas,0,0);
      Bild.refresh;
      bmp.Free;
    end;
    if (LTBBGradient.Down) then
    begin
      bmp := LastBmp.Duplicate;
      bmp.GradientFill(0,0,LastBmp.Width, LastBmp.Height, TColor2TBGRAPixel(SelColor),
                       TColor2TBGRAPixel(SelSecColor), gtLinear, LastMouseClickPos,LastMousePos, dmLinearBlend);
      bmp.Draw(Bild.Canvas,0,0);
      Bild.refresh;
      bmp.Free;
    end;
  end
  else if (RMBPressed) then DragImage(LastMouseClickPos,X,Y); //Shortcut Movetool
  LastMousePos.X := X;
  LastMousePos.Y := Y;
end;

procedure TFormular.BildMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var r : Real;
    i : Byte;
  radius, angle : single;
  pnt : TPointF;
  max_ : Real;
begin
   r := LastBmp.Width / Bild.Width;

   if (LTBBrush.Down and LMBpressed) then //pinsel
   begin
     LastBmp.DrawLineAntialias(LastMousePos.X*r,LastMousePos.Y*r,X*r,Y*r,
                               TColor2TBGRAPixel(SelColor),SelPenWidth,True);
     LastBmp.Draw(Bild.Canvas,0,0,False);
     BmpisSavedArray[CurrSelLBIndex] := False;
     Bild.Repaint;
   end;
   if (LTBBLine.Down and LMBpressed) then //Linie
   begin
     UndoRedoOnDraw;
     if (ssShift in Shift) then //Wenn shift gedrückt
      begin
        pnt := LastMouseClickPos - PointF(X,Y);
        begin
          if (abs(pnt.X) < abs(pnt.Y)) then  //vertikale Linie
          LastBmp.DrawLineAntialias(LastMouseClickPos.X*r, LastMouseClickPos.Y*r,
                                LastMouseClickPos.X*r, Y*r, TColor2TBGRAPixel(SelColor),SelPenwidth)
          else                               // horizontale Linie
          LastBmp.DrawLineAntialias(LastMouseClickPos.X*r, LastMouseClickPos.Y*r,
                                X*r, LastMouseClickPos.Y*r, TColor2TBGRAPixel(SelColor),SelPenwidth);
        end;
      end
     else
     LastBmp.DrawLineAntialias(LastMouseClickPos.X*r, LastMouseClickPos.Y*r,
                            X*r, Y*r, TColor2TBGRAPixel(SelColor),SelPenwidth);
     Bild.Picture.Assign(LastBmp);
     BmpisSavedArray[CurrSelLBIndex] := False;
   end;
   if (LTBBCircle.Down and LMBpressed) then //Ellipse
   begin
      UndoRedoOnDraw;
      if (ssShift in Shift) then //Wenn shift gedrückt
      begin //Kreis
        max_ := max(abs(LastMouseClickPos.x - X), abs(LastMouseClickPos.Y -Y)); //größter Radius des Kreises
        if TTBCBFullung.Checked then
        Lastbmp.EllipseAntialias(LastMouseClickPos.X*r, LastMouseClickPos.Y*r,
                             max_*r,max_*r,
                             TColor2TBGRAPixel(SelColor),SelPenwidth,TColor2TBGRAPixel(SelSecColor))
        else
        Lastbmp.EllipseAntialias(LastMouseClickPos.X*r, LastMouseClickPos.Y*r,
                             max_*r,max_*r,
                             TColor2TBGRAPixel(SelColor),SelPenwidth);
      end
      else  //Ellipse
      begin
        if TTBCBFullung.Checked then
        LastBmp.EllipseAntialias(LastMouseClickPos.X*r, LastMouseClickPos.Y*r,
                                (LastMouseClickPos.x - X)*r,(LastMouseClickPos.Y -Y)*r,
                                 TColor2TBGRAPixel(SelColor),SelPenwidth,TColor2TBGRAPixel(SelSecColor))
        else
        LastBmp.EllipseAntialias(LastMouseClickPos.X*r, LastMouseClickPos.Y*r,
                                (LastMouseClickPos.x - X)*r,(LastMouseClickPos.Y -Y)*r,
                                 TColor2TBGRAPixel(SelColor),SelPenwidth);
      end;
      LastBmp.Draw(Bild.Canvas,0,0);
      BmpisSavedArray[CurrSelLBIndex] := False;
      Bild.refresh;
   end;
   if (LTBBShape.Down and LMBpressed) then  // Form-Tool
   begin
      (* Ein N-Eck wird gezeichnet*)
      UndoRedoOnDraw;
      radius := PointF(X,Y).Distance(LastMouseClickPos);

      if (ssShift in Shift) then  //Wenn Shift gedrückt
           MakePolygon(LastMouseclickPos,SelPointCount,radius,180/SelPointCount)  // Form mit Grundseite unten
        else
        begin
          if ((PointF(X,Y)-LastMouseclickPos).Length = 0) then angle := arccos(0) //fix für: SIGFPE

          else if ((PointF(X,Y)-LastMouseclickPos).X < 0) then
           angle := arccos((PointF(0,10) * (PointF(X,Y)-LastMouseclickPos))/
                        (PointF(0,10).Length * (PointF(X,Y)-LastMouseclickPos).Length))
          else
            angle := arccos((PointF(0,10) * -1 * (PointF(X,Y)-LastMouseclickPos))/
                        (PointF(0,10).Length * (PointF(X,Y)-LastMouseclickPos).Length)) - pi();

          MakePolygon(LastMouseclickPos,SelPointCount,radius,radtodeg(angle));
        end;
      for i:=0 to (length(pts) - 1) do pts[i] := pts[i]*r;

      if (TTBCBFullung.Checked) then
      LastBmp.DrawPolygonAntialias(pts,TColor2TBGRAPixel(SelColor),SelPenwidth,TColor2TBGRAPixel(SelSecColor))
      else LastBmp.DrawPolygonAntialias(pts,TColor2TBGRAPixel(SelColor),SelPenwidth);
      LastBmp.Draw(Bild.Canvas,0,0);
      BmpisSavedArray[CurrSelLBIndex] := False;
      Bild.refresh;
   end;
   if (LTBBGradient.Down and LMBpressed) then
   begin
      UndoRedoOnDraw;
      LastBmp.GradientFill(0,0,LastBmp.Width, LastBmp.Height, TColor2TBGRAPixel(SelColor),
                       TColor2TBGRAPixel(SelSecColor), gtLinear, LastMouseClickPos,LastMousePos, dmLinearBlend);
      LastBmp.Draw(Bild.Canvas,0,0);
      Bild.refresh;
   end;
   ClickedOnImage := False;
   LMBpressed := False;
   RMBPressed := False;
end;


{ *** BildListBox *** }

procedure ReselectForMultiSelection(); //behält alte Auswahl bei Mehrfachauswahl bei, welche sonst verschwindet
var i : SmallInt;
begin
   begin
     for i in SelBildLBIndexes do
       Formular.BildListBox.Selected[i] := True; //alte Auswahlen ausgewählt lassen
     SelBildLBIndexes := GetSelectedLBIndexes;
     for i in SelBildLBIndexes do
       Formular.BildListBox.Selected[i] := True; //neue Auwahlen auswählen lassen
   end;
   SelBildLBIndexes := GetSelectedLBIndexes;
end;

procedure TFormular.BildListboxMouseUp(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 (* Item welches in BildListBox gerechtsklickt wird, wird abgewählt *)
  if (Button = mbRight) then
  begin
    if (CurrSelLBIndex = BildListbox.GetIndexAtY(Y))
    and not (BildListbox.GetIndexAtY(Y) = -1) then
    begin
      BmpArray[BildListbox.GetIndexAtY(Y)].Assign(LastBmp);
      ClearUndoRedoArrays;
      Bild.Canvas.Clear;
      Bild.Visible:=False;
      Formular.ScrollBarvrt.Visible := False;
      Formular.ScrollBarhor.Visible := False;
      CurrSelLBIndex := -1;
    end;
    if (BildListbox.GetIndexAtY(Y) <> -1) then
    begin
      BildListBox.Selected[BildListbox.GetIndexAtY(Y)] := False;
      SelBildLBIndexes := GetSelectedLBIndexes;
    end;

  end;
  (* Linksklick soll Item in BildListbox auswählen (für einzelne Auswahl) *)
  if (Button = mbLeft)
  and (BildListbox.GetIndexAtY(Y) <> -1) then
  begin
    if (CurrSelLBIndex <> -1)  (* Letzte Auswahl speichern *)
      then BmpArray[CurrSelLBIndex].Assign(LastBmp);
    BildListBox.Selected[BildListbox.GetIndexAtY(Y)] := True;
    if (MMMehrfachAuswahl.Checked) then ReselectForMultiSelection;
    if (CurrSelLBIndex <> BildListbox.GetIndexAtY(Y)) then
    begin
      CurrSelLBIndex := BildListbox.GetIndexAtY(Y);
      LastBmp.Assign(BmpArray[CurrSelLBIndex]);
      Bild.Picture.Assign(LastBmp);
      Bild.Canvas.Refresh;
      Bild.Visible := True;
      PlaceImageInCenter;
      ResetZoom;
      DidSelectionChange := True;
      SelBildLBIndexes := GetSelectedLBIndexes;
      ClearUndoRedoArrays;
    end;
  end
  else if (Button = mbLeft) then ReselectforMultiselection; //Auswahl wird bei jedem Klick auf LB gelöscht
end;



procedure TFormular.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var Key : Char;
begin
  if (WheelDelta > 0) and (length(SelBildLBindexes) > 0) then BildZoom(False) //zoomin
  else if (WheelDelta < 0) and (length(SelBildLBindexes) > 0) then BildZoom(True)//zoomout
end;

{ *** LeftToolBar *** }

procedure TFormular.LTBBrushClick(Sender: TObject);
begin
  UnDownAllLTBButtons();
  LTBBrush.Down := True;
end;

procedure TFormular.LTBBZoomoutClick(Sender: TObject);
begin
  BildZoom(True);
end;

procedure TFormular.LTBBZoominClick(Sender: TObject);
begin
  BildZoom(False);
end;

procedure TFormular.LTBBPipetteClick(Sender: TObject);
begin
   UnDownAllLTBButtons();
   LTBBPipette.Down := True
end;

procedure TFormular.LTBBLineClick(Sender: TObject);
begin
   UnDownAllLTBButtons();
   LTBBLine.Down := True;
end;

procedure TFormular.LTBBShapeClick(Sender: TObject);
begin
  UnDownAllLTBButtons();
  LTBBShape.Down := True;
end;

procedure TFormular.LTBBBucketClick(Sender: TObject);
begin
   UnDownAllLTBButtons();
   LTBBBucket.Down := True;
end;

procedure TFormular.LTBBCircleClick(Sender: TObject);
begin
  UnDownAllLTBButtons();
  LTBBCircle.Down := True;
end;

procedure TFormular.LTBBEraserClick(Sender: TObject);
begin
  UnDownAllLTBButtons();
  LTBBEraser.Down := True;
end;

procedure TFormular.LTBBMoveClick(Sender: TObject);
begin
   UnDownAllLTBButtons();
   LTBBMove.Down := True;
end;

procedure TFormular.LTBBPencilClick(Sender: TObject);
begin
   UnDownAllLTBButtons();
   LTBBPencil.Down := True;
end;

procedure TFormular.LTBBGradientClick(Sender: TObject);
begin
   UnDownAllLTBButtons();
   LTBBGradient.Down := True;
end;



{ *** TopToolBar *** }

procedure TFormular.TTBPrimCBColorChanged(Sender: TObject);
begin
  SelColor := TTBPrimCB.ButtonColor;
end;

procedure TFormular.TTBSecCBColorChanged(Sender: TObject);
begin
  SelSecColor := TTBSecCB.ButtonColor;
end;

procedure TFormular.TTBSEEckenChange(Sender: TObject);
begin
  SelPointCount := TTBSEEcken.Value;
end;

procedure TFormular.TTBSEEckenKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
(* es soll Userinput verhindert werden *)
begin
  key := 0;
end;

procedure TFormular.TTBTBAlphaChange(Sender: TObject);
begin
  SelAlpha := TTBTBAlpha.Position;
  TTBLabelAlphaValue.Caption := IntToStr(SelAlpha);
end;

procedure TFormular.TTBTBLineWidthChange(Sender: TObject);
begin
  SelPenWidth := TTBTBLineWidth.Position;
  TTBLabelLineWidthValue.Caption := IntToStr(SelPenWidth);
end;

procedure TFormular.TTBBRedoClick(Sender: TObject);
begin
  Redo;
end;

procedure TFormular.TTBBUndoClick(Sender: TObject);
begin
  Undo;
end;

end.
