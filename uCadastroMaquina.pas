unit uCadastroMaquina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Data.Win.ADODB;

type
  TfrmCadastroMaquina = class(TForm)
    pgMaquina: TPageControl;
    tsCadastro: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnEditar: TSpeedButton;
    tsPesquisa: TTabSheet;
    edtMaquina: TDBEdit;
    edtMac: TDBEdit;
    edtIP: TDBEdit;
    btnBuscar: TSpeedButton;
    Bevel1: TBevel;
    edtBuscaMaquina: TEdit;
    DBGrid1: TDBGrid;
    btnProximo: TSpeedButton;
    Bevel2: TBevel;
    cbxSO: TDBLookupComboBox;
    img3: TImage;
    img2: TImage;
    img1: TImage;
    img4: TImage;
    qryMaquina: TADOQuery;
    dsMaquina: TDataSource;
    edtCodUsuario: TEdit;
    qryUsuario: TADOQuery;
    qryDepartamento: TADOQuery;
    dsUsuario: TDataSource;
    dsDepartamento: TDataSource;
    qrySO: TADOQuery;
    dsSO: TDataSource;
    qrySOIdSistema: TAutoIncField;
    qrySOSistemaOperacional: TStringField;
    qryUsuarioIdUsuario: TAutoIncField;
    qryUsuarioCodDepartamento: TIntegerField;
    qryUsuarioCodTipoUsuario: TIntegerField;
    qryUsuarioNome: TStringField;
    qryUsuarioLogin: TStringField;
    qryUsuarioSenha: TStringField;
    edtUsuario: TDBEdit;
    edtDepartamento: TDBEdit;
    qryDepartamentoIdDepartamento: TAutoIncField;
    qryDepartamentoDescricao: TStringField;
    qryDepartamentoRamal: TStringField;
    qryVerificaMaquina: TADOQuery;
    qryVerificaMaquinaIdMaquina: TAutoIncField;
    qryVerificaMaquinaCodUsuario: TIntegerField;
    qryVerificaMaquinaCodSistema: TIntegerField;
    qryVerificaMaquinaIp: TStringField;
    qryVerificaMaquinaNomeMaquina: TStringField;
    qryVerificaMaquinaMac: TStringField;
    qryMaquinaIdMaquina: TAutoIncField;
    qryMaquinaNomeMaquina: TStringField;
    qryMaquinaIp: TStringField;
    qryMaquinaMac: TStringField;
    qryMaquinaCodUsuario: TIntegerField;
    qryMaquinaNome: TStringField;
    qryMaquinaCodSistema: TIntegerField;
    qryMaquinaSistemaOperacional: TStringField;
    btnIncluir: TSpeedButton;
    procedure btnProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtCodUsuarioChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtBuscaMaquinaChange(Sender: TObject);
    procedure dsMaquinaStateChange(Sender: TObject);
    procedure edtCodUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroMaquina: TfrmCadastroMaquina;

implementation

{$R *.dfm}

uses uLogin, uPesquisa;

procedure TfrmCadastroMaquina.btnDeletarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja Remover o Cadastro?','Confirmar',mb_YesNo+MB_IconQuestion)= IDYES then
  begin
    qryMaquina.Delete;
    Application.MessageBox('Estação de Trabalho Removida.','Alerta',MB_OK+MB_IconQuestion);
    pgMaquina.ActivePage:=tsPesquisa;
  end;
end;

procedure TfrmCadastroMaquina.btnEditarClick(Sender: TObject);
begin
  qryMaquina.Edit;
end;

procedure TfrmCadastroMaquina.btnIncluirClick(Sender: TObject);
begin
  pgMaquina.ActivePage:=tsCadastro;
  if (edtMaquina.CanFocus) then
  begin
    edtCodUsuario.Text   := '';
    edtUsuario.Text      := '';
    edtDepartamento.Text := '';
    edtMaquina.SetFocus;
    qryMaquina.Insert;
  end;
end;

