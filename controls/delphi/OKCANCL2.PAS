﻿unit OKCANCL2;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TOKRightDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  OKRightDlg: TOKRightDlg;

implementation

{$R *.dfm}

end.
