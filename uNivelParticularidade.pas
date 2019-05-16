unit uNivelParticularidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Data.Win.ADODB, Vcl.ComCtrls, Vcl.Buttons, Vcl.DBCtrls;

type
  TfrmNivelParticularidade = class(TForm)
    qryUsuario: TADOQuery;
    dsUsuario: TDataSource;
    qryUsuarioIdUsuario: TAutoIncField;
    qryUsuarioCodTipoUsuario: TIntegerField;
    strngfldUsuarioNome: TStringField;
    pgNivelParticularidade: TPageControl;
    tsPesquisa: TTabSheet;
    dbNome: TDBGrid;
    edt1: TEdit;
    TsNivel: TTabSheet;
    Label1: TLabel;
    cbxNivel: TComboBox;
    Label2: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    qryUsuarioTipo: TStringField;
    cmdUpNivel: TADOCommand;
    btnMuda: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnVoltar: TSpeedButton;
    procedure edt1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMudaClick(Sender: TObject);
    procedure dbNomeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
  private
    idUsuario : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNivelParticularidade: TfrmNivelParticularidade;

implementation

{$R *.dfm}

procedure TfrmNivelParticularidade.btnIncluirClick(Sender: TObject);
begin
  idUsuario := qryUsuarioIdUsuario.Value;
  pgNivelParticularidade.ActivePage := TsNivel;
end;

procedure TfrmNivelParticularidade.btnMudaClick(Sender: TObject);
begin
  if (cbxNivel.ItemIndex = -1) then
  begin
    Application.MessageBox('Escolha um nivel de particularidade.','Alerta',MB_OK+MB_IconQuestion);
  end
  else if (cbxNivel.ItemIndex = 0) then  //ADMINISTRADOR
  begin
    cmdUpNivel.Parameters.ParamByName('IdUsuario').Value := idUsuario;
    cmdUpNivel.Parameters.ParamByName('IdTipo').Value := 1;
    cmdUpNivel.Execute;

    Application.MessageBox('Nivel alterdo com sucesso.','Alerta',MB_OK+MB_IconQuestion);
    qryUsuario.Refresh;
  end
  else if (cbxNivel.ItemIndex = 1) then  //TÉCNICO
  begin
    cmdUpNivel.Parameters.ParamByName('IdUsuario').Value := idUsuario;
    cmdUpNivel.Parameters.ParamByName('IdTipo').Value := 3;
    cmdUpNivel.Execute;

    Application.MessageBox('Nivel alterdo com sucesso.','Alerta',MB_OK+MB_IconQuestion);
    qryUsuario.Refresh;
  end
  else if (cbxNivel.ItemIndex = 2) then // PADRÃO
  begin
    cmdUpNivel.Parameters.ParamByName('IdUsuario').Value := idUsuario;
    cmdUpNivel.Parameters.ParamByName('IdTipo').Value := 4;
    cmdUpNivel.Execute;

    Application.MessageBox('Nivel alterdo com sucesso.','Alerta',MB_OK+MB_IconQuestion);
    qryUsuario.Refresh;
  end
  else if (cbxNivel.ItemIndex = 3) then  // TELEFONISTA
  begin
    cmdUpNivel.Parameters.ParamByName('IdUsuario').Value := idUsuario;
    cmdUpNivel.Parameters.ParamByName('IdTipo').Value := 2;
    cmdUpNivel.Execute;

    Application.MessageBox('Nivel alterdo com sucesso.','Alerta',MB_OK+MB_IconQuestion);
  end;

  qryUsuario.Close;
  qryUsuario.Open

end;

procedure TfrmNivelParticularidade.btnVoltarClick(Sender: TObject);
begin
  pgNivelParticularidade.ActivePage := tsPesquisa;
end;

procedure TfrmNivelParticularidade.dbNomeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
with dbNome do
  begin
    if Odd(dsUsuario.DataSet.RecNo) then
      Canvas.Brush.Color := clWindow
    else
      Canvas.Brush.Color := clGradientInactiveCaption;

      Canvas.FillRect(Rect);
      DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TfrmNivelParticularidade.edt1Change(Sender: TObject);
begin
  qryUsuario.Close;
  qryUsuario.Parameters.ParamByName('usuario').Value := '%'+ edt1.Text +'%';
  qryUsuario.Open;
end;

procedure TfrmNivelParticularidade.FormShow(Sender: TObject);
begin
  qryUsuario.Close;
  qryUsuario.Parameters.ParamByName('usuario').Value := '%%';
  qryUsuario.Open;

  pgNivelParticularidade.ActivePage := tsPesquisa;
end;

end.