procedure TfrmCadastroMaquina.edtBuscaMaquinaChange(Sender: TObject);
begin
  qryMaquina.Close;
  qryMaquina.Parameters.ParamByName('usuario').Value:= '%'+edtBuscaMaquina.Text+'%';
  qryMaquina.Parameters.ParamByName('ip').Value:= '%'+edtBuscaMaquina.Text+'%';
  qryMaquina.Open;
end;

procedure TfrmCadastroMaquina.edtCodUsuarioChange(Sender: TObject);
begin
  if (Trim(edtCodUsuario.Text)<>'') then
  begin
    qryUsuario.Close;
    qryUsuario.Parameters.ParamByName('idusuario').Value := StrToInt(edtCodUsuario.Text);
    qryUsuario.Open;

    qryDepartamento.Close;
    qryDepartamento.Parameters.ParamByName('idDepartamento').Value := qryUsuarioCodDepartamento.Value;
    qryDepartamento.Open;
  end;
end;

procedure TfrmCadastroMaquina.edtCodUsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
  begin
    key:=#0;
    Application.MessageBox('Campo Código, favor informar numeros.','Aviso',MB_OK+MB_IconQuestion);
  end;
end;

procedure TfrmCadastroMaquina.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryMaquina.Close;

  qryUsuario.Close;

  qryDepartamento.Close;

  qrySO.Close;


end;

procedure TfrmCadastroMaquina.FormCreate(Sender: TObject);
begin
  qryMaquina.Close;
  qryMaquina.Parameters.ParamByName('usuario').Value:='%';
  qryMaquina.Open;

  qryUsuario.Close;
  qryUsuario.Open;

  qryDepartamento.Close;
  qryDepartamento.Open;

  qrySO.Close;
  qrySO.Open;

end;

procedure TfrmCadastroMaquina.FormShow(Sender: TObject);
begin
  pgMaquina.ActivePage := tsPesquisa;
end;

procedure TfrmCadastroMaquina.btnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Desistir da alteração?','Confirmar',MB_YESNO+MB_IconQuestion)=IDYES then
  begin
    qryMaquina.Cancel;
    edtCodUsuario.Clear;
    edtUsuario.Clear;
    edtDepartamento.Clear;
    pgMaquina.ActivePage := tsPesquisa;
  end;
end;

procedure TfrmCadastroMaquina.btnBuscarClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesquisa, frmPesquisa);
  try
    frmPesquisa.pesquisa := 'F';
    frmPesquisa.ShowModal;
  finally
    if (frmPesquisa.ModalResult = mrOk) then
    begin
      edtCodUsuario.Text := IntToStr(frmPesquisa.funcionario);

      qryUsuario.Close;
      qryUsuario.Parameters.ParamByName('idUsuario').Value := StrToInt(edtCodUsuario.Text);
      qryUsuario.Open;

      qryDepartamento.Close;
      qryDepartamento.Parameters.ParamByName('idDepartamento').Value := qryUsuarioCodDepartamento.Value;
      qryDepartamento.Open;
    end;
    frmPesquisa.Release;
    frmPesquisa := nil;
  end;
end;

procedure TfrmCadastroMaquina.btnProximoClick(Sender: TObject);
begin
  edtCodUsuario.Text:= IntToStr(qryMaquina.FieldByName('CodUsuario').Value);
  qryMaquina.Edit;
  pgMaquina.ActivePage := tsCadastro;
end;

