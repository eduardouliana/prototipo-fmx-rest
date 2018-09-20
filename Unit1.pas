unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TForm1 = class(TForm)
    oRestClient: TRESTClient;
    oRequest: TRESTRequest;
    oResponse: TRESTResponse;
    EdtParametro: TEdit;
    BtnExecutar: TButton;
    MmoResponse: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure BtnExecutarClick(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

uses
  System.JSON;
{$R *.fmx}

procedure TForm1.BtnExecutarClick(Sender: TObject);
var
  oJasonValue: TJSONValue;
begin
  oRequest.Params.Clear;
  MmoResponse.Lines.Clear;

  oRequest.Params.AddItem('pattern', Trim(EdtParametro.Text));
  oRequest.Execute;
  oJasonValue := oResponse.JSONValue;
  MmoResponse.Text := oJasonValue.ToString;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  oRestClient.BaseURL := 'http://www.songsterr.com/a/ra/';
  oRequest.Resource := 'songs.json';

  MmoResponse.TextSettings.WordWrap := true;
end;

end.
