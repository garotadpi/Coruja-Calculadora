unit calculator;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type
  TOperador = (TSuma, TResta, TMulti, TDivide, TNinguna);
  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button0: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Multi: TButton;
    Divide: TButton;
    Button13: TButton;
    Resta: TButton;
    Suma: TButton;
    Clean: TButton;
    Igual: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    EdDisplay: TEdit;
    Label1: TLabel;
    procedure CleanClick(Sender: TObject);
    procedure IgualClick(Sender: TObject);
    procedure Num1Click(Sender: TObject);
    procedure SumaClick(Sender: TObject);
  private
    { private declarations }
    PrimerNumero : LongInt;
    OperadorSel : TOperador;
    CleanDisplay : Boolean;
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Num1Click(Sender: TObject);
begin
     if CleanDisplay  then
Begin
     EdDisplay.text := '';
     CleanDisplay := False;
     end;
     EdDisplay.text := FloatToStr(StrToFloat (EdDisplay.text + TButton(Sender).caption));
end;

procedure TForm1.IgualClick(Sender: TObject);
begin
     If NOT  CleanDisplay then
        case OperadorSel of
             TSuma : EdDisplay.text := IntToStr(StrToInt(EdDisplay.text) + PrimerNumero);
             TResta : EdDisplay.text := IntToStr(PrimerNumero - StrToInt (EdDisplay.text));
             TMulti : EdDisplay.text := IntToStr(StrToInt (EdDisplay.text) * PrimerNumero);
             TDivide : EdDisplay.text := IntToStr (PrimerNumero DIV StrToInt(EdDisplay.text));
        end;
   CleanDisplay := True;
end;

procedure TForm1.CleanClick(Sender: TObject);
begin
    EdDisplay.text :='0';
    OperadorSel := TNinguna;
    CleanDisplay := False;
end;

procedure TForm1.SumaClick(Sender: TObject);
begin
     IgualClick(Sender);
     case TButton (Sender).caption of
     '+' : OperadorSel := TSuma;
     '-' : OperadorSel := TResta;
     '*' : OperadorSel := TMulti;
     '/' : OperadorSel := TDivide;
     End;
     PrimerNumero := StrToInt(EdDisplay.Text);
     CleanDisplay :=  True;

end;

end.