procedure TfrmCadastroMaquina.btnSalvarClick(Sender: TObject);
begin
  if (qryMaquina.State in [dsInsert]) then
  begin
    qryVerificaMaquina.Close;
    qryVerificaMaquina.Parameters.ParamByName('nomemaquina').Value:= edtMaquina.Text;
    qryVerificaMaquina.Parameters.ParamByName('ip').Value:= edtIP.Text;
    qryVerificaMaquina.Parameters.ParamByName('mac').Value:= edtMac.Text;
    qryVerificaMaquina.Open;
    if (qryVerificaMaquina.RecordCount > 0) then
    begin
      Application.MessageBox('Estação já cadastrado na base de dados.','Alerta',MB_OK+MB_IconQuestion);
      qryMaquina.ClearFields;
      edtCodUsuario.Clear;
      edtUsuario.Clear;
      edtDepartamento.Clear;
      Abort;
    end
  end;

  if (qryMaquina.State in [dsEdit,dsInsert]) then
  begin
    if ((Trim(edtMaquina.Text) = '') and
        (Trim(edtCodUsuario.Text) = '') and
        (Trim(edtUsuario.text) = '') and
        (Trim(edtMac.text)= '') and
        (Trim(edtIP.text) = '') and
        (Trim(cbxSO.Text) = ''))then
    begin
      Application.MessageBox('Preencha todos os campos para continuar.','Alerta',MB_OK+MB_IconQuestion);
      if (edtMaquina.CanFocus) then
      begin
        edtMaquina.SetFocus;
      end;
    end
    else if (Trim(edtMaquina.Text)='') then
    begin
      Application.MessageBox('Informe o Nome da Máquina.','Campo vazio',MB_OK+MB_IconQuestion);
      if (edtMaquina.CanFocus) then
      begin
        edtMaquina.SetFocus;
      end;
    end

    else if (Trim(edtUsuario.Text)='') then
    begin
      Application.MessageBox('Informe o Nome do Usuario.','Campo vazio',MB_OK+MB_IconQuestion);
      if (edtUsuario.CanFocus) then
      begin
        edtUsuario.SetFocus;
      end;
    end

    else if (Trim(edtDepartamento.Text)='') then
    begin
      Application.MessageBox('Informe o Departamento.','Campo vazio',MB_OK+MB_IconQuestion);
      if (edtDepartamento.CanFocus) then
      begin
        edtDepartamento.SetFocus;
      end;
    end

    else if (Trim(cbxSO.Text)='') then
    begin
      Application.MessageBox('Informe o Sistema Operacional da Estação de Trabalho.','Campo vazio',MB_OK+MB_IconQuestion);
      if (cbxSO.CanFocus) then
      begin
        cbxSO.SetFocus;
      end;
    end

    else if (Trim(edtIP.Text)='') then
    begin
      Application.MessageBox('Informe o Ip da Estação de Trabalho.','Campo vazio',MB_OK+MB_IconQuestion);
      if (edtIP.CanFocus) then
      begin
        edtIP.SetFocus;
      end;
    end

    else if (Trim(edtMac.Text)='') then
    begin
      Application.MessageBox('Informe o Mac Adress da Estação de Trabalho.','Campo vazio',MB_OK+MB_IconQuestion);
      if (edtIP.CanFocus) then
      begin
        edtIP.SetFocus;
      end;
    end

    else if Application.MessageBox('Deseja Salvar o Cadastro','Confirmação',MB_YESNO+MB_IconQuestion) = IDYES then
    begin
      qryMaquina.Edit;
      qryMaquina.FieldByName('CodUsuario').Value:= StrToInt(edtCodUsuario.text);
      qryMaquina.Post;
      Application.MessageBox('Registro Salvo com Sucesso','Confirmação',MB_OK+MB_IconQuestion);
      qryMaquina.Close;
      pgMaquina.ActivePage:= tsPesquisa;
      qryMaquina.Open;
    end;
  end;

end;


procedure TfrmCadastroMaquina.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid1 do
  begin
    if Odd(dsMaquina.DataSet.RecNo) then
      Canvas.Brush.Color := clWindow
    else
      Canvas.Brush.Color := clGradientInactiveCaption;

    Canvas.FillRect(Rect);
    DefaultDrawColumnCell(Rect,DataCol,Column,State);

  end;
end;

procedure TfrmCadastroMaquina.dsMaquinaStateChange(Sender: TObject);
begin
  btnSalvar.Enabled:= (dsMaquina.State in [dsInsert,dsEdit]);
  btnEditar.Enabled:= ((dsMaquina.State in [dsBrowse]) and not (qryDepartamento.IsEmpty));
  btnDeletar.Enabled:= (dsMaquina.State in [dsEdit]);
  btnCancelar.Enabled:= (dsMaquina.State in [dsInsert,dsEdit]);
end;

end.
