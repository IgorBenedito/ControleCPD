unit uCadastroUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Data.Win.ADODB;

type
  TfrmCadastroUsuario = class(TForm)
    pgUsuario: TPageControl;
    tsPesquisa: TTabSheet;
    tsCadastro: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnEditar: TSpeedButton;
    edtNome: TDBEdit;
    edtSenha: TDBEdit;
    edtLogin: TDBEdit;
    btnBuscaTipoUsuario: TSpeedButton;
    Bevel1: TBevel;
    btnBuscaDepartamento: TSpeedButton;
    Bevel2: TBevel;
    edtBuscaUsuario: TEdit;
    DBGrid1: TDBGrid;
    btnProximo: TSpeedButton;
    qryUsuario: TADOQuery;
    dsUsuario: TDataSource;
    qryUsuarioIdUsuario: TAutoIncField;
    qryUsuarioCodDepartamento: TIntegerField;
    qryUsuarioCodTipoUsuario: TIntegerField;
    qryUsuarioNome: TStringField;
    qryUsuarioLogin: TStringField;
    qryUsuarioSenha: TStringField;
    btnNovo: TSpeedButton;
    edtDepartamento: TDBEdit;
    edtTipoUsuario: TDBEdit;
    qryDepartamento: TADOQuery;
    dsDepartamento: TDataSource;
    qryDepartamentoIdDepartamento: TAutoIncField;
    qryDepartamentoDescricao: TStringField;
    qryDepartamentoRamal: TStringField;
    edtCodDepartamento: TEdit;
    qryTipoUsuario: TADOQuery;
    dsTipoUsuario: TDataSource;
    edtCodTipoUsuario: TEdit;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    qryVerificaUsuario: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure dsUsuarioStateChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtBuscaUsuarioChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnBuscaDepartamentoClick(Sender: TObject);
    procedure edtCodDepartamentoChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvar1Click(Sender: TObject);
    procedure btnBuscaTipoUsuarioClick(Sender: TObject);
    procedure edtCodTipoUsuarioChange(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure edtCodDepartamentoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodTipoUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroUsuario: TfrmCadastroUsuario;

implementation

{$R *.dfm}

uses uLogin, uCadastroDepartamento, uPesquisa;

procedure TfrmCadastroUsuario.btnSalvar1Click(Sender: TObject);
begin
  if(qryUsuario.State in [dsInsert,dsEdit])then
    if Application.MessageBox('Deseja Salvar o cadastro?','Confirmação',mb_YesNo+MB_IconQuestion)= IDYES then
      begin
        qryUsuario.Edit;
        qryUsuarioCodDepartamento.Value:= StrToInt(edtCodDepartamento.Text);
        qryUsuario.Post;
        Application.MessageBox('Usuario Alterado com Sucesso!','Confirmação',MB_OK+MB_IconQuestion);
      end;
end;

procedure TfrmCadastroUsuario.btnBuscaDepartamentoClick(Sender: TObject);
begin
  try
    frmPesquisa:=TfrmPesquisa.Create(nil);
    frmPesquisa.pesquisa:='S';
    frmPesquisa.ShowModal;
  finally
    if (frmPesquisa.ModalResult = mrOk) then
    begin
      edtCodDepartamento.Text := IntToStr(frmPesquisa.departamento);

      qryDepartamento.Close;
      qryDepartamento.Parameters.ParamByName('idDepartamento').Value := StrToInt(edtCodDepartamento.Text);
      qryDepartamento.Open;

      frmPesquisa.Release;
      frmPesquisa := nil;
    end;
  end;
end;

procedure TfrmCadastroUsuario.btnBuscaTipoUsuarioClick(Sender: TObject);
begin
  try
    frmPesquisa:=TfrmPesquisa.Create(nil);
    frmPesquisa.pesquisa:='U';
    frmPesquisa.ShowModal;
  finally
    if (frmPesquisa.ModalResult = mrOk) then
    begin
      edtCodTipoUsuario.Text := IntToStr(frmPesquisa.tipousuario);

      qryTipoUsuario.Close;
      qryTipoUsuario.Parameters.ParamByName('idTipoUsuario').Value := StrToInt(edtCodTipoUsuario.Text);
      qryTipoUsuario.Open;

      frmPesquisa.Release;
      frmPesquisa := nil;
    end;
  end;
end;

procedure TfrmCadastroUsuario.btnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Desistir da alteração?','Confirmar',MB_YESNO+MB_IconQuestion)=IDYES then
    begin
      qryUsuario.Cancel;
      edtDepartamento.Clear;
      edtCodDepartamento.Clear;
      edtTipoUsuario.Clear;
      edtCodTipoUsuario.Clear;
      pgUsuario.ActivePage := tsPesquisa;
    end;
end;

procedure TfrmCadastroUsuario.btnDeletarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja Remover o Cadastro?','Confirmar',mb_YesNo+MB_IconQuestion)= IDYES then
  begin
    qryUsuario.Delete;
    Application.MessageBox('Usuario Removido Sucesso.','Alerta',MB_OK+MB_IconQuestion);
    pgUsuario.ActivePage:=tsPesquisa;
  end;
end;

procedure TfrmCadastroUsuario.btnEditarClick(Sender: TObject);
begin
  qryDepartamento.Edit;
end;

procedure TfrmCadastroUsuario.btnNovoClick(Sender: TObject);
begin
  pgUsuario.ActivePage:=tsCadastro;
  if (edtNome.CanFocus) then
  begin
    edtCodDepartamento.Text := '';
    edtTipoUsuario.Text     := '';
    edtNome.SetFocus;
    qryUsuario.Insert;
  end;
end;

procedure TfrmCadastroUsuario.btnProximoClick(Sender: TObject);
begin
  edtCodDepartamento.Text:=IntToStr(qryUsuario.FieldByName('CodDepartamento').value);
  edtCodTipoUsuario.Text:=IntToStr(qryUsuario.FieldByName('CodTipoUsuario').value);
  qryUsuario.Edit;
  pgUsuario.ActivePage:=tsCadastro;
end;

procedure TfrmCadastroUsuario.btnSalvarClick(Sender: TObject);
begin
  if(qryUsuario.State in [dsInsert])then
  begin
    qryVerificaUsuario.Close;
    qryVerificaUsuario.Parameters.ParamByName('nome').Value:=edtNome.Text;
    qryVerificaUsuario.Parameters.ParamByName('login').Value:=edtLogin.Text;
    qryVerificaUsuario.Open;
    if (qryVerificaUsuario.RecordCount > 0)then
    begin
      Application.MessageBox('Usuario já cadastrado na base de dados.','Alerta',MB_OK+MB_IconQuestion);
      qryUsuario.ClearFields;
      edtCodDepartamento.Clear;
      edtDepartamento.Clear;
      edtCodTipoUsuario.Clear;
      edtTipoUsuario.Clear;
      Abort;
     end
  end;

  if (qryUsuario.State in [dsInsert,dsEdit])then
  begin
    if ((Trim(edtNome.Text) = '') and
        (Trim(edtSenha.Text) = '') and
        (Trim(edtLogin.Text) = '') and
        (trim(edtDepartamento.Text) = '') and
        (Trim(edtTipoUsuario.Text) = ''))then
    begin
      Application.MessageBox('Preencha todos os campos para continuar.','Alerta',MB_OK+MB_IconQuestion);
      if (edtNome.CanFocus) then
      begin
        edtNome.SetFocus;
      end;
    end

    else if (Trim(edtNome.Text) = '') then
    begin
      Application.MessageBox('Informe o nome Completo do Usuario.','Campo vazio',MB_OK+MB_IconQuestion);
      if (edtNome.CanFocus) then
      begin
        edtNome.SetFocus;
      end;
    end

    else if (Trim(edtlogin.Text) = '') then
    begin
      Application.MessageBox('Informe o nome de login.','Campo Vazio',MB_OK+MB_IconQuestion);
      if (edtlogin.CanFocus) then
      begin
        edtLogin.SetFocus;
      end;
    end

    else if (Trim(edtSenha.Text) = '') then
    begin
      Application.MessageBox('Informe o senha de login.','Campo Vazio',MB_OK+MB_IconQuestion);
      if (edtSenha.CanFocus) then
      begin
        edtSenha.SetFocus;
      end;
    end

    else if (Trim(edtDepartamento.Text) = '') then
    begin
      Application.MessageBox('Informe o Departamento do Usuario.','Campo Vazio',MB_OK+MB_IconQuestion);
      if (edtDepartamento.CanFocus) then
      begin
        edtDepartamento.SetFocus;
      end;
    end

    else if (Trim(edtTipoUsuario.Text) = '') then
    begin
      Application.MessageBox('Informe o perfil do Usuario.','Campo Vazio',MB_OK+MB_IconQuestion);
      if (edtTipoUsuario.CanFocus) then
      begin
        edtTipoUsuario.SetFocus;
      end;
    end

    else if Application.MessageBox('Deseja Salvar o cadastro?','Confirmar',mb_YesNo+MB_IconQuestion)= IDYES then
    begin
      qryUsuario.Edit;
      qryUsuario.FieldByName('CodDepartamento').value := StrToInt(edtCodDepartamento.Text);
      qryUsuario.FieldByName('CodTipoUsuario').value  := StrToInt(edtCodTipoUsuario.Text);
      qryUsuario.Post;
      Application.MessageBox('Usuario Salvo com Sucesso!','Confirmação',MB_OK+MB_IconQuestion);
      pgUsuario.ActivePage:=tsPesquisa;
    end;
  end
end;

procedure TfrmCadastroUsuario.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid1 do
  begin
    if Odd(dsUsuario.DataSet.RecNo) then
      Canvas.Brush.Color := clWindow
    else
      Canvas.Brush.Color := clGradientInactiveCaption;

      Canvas.FillRect(Rect);
      DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TfrmCadastroUsuario.dsUsuarioStateChange(Sender: TObject);
begin
  btnSalvar.Enabled:= (dsUsuario.State in [dsInsert,dsEdit]);
  btnEditar.Enabled:= ((dsUsuario.State in [dsBrowse]) and not (qryUsuario.IsEmpty));
  btnDeletar.Enabled:= (dsUsuario.State in [dsEdit]);
  btnCancelar.Enabled:= (dsUsuario.State in [dsInsert,dsEdit]);
end;

procedure TfrmCadastroUsuario.edtBuscaUsuarioChange(Sender: TObject);
begin
  qryUsuario.Close;
  qryUsuario.Parameters.ParamByName('usuario').Value:= '%'+ edtBuscaUsuario.Text +'%';
  qryUsuario.Open;
end;

procedure TfrmCadastroUsuario.edtCodDepartamentoChange(Sender: TObject);
begin
  if (Trim(edtCodDepartamento.Text)<>'') then
  begin
    qryDepartamento.Close;
    qryDepartamento.Parameters.ParamByName('idDepartamento').Value := StrToInt(edtCodDepartamento.Text);
    qryDepartamento.Open;
  end;
end;

procedure TfrmCadastroUsuario.edtCodDepartamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
  begin
    key:=#0;
    Application.MessageBox('Campo Código, favor informar numeros.','Aviso',MB_OK+MB_IconQuestion);
  end;
end;

procedure TfrmCadastroUsuario.edtCodTipoUsuarioChange(Sender: TObject);
begin
  if (Trim(edtCodTipoUsuario.Text)<>'') then
  begin
    qryTipoUsuario.Close;
    qryTipoUsuario.Parameters.ParamByName('idTipoUsuario').Value := StrToInt(edtCodTipoUsuario.Text);
    qryTipoUsuario.Open;
  end;
end;

procedure TfrmCadastroUsuario.edtCodTipoUsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
  begin
    key:=#0;
    Application.MessageBox('Campo Código, favor informar numeros.','Aviso',MB_OK+MB_IconQuestion);
  end;
end;

procedure TfrmCadastroUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryUsuario.Close;

  qryDepartamento.Close;

  qryTipoUsuario.Close;
end;

procedure TfrmCadastroUsuario.FormCreate(Sender: TObject);
begin
  qryUsuario.Close;
  qryUsuario.Parameters.ParamByName('usuario').Value:='%';
  qryUsuario.Open;

  qryDepartamento.Close;
  qryDepartamento.Open;

  qryTipoUsuario.Close;
  qryTipoUsuario.Open;
end;

procedure TfrmCadastroUsuario.FormShow(Sender: TObject);
begin
  qryUsuario.Close;
  pgUsuario.ActivePage := tsPesquisa;
  qryUsuario.Open;


end;

end.
