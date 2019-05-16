unit uPedidoTelefonema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Data.DB, Data.Win.ADODB, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrmTelefone = class(TForm)
    edtIdPedido: TEdit;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    dsPedido: TDataSource;
    dbmmoDescricaoPedido: TDBMemo;
    qryPedido: TADOQuery;
    qryTelefone: TADOQuery;
    dsTelefone: TDataSource;
    dbedtNome: TDBEdit;
    btnGravar: TSpeedButton;
    qryTelefoneIdTelefone: TAutoIncField;
    qryTelefoneNome: TStringField;
    qryTelefoneResidencia: TStringField;
    qryTelefoneComercial: TStringField;
    qryTelefoneCelular: TStringField;
    lbl1: TLabel;
    medtTelefone: TMaskEdit;
    qryPedidoIdPedidoLigacao: TAutoIncField;
    qryPedidoCodTelefone: TIntegerField;
    qryPedidoCodUsuario: TIntegerField;
    qryPedidoMotivoRejeicao: TStringField;
    qryPedidoTelefone: TStringField;
    qryPedidoDescricaoPedido: TStringField;
    qryPedidoStatus: TStringField;
    qryPedidoData: TDateTimeField;
    qryPedidoHora: TStringField;
    bvl1: TBevel;
    bvl2: TBevel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtIdPedidoChange(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure medtTelefoneKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelefone: TfrmTelefone;

implementation

{$R *.dfm}

uses uLogin, uPesquisa, uCadTelefone, uBuscaTelefone, uMain;

procedure TfrmTelefone.btnGravarClick(Sender: TObject);
begin
  if (Application.MessageBox('Deseja Solicitar a Ligação?', 'Confirmar', MB_YESNO+MB_ICONQUESTION) = IDYES) then
  begin
    qryPedido.Edit;
    if (edtIdPedido.Text ='') then
    begin
      qryPedido.FieldByName('CodTelefone').Value := 0;
    end
    else
    begin
      qryPedido.FieldByName('CodTelefone').Value := StrToInt(edtIdPedido.Text);
    end;
    qryPedido.FieldByName('CodUsuario').Value := frmLogin.qryLogin.FieldByName('idusuario').Value;
    qryPedido.FieldByName('Telefone').Value :=  medtTelefone.Text;
    qryPedido.FieldByName('Status').Value := 'A';
    qryPedido.FieldByName('Data').Value := FormatDateTime('YYYY-MM-DD', now);
    qryPedido.FieldByName('Hora').Value := FormatDateTime('hhmm', now);
    qryPedido.Post;
    Application.MessageBox('Sua Solicitação foi registrada com sucesso, aguarde o andamento da Telefonista', 'Confirmação',MB_OK+MB_ICONINFORMATION);
    frmTelefone.Close;
  end;

end;

procedure TfrmTelefone.edtIdPedidoChange(Sender: TObject);
begin
{  if (Trim(edtIdPedido.Text) <> '') then
  begin
    qryTelefone.Close;
    qryTelefone.Parameters.ParamByName('idContato').Value := StrToInt(edtIdPedido.Text);
    qryTelefone.Open;
  end;  }
end;

procedure TfrmTelefone.medtTelefoneKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
  begin
    key:=#0;
    Application.MessageBox('Campo Numérico, favor informar o Telefone.','Aviso',MB_OK+MB_IconQuestion);
  end;
end;

procedure TfrmTelefone.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadTelefone, frmCadTelefone);
  try
    frmCadTelefone.btnEditar.Visible := False;
    frmCadTelefone.btnExcluir.Visible := False;
    frmCadTelefone.btnEscolheNumero.Visible := True;
    frmCadTelefone.dbgrdTelefone.OnDblClick := frmCadTelefone.btnEscolheNumero.OnClick;
    frmCadTelefone.btnEscolheNumero.Left := 525;
    frmCadTelefone.btnIncluir.Left := 629;
    frmCadTelefone.ShowModal;
  finally
    if (frmBuscaTelefone.ModalResult = mrOk) then
    begin
      qryTelefone.Close;
      qryTelefone.Parameters.ParamByName('idtelefone').Value := edtIdPedido.Text;
      qryTelefone.Open;
    end;
    frmCadTelefone.Release;
    frmCadTelefone := nil;
  end;
end;

end.
