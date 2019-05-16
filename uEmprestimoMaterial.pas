unit uEmprestimoMaterial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Menus, ppDB, ppDBPipe, ppParameter, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppCtrls, Vcl.Imaging.pngimage, ppPrnabl, ppBands,
  ppCache, ppDesignLayer, ppStrtch, ppMemo;

type
  TfrmEmprestimo = class(TForm)
    pgMovimentacao: TPageControl;
    tsMovimentacao: TTabSheet;
    tsPesquisa: TTabSheet;
    tsEntrada: TTabSheet;
    tsSaida: TTabSheet;
    tsEmprestimo: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    btnImprimiEmprestimo: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnEditar: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    btnImprimeRequisicao: TSpeedButton;
    Panel3: TPanel;
    btnSalvaSaida: TSpeedButton;
    btnCancelarSaida: TSpeedButton;
    btnDeletarSaida: TSpeedButton;
    btnEditaSaida: TSpeedButton;
    rbEntrada: TRadioButton;
    rbSaida: TRadioButton;
    rbEmprestimo: TRadioButton;
    Label13: TLabel;
    Panel1: TPanel;
    btnSalvaEmprestimo: TSpeedButton;
    btnCancelaEmprestimo: TSpeedButton;
    btnDeletaEmprestimo: TSpeedButton;
    btnEditaEmprestimo: TSpeedButton;
    edtBuscaProduto: TEdit;
    DBGrid1: TDBGrid;
    btnProximo: TSpeedButton;
    edtProduto: TDBEdit;
    edtQuantidade: TDBEdit;
    edtMaterialSaida: TDBEdit;
    edtQtdSaida: TDBEdit;
    Bevel2: TBevel;
    SpeedButton18: TSpeedButton;
    Bevel1: TBevel;
    Bevel3: TBevel;
    SpeedButton19: TSpeedButton;
    Bevel4: TBevel;
    edtMaterialEmprestimo: TDBEdit;
    Label3: TLabel;
    SpeedButton17: TSpeedButton;
    Bevel5: TBevel;
    Bevel6: TBevel;
    SpeedButton21: TSpeedButton;
    btnVoltar: TSpeedButton;
    img3: TImage;
    img2: TImage;
    img1: TImage;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    img7: TImage;
    img8: TImage;
    img9: TImage;
    img10: TImage;
    img11: TImage;
    img12: TImage;
    qryProduto: TADOQuery;
    dsProduto: TDataSource;
    btnNovo: TSpeedButton;
    tsCadastro: TTabSheet;
    Panel4: TPanel;
    img13: TImage;
    img14: TImage;
    img15: TImage;
    img16: TImage;
    btnEditarProduto: TSpeedButton;
    btnCancelarProduto: TSpeedButton;
    btnDeletarProduto: TSpeedButton;
    btnSalvarProduto: TSpeedButton;
    edtCodigoProduto: TDBEdit;
    edtNomeProduto: TDBEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    qryVerificaProduto: TADOQuery;
    edtCodProduto: TDBEdit;
    bvl1: TBevel;
    bvl2: TBevel;
    qryMovimentoProduto: TADOQuery;
    dsMovimentoProduto: TDataSource;
    qryMovimentoProdutoIdMovimento: TAutoIncField;
    qryMovimentoProdutoCodTipoMovimento: TIntegerField;
    qryMovimentoProdutoCodProduto: TIntegerField;
    qryMovimentoProdutoCodUsuario: TIntegerField;
    qryMovimentoProdutoCodTecnico: TIntegerField;
    qryMovimentoProdutoQuantidade: TIntegerField;
    qryMovimentoProdutoDataMovimento: TWideStringField;
    btnEditarNomeProduto: TSpeedButton;
    qryQtdProduto: TADOQuery;
    qryQtdProdutoIdProduto: TAutoIncField;
    qryQtdProdutoprd: TStringField;
    qryQtdProdutototal_prd: TIntegerField;
    qryProdutoIdProduto: TAutoIncField;
    qryProdutoCodProduto: TStringField;
    qryProdutoDescricao: TStringField;
    qryQtdProdutoCodProduto: TStringField;
    qryProdutototal_prd: TIntegerField;
    edtCodFunc: TEdit;
    edtFunc: TDBEdit;
    edtDepartamento: TDBEdit;
    edtTec: TDBEdit;
    edtRespons: TDBEdit;
    edtDeptEmprestimo: TDBEdit;
    qryUsuario: TADOQuery;
    qryDepartamento: TADOQuery;
    dsUsuario: TDataSource;
    dsDepartamento: TDataSource;
    qryUsuarioIdUsuario: TAutoIncField;
    qryUsuarioCodDepartamento: TIntegerField;
    qryUsuarioCodTipoUsuario: TIntegerField;
    qryUsuarioNome: TStringField;
    qryUsuarioLogin: TStringField;
    qryUsuarioSenha: TStringField;
    qryDepartamentoIdDepartamento: TAutoIncField;
    qryDepartamentoDescricao: TStringField;
    qryDepartamentoRamal: TStringField;
    Bevel7: TBevel;
    edtCodTec: TEdit;
    qryTecnico: TADOQuery;
    dsTecnico: TDataSource;
    qryTecnicoIdUsuario: TAutoIncField;
    qryTecnicoCodDepartamento: TIntegerField;
    qryTecnicoCodTipoUsuario: TIntegerField;
    qryTecnicoNome: TStringField;
    qryTecnicoLogin: TStringField;
    qryTecnicoSenha: TStringField;
    Bevel8: TBevel;
    Bevel9: TBevel;
    edtDataEmprestimno: TEdit;
    edtCodRespon: TEdit;
    qryResponsavelEmprestimo: TADOQuery;
    dsResponsavelEmprestimo: TDataSource;
    dsDepartamentoEmprestimo: TDataSource;
    qryDepartamentoEmprestimo: TADOQuery;
    qryDepartamentoEmprestimoIdDepartamento: TAutoIncField;
    qryDepartamentoEmprestimoDescricao: TStringField;
    qryDepartamentoEmprestimoRamal: TStringField;
    qryResponsavelEmprestimoIdUsuario: TAutoIncField;
    qryResponsavelEmprestimoCodDepartamento: TIntegerField;
    qryResponsavelEmprestimoCodTipoUsuario: TIntegerField;
    qryResponsavelEmprestimoNome: TStringField;
    qryResponsavelEmprestimoLogin: TStringField;
    qryResponsavelEmprestimoSenha: TStringField;
    ppRequisicao: TppReport;
    ppParameterList1: TppParameterList;
    ppdRequisicao: TppDBPipeline;
    qryImprimeRequisicao: TADOQuery;
    dsImprimeRequisicao: TDataSource;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppImage1: TppImage;
    plbl9: TppLabel;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppMemo1: TppMemo;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppDBText5: TppDBText;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppdEmprestimo: TppDBPipeline;
    ppEmprestimo: TppReport;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppImage2: TppImage;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppMemo2: TppMemo;
    ppDBText7: TppDBText;
    ppLabel11: TppLabel;
    ppDBText8: TppDBText;
    ppLabel12: TppLabel;
    ppDBText9: TppDBText;
    ppLabel13: TppLabel;
    ppDBText10: TppDBText;
    ppLabel14: TppLabel;
    ppDBText11: TppDBText;
    ppLabel15: TppLabel;
    ppDBText12: TppDBText;
    procedure btnProximoClick(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCancelarSaidaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtBuscaProdutoChange(Sender: TObject);
    procedure btnSalvarProdutoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure dsProdutoStateChange(Sender: TObject);
    procedure btnCancelarProdutoClick(Sender: TObject);
    procedure edtCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditarProdutoClick(Sender: TObject);
    procedure btnDeletarProdutoClick(Sender: TObject);
    procedure edtCodProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtfuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtTecnicoKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdSaidaKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodResponKeyPress(Sender: TObject; var Key: Char);
    procedure edtDepartEmprestimoKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure dsMovimentoProdutoStateChange(Sender: TObject);
    procedure btnEditarNomeProdutoClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton19Click(Sender: TObject);
    procedure edtCodFuncChange(Sender: TObject);
    procedure edtCodFuncKeyPress(Sender: TObject; var Key: Char);
    procedure tsSaidaShow(Sender: TObject);
    procedure btnSalvaSaidaClick(Sender: TObject);
    procedure tsEmprestimoShow(Sender: TObject);
    procedure edtCodDeptEmprestimoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton17Click(Sender: TObject);
    procedure edtCodResponChange(Sender: TObject);
    procedure btnCancelaEmprestimoClick(Sender: TObject);
    procedure btnSalvaEmprestimoClick(Sender: TObject);
    procedure btnImprimeRequisicaoClick(Sender: TObject);
    procedure btnImprimiEmprestimoClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    movimento, quantidade: Integer;
    status : string;
  end;

var
  frmEmprestimo: TfrmEmprestimo;

implementation

{$R *.dfm}

uses uLogin, uPesquisa;

procedure TfrmEmprestimo.edtBuscaProdutoChange(Sender: TObject);
begin
  qryProduto.Close;
  qryProduto.Parameters.ParamByName('produto').Value:='%'+edtBuscaProduto.Text+'%';
  qryProduto.Parameters.ParamByName('codproduto').Value:='%'+edtBuscaProduto.Text+'%';
  qryProduto.Open;
end;

procedure TfrmEmprestimo.edtCodFuncChange(Sender: TObject);
begin
  if (Trim(edtCodFunc.Text)<>'') then
  begin
    qryUsuario.Close;
    qryUsuario.Parameters.ParamByName('idUsuario').Value := StrToInt(edtCodFunc.Text);
    qryUsuario.Open;

    qryDepartamento.Close;
    qryDepartamento.Parameters.ParamByName('idDepartamento').Value := qryUsuarioCodDepartamento.Value;
    qryDepartamento.Open;
  end;
end;

procedure TfrmEmprestimo.edtCodFuncKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
  begin
    key:=#0;
    Application.MessageBox('Campo Código, favor informar numeros.','Aviso',MB_OK+MB_IconQuestion);
  end;
end;

procedure TfrmEmprestimo.edtCodigoProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
  begin
    key:=#0;
    Application.MessageBox('Campo Código, favor informar numeros.','Aviso',MB_OK+MB_IconQuestion);
  end;

end;

procedure TfrmEmprestimo.edtCodProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
  begin
    key:=#0;
    Application.MessageBox('Campo Código, favor informar numeros.','Aviso',MB_OK+MB_IconQuestion);
  end;
end;

procedure TfrmEmprestimo.edtDepartEmprestimoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
  begin
    key:=#0;
    Application.MessageBox('Campo Código, favor informar numeros.','Aviso',MB_OK+MB_IconQuestion);
  end;
end;

procedure TfrmEmprestimo.edtCodDeptEmprestimoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0'..'9',#08]) then
  begin
    key:=#0;
    Application.MessageBox('Campo Código, favor informar numeros.','Aviso',MB_OK+MB_IconQuestion);
  end;

end;

procedure TfrmEmprestimo.edtfuncionarioKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
  begin
    key:=#0;
    Application.MessageBox('Campo Código, favor informar numeros.','Aviso',MB_OK+MB_IconQuestion);
  end;
end;

procedure TfrmEmprestimo.edtQtdSaidaKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
  begin
    key:=#0;
    Application.MessageBox('Campo Numérico, favor informar numeros.','Aviso',MB_OK+MB_IconQuestion);
  end;
end;

procedure TfrmEmprestimo.edtQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
  begin
    key:=#0;
    Application.MessageBox('Campo Numérico, favor informar uma quantidade.','Aviso',MB_OK+MB_IconQuestion);
  end;
end;

procedure TfrmEmprestimo.edtCodResponChange(Sender: TObject);
begin
if (Trim(edtCodRespon.Text)<>'') then
  begin

    qryResponsavelEmprestimo.Close;
    qryResponsavelEmprestimo.Parameters.ParamByName('idUsuario').Value := StrToInt(edtCodRespon.Text);
    qryResponsavelEmprestimo.Open;

    qryDepartamentoEmprestimo.Close;
    qryDepartamentoEmprestimo.Parameters.ParamByName('idDepartamento').Value := qryResponsavelEmprestimoCodDepartamento.Value;
    qryDepartamentoEmprestimo.Open;
  end;

end;

procedure TfrmEmprestimo.edtCodResponKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
  begin
    key:=#0;
    Application.MessageBox('Campo Numérico, favor informar numeros.','Aviso',MB_OK+MB_IconQuestion);
  end;
end;

procedure TfrmEmprestimo.edtTecnicoKeyPress(Sender: TObject; var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
  begin
    key:=#0;
    Application.MessageBox('Campo Código, favor informar numeros.','Aviso',MB_OK+MB_IconQuestion);
  end;
end;

procedure TfrmEmprestimo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryProduto.Close;
  qryMovimentoProduto.Close;
  qryQtdProduto.Close;
  qryUsuario.Close;
  qryDepartamento.Close;
  qryTecnico.Close;
  qryDepartamentoEmprestimo.Close;
  qryResponsavelEmprestimo.Close;
  qryImprimeRequisicao.Close;
end;

procedure TfrmEmprestimo.FormCreate(Sender: TObject);
begin
  qryProduto.Close;
  qryProduto.Parameters.ParamByName('produto').Value:='%';
  qryProduto.Open;

  qryMovimentoProduto.Close;
  qryMovimentoProduto.Open;

  qryQtdProduto.Close;
  qryQtdProduto.Open;

  qryUsuario.Close;
  qryUsuario.Open;

  qryDepartamento.Close;
  qryDepartamento.Open;

  qryTecnico.Close;
  qryTecnico.Open;

  qryDepartamentoEmprestimo.Close;
  qryDepartamentoEmprestimo.Open;

  qryResponsavelEmprestimo.Close;
  qryResponsavelEmprestimo.Open;

  qryImprimeRequisicao.Close;
  qryImprimeRequisicao.Open;

  end;

procedure TfrmEmprestimo.FormShow(Sender: TObject);
begin
  pgMovimentacao.ActivePage := tsPesquisa;
end;

procedure TfrmEmprestimo.btnSalvaSaidaClick(Sender: TObject);
begin
  if ((Trim(edtCodFunc.Text) = '') and (Trim(edtQtdSaida.Text) = '')) then
  begin
    Application.MessageBox('Preencha todos os campos para continuar', 'Alerta', MB_OK+MB_ICONEXCLAMATION);
    if (edtCodFunc.CanFocus) then
    begin
      edtCodFunc.SetFocus;
    end;
  end

  else if (Trim(edtCodFunc.Text) = '') then
  begin
    Application.MessageBox('Informe o Funcionário Solicitante', 'Alerta',MB_OK+MB_ICONEXCLAMATION);
    if(edtCodFunc.CanFocus) then
    begin
      edtCodFunc.SetFocus;
    end;
  end

  else if (Trim(edtQtdSaida.Text) = '') then
  begin
    Application.MessageBox('Preencha a quantidade do Produto', 'Alerta', MB_OK+MB_ICONEXCLAMATION);
    if (edtQtdSaida.CanFocus) then
    begin
      edtQtdSaida.SetFocus;
    end;
  end

  else if (qryProduto.FieldByName('total_prd').AsInteger < StrToInt(edtQtdSaida.Text)) then
  begin
    Application.Messagebox(PChar('Quantidade Solicitada maior que a Disponivel em estoque.'+#13+ 'Quantidade Disponivel em Estoque: '+inttostr(qryProdutototal_prd.Value)),PChar('Alerta'), MB_OK+MB_ICONEXCLAMATION);
  end

  else if Application.MessageBox('Deseja Salvar a Entrada de Produto.','Confirmar',mb_YesNo+MB_IconQuestion)= IDYES then
  begin
    if (StrToInt(edtQtdSaida.Text) > 0) then
    begin
      qryMovimentoProduto.Edit;
      qryMovimentoProduto.FieldByName('CodTipoMovimento').Value := 2;
      qryMovimentoProduto.FieldByName('CodProduto').Value := qryProduto.FieldByName('IdProduto').Value;
      qryMovimentoProduto.FieldByName('CodUsuario').Value := StrToInt(edtCodFunc.Text);
      qryMovimentoProduto.FieldByName('CodTecnico').Value := frmLogin.qryLogin.FieldByName('idusuario').Value;
      qryMovimentoProduto.FieldByName('DataMovimento').Value := FormatDateTime('YYYY-MM-DD', now);
      qryMovimentoProduto.Post;
      Application.MessageBox('Movimento Salvo com Sucesso! Aguarde a Impressão do Termo de Responsabilidade.','Confirmação',MB_OK+MB_ICONINFORMATION);
      btnImprimeRequisicao.Click;
      pgMovimentacao.ActivePage := tsPesquisa;
    end
    else
    begin
      Application.MessageBox('Quantidade não pode ser menor ou igual a zero.', 'Alerta', MB_OK+MB_ICONEXCLAMATION);
      edtQuantidade.Clear;
    end;
  end;
end;

procedure TfrmEmprestimo.btnCancelarSaidaClick(Sender: TObject);
begin
  if Application.MessageBox('Desistir da Inclusão?', 'Confirmação',MB_YESNO+MB_IconQuestion) = IDYES then
  begin
    qryMovimentoProduto.Cancel;
    pgMovimentacao.ActivePage := tsPesquisa;
  end;
end;

procedure TfrmEmprestimo.SpeedButton17Click(Sender: TObject);
begin
  Application.CreateForm(TfrmPesquisa, frmPesquisa);
  try
    frmPesquisa.pesquisa := 'F';
    frmPesquisa.ShowModal;
  finally
    if (frmPesquisa.ModalResult = mrOk) then
    begin
      edtCodRespon.Text := IntToStr(frmPesquisa.funcionario);

      qryResponsavelEmprestimo.Close;
      qryResponsavelEmprestimo.Parameters.ParamByName('idUsuario').Value := StrToInt(edtCodRespon.Text);
      qryResponsavelEmprestimo.Open;

      qryDepartamentoEmprestimo.Close;
      qryDepartamentoEmprestimo.Parameters.ParamByName('idDepartamento').Value := qryResponsavelEmprestimoCodDepartamento.Value;
      qryDepartamentoEmprestimo.Open;


    end;
    frmPesquisa.Release;
    frmPesquisa := nil;
  end;
end;

procedure TfrmEmprestimo.SpeedButton19Click(Sender: TObject);
begin
   Application.CreateForm(TfrmPesquisa, frmPesquisa);
  try
    frmPesquisa.pesquisa := 'F';
    frmPesquisa.ShowModal;
  finally
    if (frmPesquisa.ModalResult = mrOk) then
    begin
      edtCodFunc.Text := IntToStr(frmPesquisa.funcionario);

      qryUsuario.Close;
      qryUsuario.Parameters.ParamByName('idUsuario').Value := StrToInt(edtCodFunc.Text);
      qryUsuario.Open;

      qryDepartamento.Close;
      qryDepartamento.Parameters.ParamByName('idDepartamento').Value := qryUsuarioCodDepartamento.Value;
      qryDepartamento.Open;
    end;
    frmPesquisa.Release;
    frmPesquisa := nil;
  end;
end;

procedure TfrmEmprestimo.btnSalvaEmprestimoClick(Sender: TObject);
begin
  if (Trim(edtCodRespon.Text) = '') then
  begin
    Application.MessageBox('Campo Responsável Vazio.','Alerta',MB_OK+MB_IconQuestion);
    if (edtCodRespon.CanFocus) then
    begin
      edtCodRespon.SetFocus;
    end;
  end

  else if Application.MessageBox('Deseja Salvar a Entrada de Produto.','Confirmar',mb_YesNo+MB_IconQuestion)= IDYES then
  begin
    qryMovimentoProduto.Edit;
    qryMovimentoProduto.FieldByName('CodTipoMovimento').Value := 3;
    qryMovimentoProduto.FieldByName('CodProduto').Value := qryProduto.FieldByName('IdProduto').Value;
    qryMovimentoProduto.FieldByName('CodUsuario').Value := edtCodRespon.Text;
    qryMovimentoProduto.FieldByName('CodTecnico').Value := frmLogin.qryLogin.FieldByName('idusuario').Value;
    qryMovimentoProduto.FieldByName('DataMovimento').Value := FormatDateTime('YYYY-MM-DD', now);
    qryMovimentoProduto.FieldByName('Quantidade').Value := 1;
    qryMovimentoProduto.Post;
    Application.MessageBox('Movimento Salvo com Sucesso!','Confirmação',MB_OK+MB_ICONINFORMATION);
    qryQtdProduto.Close;
    qryQtdProduto.Open;
    qryProduto.Close;
    qryProduto.Open;
    btnImprimiEmprestimo.Click;
    pgMovimentacao.ActivePage := tsPesquisa;
  end;
end;

procedure TfrmEmprestimo.btnCancelarProdutoClick(Sender: TObject);
begin
  if Application.MessageBox('Desistir da alteração?','Confirmar',MB_YESNO+MB_IconQuestion)=IDYES then
  begin
    qryProduto.Cancel;
    pgMovimentacao.ActivePage:=tsPesquisa;
  end;
end;

procedure TfrmEmprestimo.btnDeletarProdutoClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja excluir esse item?','Aviso', MB_YESNO+MB_IconQuestion) = mrYes then
  begin
    qryProduto.Delete;
    Application.MessageBox('Produto deletado com sucesso', 'Confirmação',MB_OK+MB_ICONINFORMATION);
    pgMovimentacao.ActivePage:= tsPesquisa;
  end;

end;

procedure TfrmEmprestimo.btnEditarNomeProdutoClick(Sender: TObject);
begin
  edtCodigoProduto.Text:= qryProduto.FieldByName('CodProduto').Value;
  edtCodigoProduto.ReadOnly := True;
  qryProduto.Edit;
  pgMovimentacao.ActivePage:= tsCadastro;
end;

procedure TfrmEmprestimo.btnEditarProdutoClick(Sender: TObject);
begin
  qryProduto.Edit;
end;

procedure TfrmEmprestimo.btnImprimeRequisicaoClick(Sender: TObject);
begin
  qryImprimeRequisicao.Parameters.ParamByName('idmovimento').Value := qryMovimentoProdutoIdMovimento.Value;
  qryImprimeRequisicao.Close;
  qryImprimeRequisicao.Open;
  ppRequisicao.Print;
end;

procedure TfrmEmprestimo.btnImprimiEmprestimoClick(Sender: TObject);
begin
  qryImprimeRequisicao.Parameters.ParamByName('idmovimento').Value := qryMovimentoProdutoIdMovimento.Value;
  qryImprimeRequisicao.Close;
  qryImprimeRequisicao.Open;
  ppEmprestimo.Print;
end;

procedure TfrmEmprestimo.btnNovoClick(Sender: TObject);
begin
  status := 'N';
  pgMovimentacao.ActivePage:= tsCadastro;
  if (edtCodigoProduto.CanFocus) then
  begin
    edtCodigoProduto.SetFocus;
    qryProduto.Insert;
  end;
end;

procedure TfrmEmprestimo.btnProximoClick(Sender: TObject);
begin
  status := 'I';
  movimento:= qryProduto.FieldByName('codproduto').Value;
  pgMovimentacao.ActivePage := tsMovimentacao;
end;

procedure TfrmEmprestimo.btnSalvarClick(Sender: TObject);
begin
  if (Trim(edtQuantidade.Text) = '') then
  begin
    Application.MessageBox('Preencha a quantidade do Produto', 'Alerta', MB_OK+MB_IconQuestion);
    if (edtQuantidade.CanFocus) then
    begin
      edtQuantidade.SetFocus;
    end;
  end;

  if Application.MessageBox('Deseja Salvar a Entrada de Produto.','Confirmar',mb_YesNo+MB_IconQuestion)= IDYES then
  begin
    if (StrToInt(edtQuantidade.Text) > 0) then
    begin
      qryMovimentoProduto.Edit;
      qryMovimentoProduto.FieldByName('CodTipoMovimento').Value := 1;
      qryMovimentoProduto.FieldByName('CodProduto').Value := qryProduto.FieldByName('IdProduto').Value;
      qryMovimentoProduto.FieldByName('CodUsuario').Value := frmLogin.qryLogin.FieldByName('idusuario').Value;
      qryMovimentoProduto.FieldByName('CodTecnico').Value := frmLogin.qryLogin.FieldByName('idusuario').Value;
      qryMovimentoProduto.FieldByName('DataMovimento').Value := FormatDateTime('YYYY-MM-DD', now);
      qryMovimentoProduto.Post;
      qryQtdProduto.Close;
      qryQtdProduto.Open;
      qryProduto.Close;
      qryProduto.Open;
      Application.MessageBox('Movimento Salvo com Sucesso!','Confirmação',MB_OK+MB_ICONINFORMATION);
      pgMovimentacao.ActivePage := tsPesquisa;

    end
    else
    begin
      Application.MessageBox('Quantidade não pode ser menor ou igual a zero.', 'Alerta', MB_OK+MB_ICONEXCLAMATION);
      edtQuantidade.Clear;
    end;
  end;

end;

procedure TfrmEmprestimo.btnSalvarProdutoClick(Sender: TObject);
begin
  if (qryProduto.State in [dsInsert]) then
  begin
    qryVerificaProduto.Close;
    qryVerificaProduto.Parameters.ParamByName('codmaterial').Value:=edtCodigoProduto.Text;
    qryVerificaProduto.Parameters.ParamByName('material').Value:=edtNomeProduto.Text;
    qryVerificaProduto.Open;
    if (qryVerificaProduto.RecordCount > 0) then
    begin
      Application.MessageBox('Material já cadastrado na base de dados.','Alerta',MB_OK+MB_ICONEXCLAMATION);
      qryProduto.ClearFields;
      Abort;
    end;
  end;

  if (qryProduto.State in [dsInsert,dsEdit]) then
  begin
    if (edtCodigoProduto.Text = Trim('')) then
    begin
      Application.MessageBox('Campo Código Vazio.','Aviso',MB_OK+MB_ICONEXCLAMATION);
      if (edtCodigoProduto.CanFocus) then
      begin
        edtCodigoProduto.SetFocus;
      end;
    end

    else if (edtNomeProduto.Text = Trim('')) then
    begin
       Application.MessageBox('Campo Nome Produto Vazio.','Aviso',MB_OK+MB_ICONEXCLAMATION);
      if (edtNomeProduto.CanFocus) then
      begin
        edtNomeProduto.SetFocus;
      end;
    end

    else if ((edtCodigoProduto.Text = Trim('')) and (edtNomeProduto.Text = trim(''))) then
    begin
       Application.MessageBox('Um ou mais Campos não foram preenchidos','Aviso',MB_OK+MB_ICONEXCLAMATION);
    end

    else if Application.MessageBox('Deseja Salvar o Cadastro','Confirmação',MB_YESNO+MB_IconQuestion) = IDYES then
    begin
      qryProduto.Post;
      Application.MessageBox('Registro Salvo com Sucesso','Confirmação',MB_OK+MB_ICONINFORMATION);
      qryProduto.Close;
      pgMovimentacao.ActivePage:= tsPesquisa;
      qryProduto.Open;
    end;
  end;
end;

procedure TfrmEmprestimo.dsMovimentoProdutoStateChange(Sender: TObject);
begin
  if ((status <> 'N') or (status = '')) then
  begin
    btnSalvar.Enabled:= (dsMovimentoProduto.State in [dsInsert,dsEdit]);
    btnEditar.Enabled:= ((dsMovimentoProduto.State in [dsBrowse]) and not (qryProduto.IsEmpty));
    btnDeletar.Enabled:= (dsMovimentoProduto.State in [dsEdit]);
    btnCancelar.Enabled:= (dsMovimentoProduto.State in [dsInsert,dsEdit]);

    btnSalvaSaida.Enabled:= (dsMovimentoProduto.State in [dsInsert,dsEdit]);
    btnEditaSaida.Enabled:= ((dsMovimentoProduto.State in [dsBrowse]) and not (qryProduto.IsEmpty));
    btnDeletarSaida.Enabled:= (dsMovimentoProduto.State in [dsEdit]);
    btnCancelarSaida.Enabled:= (dsMovimentoProduto.State in [dsInsert,dsEdit]);

    btnSalvaEmprestimo.Enabled:= (dsMovimentoProduto.State in [dsInsert,dsEdit]);
    btnEditaEmprestimo.Enabled:= ((dsMovimentoProduto.State in [dsBrowse]) and not (qryProduto.IsEmpty));
    btnDeletaEmprestimo.Enabled:= (dsMovimentoProduto.State in [dsEdit]);
    btnCancelaEmprestimo.Enabled:= (dsMovimentoProduto.State in [dsInsert,dsEdit]);
  end;
end;

procedure TfrmEmprestimo.dsProdutoStateChange(Sender: TObject);
begin
  if status = 'N' then
  begin
    btnSalvar.Enabled:= (dsProduto.State in [dsInsert,dsEdit]);
    btnEditar.Enabled:= ((dsProduto.State in [dsBrowse]) and not (qryProduto.IsEmpty));
    btnDeletar.Enabled:= (dsProduto.State in [dsEdit]);
    btnCancelar.Enabled:= (dsProduto.State in [dsInsert,dsEdit]);
  end;
end;


procedure TfrmEmprestimo.SpeedButton21Click(Sender: TObject);
begin
  if (rbEntrada.Checked = True) then
  begin
    pgMovimentacao.ActivePage := tsEntrada;
    qryMovimentoProduto.Insert;
    if (edtQuantidade.CanFocus) then
    begin
      edtQuantidade.SetFocus;
    end;
  end
  else if (rbSaida.Checked = True) then
  begin
    if (qryProduto.FieldByName('total_prd').AsInteger = 0) then
    begin
      Application.MessageBox('Produto Indisponível no Estoque.', 'Alerta',MB_OK+MB_ICONEXCLAMATION);
      pgMovimentacao.ActivePage := tsPesquisa;
    end
    else if (qryProduto.FieldByName('IdProduto').AsInteger =9) then
    begin
      Application.MessageBox('Produto Disponivel apenas para Empréstimo, solicite a Requisição do Produto', 'Alerta',MB_OK+MB_ICONEXCLAMATION);
      pgMovimentacao.ActivePage := tsMovimentacao;
    end
    else
    begin
      qryMovimentoProduto.Insert;
      pgMovimentacao.ActivePage := tsSaida;
    end;

  end
  else if (rbEmprestimo.Checked = True) then
  begin
    if (qryProduto.FieldByName('IdProduto').AsInteger <> 9) then
    begin
      Application.MessageBox('Produto não Disponivel para Emprestimo, solicite a Requisição do Produto', 'Alerta',MB_OK+MB_ICONEXCLAMATION);
      pgMovimentacao.ActivePage := tsPesquisa;
    end
    else if ((qryProduto.FieldByName('IdProduto').AsInteger = 9) and (qryProduto.FieldByName('total_prd').AsInteger = 0)) then
    begin
      Application.MessageBox('Produto se encontra emprestado.','Alerta',MB_OK+MB_ICONEXCLAMATION);
      pgMovimentacao.ActivePage := tsPesquisa;
    end
    else
    begin
      qryMovimentoProduto.Insert;
      pgMovimentacao.ActivePage := tsEmprestimo;
    end;
  end
  else
  begin
    Application.MessageBox('Por favor, escolha ao menos uma das opções!','Alerta',MB_OK+MB_ICONEXCLAMATION);
  end;
end;

procedure TfrmEmprestimo.btnCancelaEmprestimoClick(Sender: TObject);
begin
  if Application.MessageBox('Cancelar o Empréstimo?','Confirmar',MB_YESNO+MB_IconQuestion)=IDYES then
  begin
    qryProduto.Cancel;
    pgMovimentacao.ActivePage:=tsPesquisa;
  end;
end;

procedure TfrmEmprestimo.tsEmprestimoShow(Sender: TObject);
begin
  edtDataEmprestimno.Text :=   FormatDateTime('DD/MM/YYYY', Now);
end;

procedure TfrmEmprestimo.tsSaidaShow(Sender: TObject);
begin
  qryTecnico.Close;
  edtCodTec.Text := IntToStr(frmLogin.qryLogin.FieldByName('IdUsuario').Value);
  qryTecnico.Parameters.ParamByName('idUsuario').Value := frmLogin.qryLogin.FieldByName('IdUsuario').Value;
  qryTecnico.Open;
end;

procedure TfrmEmprestimo.btnVoltarClick(Sender: TObject);
begin
  pgMovimentacao.ActivePage := tsPesquisa;
end;

procedure TfrmEmprestimo.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with DBGrid1 do
  begin
    If gdSelected in State then
    begin
      Canvas.Brush.Color := RGB(141,182,205);
      Canvas.Font.Color := clWhite;
    end

    else if (qryProduto.FieldByName('total_prd').AsInteger = 0) then
    begin
      Canvas.Brush.Color := $00D2D2FF;
    end

    else Canvas.Brush.Color := clWindow;

    Canvas.FillRect(Rect);
    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;

end;

procedure TfrmEmprestimo.DBGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if (qryProduto.FieldByName('total_prd').AsInteger = 0) then
  begin
    DBGrid1.ShowHint := True;
    DBGrid1.Hint := 'Produto Indisponivel';
    Application.HintHidePause:=20000;
  end
  else
  begin
    DBGrid1.ShowHint := True;
    DBGrid1.Hint := 'Produto disponivel ' +#13+'Quantidade em Estoque: '+ IntToStr(qryProdutototal_prd.Value);
    Application.HintHidePause:=20000;
  end;
end;

procedure TfrmEmprestimo.btnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Desistir da Inclusão?','Confirmar',MB_YESNO+MB_IconQuestion)=IDYES then
  begin
    edtQuantidade.Clear;
    qryMovimentoProduto.Cancel;
    pgMovimentacao.ActivePage := tsPesquisa;
  end;
end;
end.
