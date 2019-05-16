unit uBuscaTelefone;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Data.Win.ADODB, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TfrmBuscaTelefone = class(TForm)
    dbgrdBuscaTelefone: TDBGrid;
    qryBuscaTelefone: TADOQuery;
    dsBuscaTelefone: TDataSource;
    pnl1: TPanel;
    btnEnviar: TSpeedButton;
    dbtxtNome: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrdBuscaTelefoneDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnEnviarClick(Sender: TObject);
    procedure dbgrdBuscaTelefoneDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    idtelefone : Integer;
    telefone : string;
    { Public declarations }
  end;

var
  frmBuscaTelefone: TfrmBuscaTelefone;

implementation

{$R *.dfm}

uses uLogin;

procedure TfrmBuscaTelefone.btnEnviarClick(Sender: TObject);
begin
  telefone := qryBuscaTelefone.FieldByName('Telefone').Value;
  ModalResult := mrOk;
end;

procedure TfrmBuscaTelefone.dbgrdBuscaTelefoneDblClick(Sender: TObject);
begin
  btnEnviar.Click;
end;

procedure TfrmBuscaTelefone.dbgrdBuscaTelefoneDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrdBuscaTelefone do
  begin
    if (gdSelected in State) then
    begin
      Canvas.Brush.Color := RGB(141,182,205);
    end
    else if Odd(dsBuscaTelefone.DataSet.RecNo) then
    begin
      Canvas.Brush.Color := clGradientInactiveCaption
    end
    else
    begin
      Canvas.Brush.Color := clWindow;
    end;

    Canvas.FillRect(Rect);
    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TfrmBuscaTelefone.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryBuscaTelefone.Close;
 end;

procedure TfrmBuscaTelefone.FormCreate(Sender: TObject);
begin
  qryBuscaTelefone.Close;
  qryBuscaTelefone.Open;
end;

procedure TfrmBuscaTelefone.FormShow(Sender: TObject);
begin
  qryBuscaTelefone.Close;
  qryBuscaTelefone.Parameters.ParamByName('idtel').Value := idtelefone;
  qryBuscaTelefone.Open;

end;

end.
