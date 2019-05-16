unit uChamado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.DBCGrids,
  Vcl.DBCtrls, Data.DB, Data.Win.ADODB, Vcl.Imaging.jpeg, ShellAPI;

type
  TfrmChamado = class(TForm)
    pgChamado: TPageControl;
    tsChamado: TTabSheet;
    tschat: TTabSheet;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBCtrlGrid1: TDBCtrlGrid;
    Label5: TLabel;
    Memo1: TMemo;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Image1: TImage;
    DBText1: TDBText;
    DBText2: TDBText;
    SpeedButton4: TSpeedButton;
    dbgChamado: TDBGrid;
    Panel2: TPanel;
    Image2: TImage;
    dbmAssunto: TDBMemo;
    Label6: TLabel;
    SpeedButton5: TSpeedButton;
    Label7: TLabel;
    qryChamado: TADOQuery;
    qryChat: TADOQuery;
    dsChamado: TDataSource;
    dsChat: TDataSource;
    qryChamadoIdChamado: TAutoIncField;
    qryChamadoAssunto: TStringField;
    qryChamadoStatus: TIntegerField;
    qryChamadoUsuario: TStringField;
    qryChamadoIp: TStringField;
    qryChamadoTecnico: TStringField;
    qryChamadoData: TWideStringField;
    qryChamadoHora: TWideStringField;
    qryCadastroChamado: TADOQuery;
    dsCadastroChamado: TDataSource;
    qryCadastroChamadoIdChamado: TAutoIncField;
    qryCadastroChamadoIdUsuario: TIntegerField;
    qryCadastroChamadoIdTecnico: TIntegerField;
    qryCadastroChamadoAssunto: TStringField;
    qryCadastroChamadoStatus: TIntegerField;
    qryCadastroChamadoData: TWideStringField;
    qryCadastroChamadoHora: TWideStringField;
    img1: TImage;
    img2: TImage;
    updateTecnico: TADOCommand;
    tsTransferencia: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    btnMuda: TSpeedButton;
    btnVoltar: TSpeedButton;
    cbxNivel: TComboBox;
    lblNome: TDBText;
    lblIP: TDBText;
    lblTec: TDBText;
    DBMemo1: TDBMemo;
    Image3: TImage;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure dbgChamadoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgChamadoCellClick(Column: TColumn);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChamado: TfrmChamado;

implementation

{$R *.dfm}

uses uLogin;

procedure TfrmChamado.dbgChamadoCellClick(Column: TColumn);
begin
  {if ((frmLogin.idTipo = 1) or (frmLogin.idTipo = 3)) then
  begin
    if (qryChamado.FieldByName('tecnico').IsNull) then
    begin
      if (Column.Index = 3) then
      begin
        updateTecnico.Parameters.ParamByName('idtecnico').Value := frmLogin.idLogado;
        updateTecnico.Parameters.ParamByName('idchamado').Value := qryChamado.FieldByName('IdChamado').Value;
        updateTecnico.Execute;
        pgChamado.ActivePage := tschat;
        qryChamado.Close;
        qryChamado.Open;
      end;
    end
    else
    begin

    end;
  end; }

end;

procedure TfrmChamado.dbgChamadoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
  var Bitmap:
  TBitmap;
begin
  if odd(dsChamado.DataSet.RecNo) then
  begin
    dbgChamado.Brush.Color := clGradientInactiveCaption;
    dbgChamado.Canvas.FillRect(Rect);
    dbgChamado.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end
  else
  begin
    Canvas.Brush.Color := clWindow;
    dbgChamado.Canvas.FillRect(Rect);
    dbgChamado.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;

  if (qryChamado.RecordCount > 0) then
  begin
    if (Column.Index = 3) then
    begin
      if (qryChamado.FieldByName('tecnico').IsNull) then
      begin
        Bitmap := img1.Picture.Bitmap;
        with TDBGrid(Sender) do
        begin
          Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
        end;
      end
      else
      begin
        Bitmap := img2.Picture.Bitmap;
        with TDBGrid(Sender) do
        begin
          Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
        end;
      end;
    end;
  end;
end;

procedure TfrmChamado.Edit1Change(Sender: TObject);
begin
  qryChamado.Close;
  qryChamado.Parameters.ParamByName('Assunto').Value := '%'+Edit1.Text+'%';
  qryChamado.Parameters.ParamByName('id').Value := frmLogin.idLogado;
  qryChamado.Open;
end;

procedure TfrmChamado.FormShow(Sender: TObject);
begin
  qryChamado.Close;
  qryChamado.Parameters.ParamByName('Assunto').Value := '%%';
  qryChamado.Parameters.ParamByName('id').Value := frmLogin.idLogado;
  qryChamado.Open;
end;

procedure TfrmChamado.Image3Click(Sender: TObject);
var
ip : string;
begin
  ip := lblIP.Caption;
  ShellExecute(0, 'open', PChar('C:\Program Files\uvnc bvba\UltraVNC\vncviewer.exe'),PChar('VNC Server '+ ip),nil,  SW_SHOWNOACTIVATE);
end;

procedure TfrmChamado.Label7Click(Sender: TObject);
begin
  if (Panel2.Visible = True) then
  begin
    panel2.Visible := False;
  end;
end;

procedure TfrmChamado.SpeedButton1Click(Sender: TObject);
begin
  if (Panel2.Visible = False) then
  begin
    Panel2.Visible := True;
    Panel2.Top := 56;
    Panel2.Left := 143;
    qryCadastroChamado.Close;
    qryCadastroChamado.Open;
    qryCadastroChamado.Insert;
  end;
end;

procedure TfrmChamado.SpeedButton5Click(Sender: TObject);
begin
  if (Trim(dbmAssunto.Text) = '') then
  begin
    Application.MessageBox('Favor preencher o problema para a abertura do chamado.','Alerta',MB_OK+MB_IconQuestion);
    Abort;
  end
  else
  begin
    qryCadastroChamado.FieldByName('IdUsuario').Value := frmLogin.IdLogado;
    qryCadastroChamado.FieldByName('Status').Value := 1;//abertura
    qryCadastroChamado.FieldByName('hora').value := FormatDateTime('hh:mm:ss.0000000',now);
    qryCadastroChamado.FieldByName('data').Value := FormatDateTime('yyyy-mm-dd',date);
    qryCadastroChamado.Post;
    Application.MessageBox('Chamado aberto com sucesso.','Alerta',MB_OK+MB_IconQuestion);
    qryChamado.Close;
    qryChamado.Open;
    Panel2.Visible := False;
  end;

end;

end.
