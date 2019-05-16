unit uCadastroDepartamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB,
  Data.Win.ADODB;

type
  TfrmCadastroDepartamento = class(TForm)
    pgDepartamento: TPageControl;
    tbPesquisa: TTabSheet;
    tbCadastro: TTabSheet;
    Panel1: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnEditar: TSpeedButton;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    edtBuscaDepartamento: TEdit;
    btnProximo: TSpeedButton;
    edtDepartamento: TDBEdit;
    dsDepartamento: TDataSource;
    qryDepartamento: TADOQuery;
    Label2: TLabel;
    edtRamal: TDBEdit;
    img3: TImage;
    img2: TImage;
    img1: TImage;
    img4: TImage;
    qryVerificaDepartamento: TADOQuery;
    btnIncluir: TSpeedButton;
    procedure btnProximoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edtBuscaDepartamentoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dsDepartamentoStateChange(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtRamalKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroDepartamento: TfrmCadastroDepartamento;

implementation

{$R *.dfm}

uses uLogin;

procedure TfrmCadastroDepartamento.edtBuscaDepartamentoChange(Sender: TObject);
begin
  qryDepartamento.Close;
  qryDepartamento.Parameters.ParamByName('descricao').Value:= '%'+edtBuscaDepartamento.Text+'%';
  qryDepartamento.Open;
end;

procedure TfrmCadastroDepartamento.edtRamalKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
  begin
    key:=#0;
    Application.MessageBox('Campo Código, favor informar numeros.','Aviso',MB_OK+MB_IconQuestion);
  end;
end;

procedure TfrmCadastroDepartamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryDepartamento.Close;
end;

procedure TfrmCadastroDepartamento.FormCreate(Sender: TObject);
begin
  qryDepartamento.Close;
  qryDepartamento.Parameters.ParamByName('descricao').Value:='%';
  qryDepartamento.Open;
end;

procedure TfrmCadastroDepartamento.FormShow(Sender: TObject);
begin
  qryDepartamento.Close;
  pgDepartamento.ActivePage:=tbPesquisa;
  qryDepartamento.Open;
end;

procedure TfrmCadastroDepartamento.btnSalvarClick(Sender: TObject);
begin
  if (qryDepartamento.State in [dsInsert]) then
  begin
    qryVerificaDepartamento.Close;
    qryVerificaDepartamento.Parameters.ParamByName('departamento').Value:= edtDepartamento.Text;
    qryVerificaDepartamento.Parameters.ParamByName('ramal').Value:= edtRamal.Text;
    qryVerificaDepartamento.Open;
    if (qryVerificaDepartamento.RecordCount > 0) then
    begin
      Application.MessageBox('Departameto já cadastrado na base de dados.','Alerta',MB_OK+MB_IconQuestion);
      qryDepartamento.ClearFields;
      edtRamal.Clear;
      Abort;
    end
  end;

  if(qryDepartamento.State in [dsInsert,dsEdit])then
  begin
    if ((Trim(edtDepartamento.Text)= '') and
       (Trim(edtRamal.Text) = '')) then
    begin
      Application.MessageBox('Um ou mais campos não foram preenchidos','Campo Vazio',MB_OK+MB_IconQuestion);
      if (edtDepartamento.CanFocus)then
      begin
        edtDepartamento.SetFocus;
      end;
    end

    else if (Trim(edtDepartamento.Text) = '') then
    begin
      Application.MessageBox('Informe o nome do departamento','Campo Vazio',MB_OK+MB_IconQuestion);
      if (edtDepartamento.CanFocus) then
      begin
        edtDepartamento.SetFocus;
      end;
    end

    else if (Trim(edtRamal.Text) = '') then
    begin
       Application.MessageBox('Informe o Ramal do departamento.','Campo Vazio',MB_OK+MB_IconQuestion);
       if (edtRamal.CanFocus) then
       begin
           edtRamal.SetFocus;
       end;
    end

    else if Application.MessageBox('Deseja Salvar o cadastro?','Confirmar',mb_YesNo+MB_IconQuestion)= IDYES then
    begin
      qryDepartamento.Edit;
      qryDepartamento.Post;
      Application.MessageBox('Registro Gravado com Sucesso!','Confirmar',MB_OK+MB_IconQuestion);
      pgDepartamento.ActivePage:= tbPesquisa;
    end;
  end
end;

procedure TfrmCadastroDepartamento.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid1 do
  begin
    if Odd(dsDepartamento.DataSet.RecNo) then
      Canvas.Brush.Color := clWindow
    else
      Canvas.Brush.Color := clGradientInactiveCaption;

    Canvas.FillRect(Rect);
    DefaultDrawColumnCell(Rect,DataCol,Column,State);

  end;
end;

procedure TfrmCadastroDepartamento.btnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Desistir da alteração?','Confirmar',MB_YESNO+MB_IconQuestion)=IDYES then
  begin
    qryDepartamento.Cancel;
    pgDepartamento.ActivePage:=tbPesquisa;
  end;
end;

procedure TfrmCadastroDepartamento.btnDeletarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja Remover o Cadastro?','Confirmar',mb_YesNo+MB_IconQuestion)= IDYES then
  begin
    qryDepartamento.Delete;
    Application.MessageBox('Departamento Removido Sucesso!','Alerta',MB_OK+MB_IconQuestion);
    pgDepartamento.ActivePage:=tbPesquisa;
  end;
end;

procedure TfrmCadastroDepartamento.btnEditarClick(Sender: TObject);
begin
  qryDepartamento.Edit;
end;

procedure TfrmCadastroDepartamento.btnIncluirClick(Sender: TObject);
begin
  pgDepartamento.ActivePage:=tbCadastro;
  qryDepartamento.Insert;
  if (edtDepartamento.CanFocus) then
  begin
    edtDepartamento.SetFocus;
  end;
end;

procedure TfrmCadastroDepartamento.btnProximoClick(Sender: TObject);
begin
  pgDepartamento.ActivePage:=tbCadastro;
  qryDepartamento.Edit;
end;

procedure TfrmCadastroDepartamento.dsDepartamentoStateChange(Sender: TObject);
begin
  btnSalvar.Enabled:= (dsDepartamento.State in [dsInsert,dsEdit]);
  btnEditar.Enabled:= ((dsDepartamento.State in [dsBrowse]) and not (qryDepartamento.IsEmpty));
  btnDeletar.Enabled:= (dsDepartamento.State in [dsEdit]);
  btnCancelar.Enabled:= (dsDepartamento.State in [dsInsert,dsEdit]);
end;

end.
