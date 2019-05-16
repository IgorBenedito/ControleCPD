unit uCadastroTipoUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Data.Win.ADODB;

type
  TfrmTipoUsuario = class(TForm)
    pgTipoUsuario: TPageControl;
    tsPesquisa: TTabSheet;
    tsCadastro: TTabSheet;
    Label2: TLabel;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnEditar: TSpeedButton;
    edtDescricao: TDBEdit;
    btnProximo: TSpeedButton;
    DBGrid1: TDBGrid;
    edtBuscaTipoUsuario: TEdit;
    img3: TImage;
    img2: TImage;
    img1: TImage;
    img4: TImage;
    qryTipoUsuario: TADOQuery;
    dsTipoUsuario: TDataSource;
    btnNovo: TSpeedButton;
    qryVerificaDescricao: TADOQuery;
    procedure btnProximoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsTipoUsuarioStateChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edtBuscaTipoUsuarioChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoUsuario: TfrmTipoUsuario;

implementation

{$R *.dfm}

uses uLogin;

procedure TfrmTipoUsuario.dsTipoUsuarioStateChange(Sender: TObject);
begin
  btnSalvar.Enabled:=  (dsTipoUsuario.State in [dsInsert,dsEdit]);
  btnEditar.Enabled:=  ((dsTipoUsuario.State in [dsBrowse]) and not(qryTipoUsuario.IsEmpty));
  btnCancelar.Enabled:= (dsTipoUsuario.State in [dsInsert,dsEdit]);
  btnDeletar.Enabled:=  (dsTipoUsuario.State in [dsEdit]);
end;

procedure TfrmTipoUsuario.edtBuscaTipoUsuarioChange(Sender: TObject);
begin
  qryTipoUsuario.Close;
  qryTipoUsuario.Parameters.ParamByName('Tipo').Value:='%'+ edtBuscaTipoUsuario.Text +'%';
  qryTipoUsuario.Open;
end;

procedure TfrmTipoUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryTipoUsuario.Close;
end;

procedure TfrmTipoUsuario.FormCreate(Sender: TObject);
begin
  qryTipoUsuario.Close;
  qryTipoUsuario.Parameters.ParamByName('Tipo').Value:='%';
  qryTipoUsuario.Open;
end;

procedure TfrmTipoUsuario.FormShow(Sender: TObject);
begin
  pgTipoUsuario.ActivePage := tsPesquisa;
end;

procedure TfrmTipoUsuario.btnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Desistir da alteração?','Confirmar',MB_YESNO+MB_IconQuestion)=IDYES then
  begin
    qryTipoUsuario.Cancel;
    pgTipoUsuario.ActivePage := tsPesquisa;
  end;
end;

procedure TfrmTipoUsuario.btnSalvarClick(Sender: TObject);
begin
  if (qryTipoUsuario.State in [dsInsert]) then
  begin
    qryVerificaDescricao.Close;
    qryVerificaDescricao.Parameters.ParamByName('descricao').Value:= edtDescricao.Text;
    qryVerificaDescricao.Open;
    if (qryVerificaDescricao.RecordCount > 0) then
    begin
      Application.MessageBox('Usuario já Cadastrado na base de dados.','Aviso',MB_OK+MB_IconQuestion);
      qryTipoUsuario.ClearFields;
      Abort;
    end
  end;

  if (qryTipoUsuario.State in [dsInsert,dsEdit]) then
  begin
    if (Trim(edtDescricao.Text) ='') then
    begin
      Application.MessageBox('Campo descrição Vazio.','Campo vazio',MB_OK+MB_IconQuestion);
      if (edtDescricao.CanFocus) then
      begin
        edtDescricao.SetFocus;
      end
    end

    else if Application.MessageBox('Deseja Salvar o Cadastro','Confirmação',MB_YESNO+MB_IconQuestion) = IDYES then
    begin
      qryTipoUsuario.Edit;
      qryTipoUsuario.Post;
      Application.MessageBox('Registro Salvo com Sucesso','Confirmação',MB_OK+MB_IconQuestion);
      pgTipoUsuario.ActivePage:=tsPesquisa;
    end;
  end;
end;

procedure TfrmTipoUsuario.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid1 do
  begin
    if Odd(dsTipoUsuario.DataSet.RecNo) then
      Canvas.Brush.Color := clWindow
    else
      Canvas.Brush.Color := clGradientInactiveCaption;

      Canvas.FillRect(Rect);
      DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TfrmTipoUsuario.btnDeletarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja Remover o Cadastro?','Confirmar',mb_YesNo+MB_IconQuestion)= IDYES then
  begin
    qryTipoUsuario.Delete;
    Application.MessageBox('Registro Removido Sucesso','Aviso',MB_OK+MB_IconQuestion);
    pgTipoUsuario.ActivePage:=tsPesquisa;
  end;
end;

procedure TfrmTipoUsuario.btnNovoClick(Sender: TObject);
begin
  pgTipoUsuario.ActivePage:=tsCadastro;
  qryTipoUsuario.Insert;
  if (edtDescricao.CanFocus) then
  begin
    edtDescricao.SetFocus;
  end;
end;

procedure TfrmTipoUsuario.btnProximoClick(Sender: TObject);
begin
  pgTipoUsuario.ActivePage := tsCadastro;
  qryTipoUsuario.Edit;
end;

end.
