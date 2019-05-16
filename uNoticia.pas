unit uNoticia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Data.Win.ADODB;

type
  TfrmNoticia = class(TForm)
    pgMaquina: TPageControl;
    tsCadastro: TTabSheet;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    img1: TImage;
    img3: TImage;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    edtAssunto: TDBEdit;
    edtMensagem: TDBMemo;
    qryNoticia: TADOQuery;
    dsNoticia: TDataSource;
    qryNoticiaIdRecado: TAutoIncField;
    qryNoticiaAssunto: TStringField;
    qryNoticiaHora: TWideStringField;
    qryNoticiaData: TWideStringField;
    qryNoticiaIdFuncionario: TIntegerField;
    qryNoticiaUrgente: TStringField;
    chkUgernte: TDBCheckBox;
    strngfldNoticiaMensagem: TStringField;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNoticia: TfrmNoticia;

implementation

{$R *.dfm}

uses uLogin, uMain;


procedure TfrmNoticia.btnCancelarClick(Sender: TObject);
begin
  if application.MessageBox ('Deseja Realmente Sair do Cadastro de Notícia?','Confirma',mb_YesNo+MB_iconQuestion) = IdYes then
  begin
    qryNoticia.Cancel;
    frmNoticia.Close;
  end;
end;

procedure TfrmNoticia.btnSalvarClick(Sender: TObject);
begin
  if (Trim(qryNoticia.FieldByName('Assunto').AsString) = '') then
  begin
    Application.MessageBox('Favor preencha o Assunto da Notícia.','Alerta',MB_OK+MB_IconQuestion);
    Abort;
  end
  else if (Trim(qryNoticia.FieldByName('Mensagem').AsString) = '') then
  begin
    Application.MessageBox('Favor preencha a Mensagem da Notícia.','Alerta',MB_OK+MB_IconQuestion);
    Abort;
  end
  else if (length(edtMensagem.text) < 10) then
  begin
    Application.MessageBox('Mensagem da Notícia muito curta preencha corretamente.','Alerta',MB_OK+MB_IconQuestion);
    Abort;
  end
  else
  begin
    if (chkUgernte.Checked = True) then
    begin
      qryNoticia.FieldByName('Urgente').Value := 'S';
    end
    else if (chkUgernte.Checked = False) then
    begin
      qryNoticia.FieldByName('Urgente').Value := 'N';
    end;

    qryNoticia.FieldByName('hora').value := FormatDateTime('hh:mm:ss.0000000',now);
    qryNoticia.FieldByName('data').Value := FormatDateTime('yyyy-mm-dd',date);
    qryNoticia.FieldByName('IdFuncionario').Value := frmLogin.qryLogin.FieldByName('idUsuario').Value;
    qryNoticia.Post;
    Application.MessageBox('Notícia registrada com sucesso!', 'Confirmação', MB_OK+MB_IconQuestion);
    frmMain.qryRecUrgente.Close;
    frmMain.qryRecUrgente.Open;
    frmNoticia.Close;
  end;


end;

procedure TfrmNoticia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryNoticia.Close;
end;

procedure TfrmNoticia.FormShow(Sender: TObject);
begin

  chkUgernte.Checked := False;

  qryNoticia.Close;
  qryNoticia.Open;
  qryNoticia.Insert;
end;

end.
