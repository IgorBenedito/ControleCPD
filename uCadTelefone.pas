unit uCadTelefone;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.Mask,
  Vcl.DBCtrls;

type
  TfrmCadTelefone = class(TForm)
    pgCadTelefone: TPageControl;
    tsPesquisaTel: TTabSheet;
    tsCadTelefone: TTabSheet;
    dbgrdTelefone: TDBGrid;
    btnIncluir: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    Panel1: TPanel;
    btnSalvarInativo: TSpeedButton;
    btnCancelarInativo: TSpeedButton;
    btnEditarInativo: TSpeedButton;
    btnExcluirInativo: TSpeedButton;
    qryTelefone: TADOQuery;
    dsTelefone: TDataSource;
    qryTelefoneIdTelefone: TAutoIncField;
    qryTelefoneNome: TStringField;
    qryTelefoneResidencia: TStringField;
    qryTelefoneCelular: TStringField;
    qryTelefoneComercial: TStringField;
    edtTelefoneBusca: TEdit;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label1: TLabel;
    dbedtNome: TDBEdit;
    Label2: TLabel;
    dbedtResidencia: TDBEdit;
    Label3: TLabel;
    dbedtCelular: TDBEdit;
    Label4: TLabel;
    dbedtComercial: TDBEdit;
    qryVerificaTelefone: TADOQuery;
    qryVerificaTelefoneIdTelefone: TAutoIncField;
    qryVerificaTelefoneNome: TStringField;
    qryVerificaTelefoneResidencia: TStringField;
    qryVerificaTelefoneCelular: TStringField;
    qryVerificaTelefoneComercial: TStringField;
    btnEscolheNumero: TSpeedButton;
    procedure dbgrdTelefoneDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edtTelefoneBuscaChange(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure dsTelefoneStateChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEscolheNumeroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTelefone: TfrmCadTelefone;

implementation

{$R *.dfm}

uses uLogin, uBuscaTelefone, uPedidoTelefonema;

procedure TfrmCadTelefone.btnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Desistir da Alteração?','Confirmar',MB_YESNO+MB_ICONQUESTION) = IDYEs then
  begin
    qryTelefone.Cancel;
    pgCadTelefone.ActivePage := tsPesquisaTel;
  end;

end;

procedure TfrmCadTelefone.btnEditarClick(Sender: TObject);
begin
  qryTelefone.Edit;
  pgCadTelefone.ActivePage := tsCadTelefone;
end;

procedure TfrmCadTelefone.btnEscolheNumeroClick(Sender: TObject);
begin
  try
    frmBuscaTelefone := TfrmBuscaTelefone.Create(nil);
    frmBuscaTelefone.idtelefone := qryTelefoneIdTelefone.Value;
    frmBuscaTelefone.ShowModal;
  finally
    if (frmBuscaTelefone.ModalResult = mrOk) then
    begin
      frmTelefone.edtIdPedido.Text := IntToStr(frmBuscaTelefone.idtelefone);
      frmTelefone.medtTelefone.Enabled := false;
      frmTelefone.medtTelefone.Color := clMenu;
      frmTelefone.medtTelefone.EditMask := '';
      frmTelefone.medtTelefone.Text := frmBuscaTelefone.telefone;
      frmBuscaTelefone.Free;
      frmCadTelefone.Close
    end
    else
    begin
      frmBuscaTelefone.Free;
      frmBuscaTelefone.Close;
    end;
  end;
end;

procedure TfrmCadTelefone.btnExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox('Deseja Excluir o Registro?','Confirmar',MB_YESNO+MB_ICONQUESTION)=IDYES) then
  begin
    qryTelefone.Delete;
    Application.MessageBox('Cadastro removido com Sucesso','Confirmação',MB_OK+MB_ICONINFORMATION);
  end;
end;

procedure TfrmCadTelefone.btnIncluirClick(Sender: TObject);
begin
  pgCadTelefone.ActivePage := tsCadTelefone;
  if (dbedtNome.CanFocus) then
  begin
    dbedtNome.SetFocus;
    qryTelefone.Insert;
  end;
end;

procedure TfrmCadTelefone.btnSalvarClick(Sender: TObject);
begin
  if (qryTelefone.State in [dsInsert]) then
  begin
    qryVerificaTelefone.Close;
    qryVerificaTelefone.Parameters.ParamByName('contato').Value := dbedtNome.Text;
    qryVerificaTelefone.Open;
    if (qryVerificaTelefone.RecordCount > 0) then
    begin
      Application.MessageBox('Nome já cadastrado na base de Dados, favor cadastrar outro nome ou editar o mesmo.','Aviso',MB_OK+MB_ICONWARNING);
      if dbedtNome.CanFocus then
      begin
        dbedtNome.SetFocus;
      end;
      Abort;
    end;
  end;

  if (qryTelefone.State in [dsInsert,dsEdit]) then
  begin
    if (Trim(dbedtNome.text)='') then
    begin
      Application.MessageBox('Favor informar o nome do Cadastro para prosseguir','Aviso',MB_OK+MB_ICONWARNING);
      if (dbedtNome.CanFocus) then
      begin
        dbedtNome.SetFocus;
      end;
    end
    else if (Application.MessageBox('Deseja Salvar os Dados?','Cofirmação',MB_YESNO+MB_ICONQUESTION)=IDYES) then
    begin
      qryTelefone.Post;
      Application.MessageBox('Cadstro Realizado com Sucesso','Confirmação',MB_OK+MB_ICONINFORMATION);
      qryTelefone.Close;
      pgCadTelefone.ActivePage := tsPesquisaTel;
      qryTelefone.Open;
    end;
  end ;

end;

procedure TfrmCadTelefone.dbgrdTelefoneDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrdTelefone do
  begin
    if (gdSelected in State) then
    begin
      Canvas.Brush.Color := RGB(141,182,205);
      //Canvas.Font.Color := clWhite;
    end
    else
    if Odd(dsTelefone.DataSet.RecNo) then
    begin
      Canvas.Brush.Color := clGradientActiveCaption;
    end
    else
    begin
      Canvas.Brush.Color := clWindow
    end;
    Canvas.FillRect(Rect);
    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TfrmCadTelefone.dsTelefoneStateChange(Sender: TObject);
begin
  btnSalvar.Enabled := (dsTelefone.State in [dsInsert, dsEdit]);
  btnCancelar.Enabled := btnSalvar.Enabled;
end;

procedure TfrmCadTelefone.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryTelefone.Close;
end;

procedure TfrmCadTelefone.edtTelefoneBuscaChange(Sender: TObject);
begin
 qryTelefone.Locate('Nome',edtTelefoneBusca.Text,[loCaseInsensitive,loPartialKey]);
 if (trim(edtTelefoneBusca.Text)= '') then
 begin
   qryTelefone.First;
 end;

end;

procedure TfrmCadTelefone.FormCreate(Sender: TObject);
begin
  qryTelefone.Close;
  qryTelefone.Parameters.ParamByName('nome').Value := '%';
  qryTelefone.Open;
end;

procedure TfrmCadTelefone.FormShow(Sender: TObject);
begin
  pgCadTelefone.ActivePage := tsPesquisaTel;

end;

end.
