unit uPLCData;

interface

uses
  Vcl.Graphics;

type

  PLCData = record
    xusec: UInt32;
    chdata: array [1..32] of Int16;
  end;

  { the plc data class }
  TPLCDataSet = class
    public
      { the data }
      PLCDataSeries: array [0..100000] of PLCData;
      { the count }
      PLCDCount: Integer;
      { the data offset }
      choff: array [1..32] of Single;
      { the factor }
      chfact: array [1..32] of Single;
      { the color }
      chcolor: array [1..32] of TColor;
      { flag for update }
      isUpdated: Boolean;
      { index of last data that been read }
      idxLastData: Integer;
    public
      constructor Create;
      function getData(channel : integer; index :Integer): Single;
  end;

var
  PLCDS: TPLCDataSet;

implementation

constructor TPLCDataSet.Create;
begin
  PLCDCount := 0;
  idxLastData := -1;
end;

{ the plc data class }
function TPLCDataSet.getData(channel : integer; index: Integer): Single;
begin
  { do the math }
  result := PLCDataSeries[index].chdata[channel] *chfact[channel] +choff[channel];
end;


initialization
  PLCDS := TPLCDataSet.Create;

finalization
  PLCDS.Free;

end.
