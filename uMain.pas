unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.jpeg, Vcl.Menus, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Data.Win.ADODB, ShellAPI, WinInet, Vcl.DBCtrls, Vcl.Mask, ppCtrls,
  Vcl.Imaging.pngimage, ppPrnabl, ppClass, ppDB, ppDBPipe, ppBands, ppCache,
  ppDesignLayer, ppParameter, ppComm, ppRelatv, ppProd, ppReport, ppStrtch,
  ppMemo, Vcl.DBCGrids, Vcl.ImgList;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    btnOrdem: TSpeedButton;
    btnEstoque: TSpeedButton;
    btnUsuario: TSpeedButton;
    btnDados: TSpeedButton;
    btnMaquina: TSpeedButton;
    PgControle: TPageControl;
    TsMaquinas: TTabSheet;
    TsEmprestimo: TTabSheet;
    tsOrdem: TTabSheet;
    btnAgenda: TSpeedButton;
    btnChamado: TSpeedButton;
    Image1: TImage;
    btnSair: TSpeedButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    grdMaquinas: TDBGrid;
    edtPesquisaMaquina: TEdit;
    SpeedButton2: TSpeedButton;
    grdEmprestimo: TDBGrid;
    edtPesquisaEmprestimo: TEdit;
    SpeedButton10: TSpeedButton;
    edtPesquisaServico: TEdit;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    qryMaquinas: TADOQuery;
    dsMaquina: TDataSource;
    qryMaquinasIdMaquina: TAutoIncField;
    qryMaquinasCodUsuario: TIntegerField;
    qryMaquinasCodSistema: TIntegerField;
    qryMaquinasIp: TStringField;
    qryMaquinasNomeMaquina: TStringField;
    qryMaquinasMac: TStringField;
    strngfldMaquinasNome: TStringField;
    strngfldMaquinasDescricao: TStringField;
    pmMaquina: TPopupMenu;
    Ping1: TMenuItem;
    VNC1: TMenuItem;
    Detahes1: TMenuItem;
    pnlDetalhe: TPanel;
    strngfldMaquinasSistemaOperacional: TStringField;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl8: TLabel;
    dbedtNome: TDBEdit;
    lbl13: TLabel;
    dbedtDescricao: TDBEdit;
    lbl14: TLabel;
    dbedtSistemaOperacional: TDBEdit;
    dbtxtNome: TDBText;
    dbtxtDescricao: TDBText;
    dbtxtNomeMaquina: TDBText;
    dbtxtIp: TDBText;
    dbtxtMac: TDBText;
    dbtxtSistemaOperacional: TDBText;
    qryMaquinaDetalhe: TADOQuery;
    dsoMaquinaDetalhe: TDataSource;
    qryMaquinaDetalheIdMaquina: TAutoIncField;
    qryMaquinaDetalheCodUsuario: TIntegerField;
    qryMaquinaDetalheCodSistema: TIntegerField;
    strngfldMaquinaDetalheIp: TStringField;
    strngfldMaquinaDetalheNomeMaquina: TStringField;
    strngfldMaquinaDetalheMac: TStringField;
    qryMaquinaDetalheIdUsuario: TAutoIncField;
    qryMaquinaDetalheCodDepartamento: TIntegerField;
    qryMaquinaDetalheCodTipoUsuario: TIntegerField;
    strngfldMaquinaDetalheNome: TStringField;
    strngfldMaquinaDetalheLogin: TStringField;
    strngfldMaquinaDetalheSenha: TStringField;
    qryMaquinaDetalheIdDepartamento: TAutoIncField;
    strngfldMaquinaDetalheDescricao: TStringField;
    strngfldMaquinaDetalheRamal: TStringField;
    qryMaquinaDetalheIdSistema: TAutoIncField;
    strngfldMaquinaDetalheSistemaOperacional: TStringField;
    qryMaquinasIdUsuario: TAutoIncField;
    qryOrdemServico: TADOQuery;
    dsOrdemServico: TDataSource;
    dbgrd1: TDBGrid;
    pmOS: TPopupMenu;
    FecharOS1: TMenuItem;
    Detalhe1: TMenuItem;
    dsOSDetalhe: TDataSource;
    qryOSDetalhe: TADOQuery;
    cmdFechaOS: TADOCommand;
    pnlFecha: TPanel;
    mmo1: TMemo;
    lbl7: TLabel;
    lbl9: TLabel;
    ImprimirOS1: TMenuItem;
    relOrdemServico1: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppOrdemServico: TppDBPipeline;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    plbl1: TppLabel;
    ppDBText4: TppDBText;
    plbl2: TppLabel;
    ppDBMemo1: TppDBMemo;
    plbl3: TppLabel;
    ppDBText5: TppDBText;
    plbl4: TppLabel;
    ppDBMemo2: TppDBMemo;
    plbl5: TppLabel;
    ppDBText6: TppDBText;
    plbl6: TppLabel;
    ppDBText7: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    strngfldOSDetalhedescricao: TStringField;
    strngfldOSDetalheNOME: TStringField;
    strngfldOSDetalheTECDESCRICAO: TStringField;
    strngfldOSDetalheTECNOME: TStringField;
    strngfldOSDetalheOsFinalizada: TStringField;
    ppDBText11: TppDBText;
    qryOSDetalheidOrdemServico: TAutoIncField;
    plbl7: TppLabel;
    plbl8: TppLabel;
    qryOrdemServicoIdOrdemServico: TAutoIncField;
    qryOrdemServicoFuncionario: TStringField;
    qryOrdemServicoDescricao: TStringField;
    qryOrdemServicoTecnico: TStringField;
    qryOrdemServicoOsFinalizada: TStringField;
    qryOSDetalheMotivo: TMemoField;
    qryOSDetalheResultado: TMemoField;
    qryOSDetalheDataIni: TWideStringField;
    strngfldOSDetalheHoraIni: TStringField;
    qryOSDetalheDataFim: TWideStringField;
    strngfldOSDetalheHoraFim: TStringField;
    qryOrdemServicoDataFim: TWideStringField;
    pnlOSDetalhe: TPanel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    dbtxtNOME1: TDBText;
    dbmmoMotivo: TDBMemo;
    dbmmoResultado: TDBMemo;
    dbtxtTECNOME: TDBText;
    dbtxtidOrdemServico: TDBText;
    lblStatus: TLabel;
    lbl20: TLabel;
    plbl9: TppLabel;
    plbl10: TppLabel;
    lbl19: TLabel;
    lbl21: TLabel;
    tsTelefone: TTabSheet;
    dbgrdPedidoTelefone: TDBGrid;
    SpeedButton1: TSpeedButton;
    tsRecados: TTabSheet;
    Label9: TLabel;
    qryRecUrgente: TADOQuery;
    dsRecUrgente: TDataSource;
    DBCtrlGrid1: TDBCtrlGrid;
    dbmmoMensagem: TDBMemo;
    qryRecUrgenteAssunto: TStringField;
    qryRecUrgenteHora: TStringField;
    qryRecUrgenteData: TStringField;
    qryRecUrgenteNome: TStringField;
    qryRecUrgenteUrgente: TStringField;
    qryRecUrgenteMensagem: TStringField;
    Image5: TImage;
    dbNome: TDBText;
    dbtxtData: TDBText;
    Image3: TImage;
    dbtxtHora: TDBText;
    Image4: TImage;
    dbtxtAssunto: TDBText;
    Image2: TImage;
    tsChamado: TTabSheet;
    pnlTelefone: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    qryPedidoTelefone: TADOQuery;
    dsPedidoTelefone: TDataSource;
    qryPedidoTelefoneSolicitante: TStringField;
    qryPedidoTelefoneLocalouNome: TStringField;
    qryPedidoTelefoneTelefone: TStringField;
    qryPedidoTelefoneDataHora: TStringField;
    qryPedidoTelefoneStatus: TStringField;
    img1: TImage;
    img2: TImage;
    edtBuscaTel: TEdit;
    rbAberto: TRadioButton;
    rbFinalizado: TRadioButton;
    rbRecusado: TRadioButton;
    tmrAtualizaGrid: TTimer;
    qryPedidoTelefoneIdPedidoLigacao: TAutoIncField;
    pnlRecusaLigacao: TPanel;
    lbl12: TLabel;
    btnGravar: TSpeedButton;
    lbl22: TLabel;
    mmoRecusaLigacao: TMemo;
    btn1: TSpeedButton;
    qryPedidoTelefoneDescricaoPedido: TStringField;
    qryPedidoTelefoneMotivoRejeicao: TStringField;
    spAlteraStatus: TADOStoredProc;
    qryPedidoTelefoneDataHoraEncerramento: TStringField;
    img3: TImage;
    blnhnt1: TBalloonHint;
    Etiqueta1: TMenuItem;
    N1: TMenuItem;
    ppREtiqueta: TppReport;
    ppParameterList2: TppParameterList;
    ppDBPEtiqueta: TppDBPipeline;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel5: TppLabel;
    ppDBText12: TppDBText;
    ppLabel6: TppLabel;
    ppDBText13: TppDBText;
    ppLabel8: TppLabel;
    ppDBText14: TppDBText;
    ppLabel9: TppLabel;
    procedure btnDadosClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure btnEstoqueClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure btnMaquinaClick(Sender: TObject);
    procedure btnOrdemClick(Sender: TObject);
    procedure btnAgendaClick(Sender: TObject);
    procedure btnChamadoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Ping1Click(Sender: TObject);
    procedure VNC1Click(Sender: TObject);
    procedure lbl8Click(Sender: TObject);
    procedure Detahes1Click(Sender: TObject);
    procedure FecharOS1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure lbl9Click(Sender: TObject);
    procedure ImprimirOS1Click(Sender: TObject);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Detalhe1Click(Sender: TObject);
    procedure lbl20Click(Sender: TObject);
    procedure lbl21Click(Sender: TObject);
    procedure teste1Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure grdMaquinasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdEmprestimoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure dbgrdPedidoTelefoneDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tmrAtualizaGridTimer(Sender: TObject);
    procedure edtBuscaTelChange(Sender: TObject);
    procedure dbgrdPedidoTelefoneCellClick(Column: TColumn);
    procedure lbl22Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure rbRecusadoClick(Sender: TObject);
    procedure rbAbertoClick(Sender: TObject);
    procedure rbFinalizadoClick(Sender: TObject);
    procedure Etiqueta1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uCadastroDepartamento, uEmprestimoMaterial, uCadastroTipoUsuario,
  uGeradorRelatorio, uCadastroUsuario, uCadastroMaquina, uOrdemServico, uLogin,
  uNivelParticularidade, uPedidoTelefonema, uCadTelefone, uNoticia, uChamado;

procedure TfrmMain.FecharOS1Click(Sender: TObject);
begin
  qryOSDetalhe.Close;
  qryOSDetalhe.Parameters.ParamByName('idOrdemServico').Value := qryOrdemServicoIdOrdemServico.Value;
  qryOSDetalhe.Open;

  if (qryOSDetalhe.RecordCount >0) then
  begin
    if (qryOrdemServico.FieldByName('OsFinalizada').AsString = 'Pendente') then
    begin
      if (pnlFecha.Visible = False) then
      begin
        pnlFecha.Visible := True;
        pnlFecha.top := (self.Height div 2) - (pnlDetalhe.height div 2);
        pnlFecha.left := (self.Width div 2) - (pnlDetalhe.width div 2);
      end;
    end
    else
    begin
      Application.MessageBox('Ordem de Serviço já finalizada.','Aviso',MB_OK+MB_IconQuestion);
      Abort;
    end;
  end
  else
  begin
    Application.MessageBox('Não existe Ordem de Serviço em aberto.','Aviso',MB_OK+MB_IconQuestion);
    Abort;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if application.MessageBox ('Deseja Realmente Sair do Sistema?','Confirma',mb_YesNo+MB_iconQuestion) <> IdYes then
  begin
    Action:=caNone;
  end
  else
  begin
    Action:=cafree;
    Application.Terminate;
  end;
  qryPedidoTelefone.Close;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  qryPedidoTelefone.Close;
  qryPedidoTelefone.Parameters.ParamByName('status').Value := 'A';
  qryPedidoTelefone.Open;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  StatusBar1.Panels[1].Text:= frmLogin.qryLogin.FieldByName('login').Value;

  qryMaquinas.Close;
  qryMaquinas.Open;
  qryOrdemServico.Close;
  qryOrdemServico.Open;

  //nivel de particularidade-
  if (frmLogin.qryLogin.FieldByName('CodTipoUsuario').Value = 1) then //Administrador
  begin
    pmOS.Items.Items[0].Enabled := True;
  end
  else if (frmLogin.qryLogin.FieldByName('CodTipoUsuario').Value = 3) then //Tecnico
  begin
    pmOS.Items.Items[0].Enabled := True;
    qryOrdemServico.Close;
    qryOrdemServico.SQL.Clear;
    qryOrdemServico.SQL.Text := 'SELECT OrdemServico.IdOrdemServico,                             '+
                                '       Usuario.Nome AS Funcionario,                             '+
                                '       Departamento.Descricao,                                  '+
                                '       TEC.Nome AS Tecnico,                                     '+
                                '       Convert(varchar, OrdemServico.DataFim, 104) AS DataFim,  '+
                                '       CASE                                                     '+
                                '         WHEN OrdemServico.OsFinalizada = ''S'' THEN ''Concluída'' '+
                                '       ELSE ''Pendente''                                            '+
                                '       END AS OsFinalizada                                      '+
                                'FROM ORDEMSERVICO                                               '+
                                '     INNER JOIN USUARIO                                            '+
                                '     ON USUARIO.IdUsuario = ORDEMSERVICO.CodUsuario                '+
                                '     INNER JOIN DEPARTAMENTO                                    '+
                                '     ON DEPARTAMENTO.IdDepartamento = USUARIO.CodDepartamento '+
                                '     INNER JOIN USUARIO AS TEC                                     '+
                                '     ON TEC.IdUsuario = ORDEMSERVICO.CodTecnico                    '+
                                'WHERE TEC.idUsuario =:IdUsuario';

    qryOrdemServico.Parameters.ParamByName('IdUsuario').DataType := ftInteger;
    qryOrdemServico.Parameters.ParamByName('IdUsuario').Value := frmLogin.qryLogin.FieldByName('IdUsuario').Value;
    qryOrdemServico.Open;
  end
  else if (frmLogin.qryLogin.FieldByName('CodTipoUsuario').Value = 4) then
  begin
    pmOS.Items.Items[0].Enabled := False;

    qryOrdemServico.Close;
    qryOrdemServico.SQL.Clear;
    qryOrdemServico.SQL.Text := 'SELECT OrdemServico.IdOrdemServico,                             '+
                                '       Usuario.Nome AS Funcionario,                             '+
                                '       Departamento.Descricao,                                  '+
                                '       TEC.Nome AS Tecnico,                                     '+
                                '       Convert(varchar, OrdemServico.DataFim, 104) AS DataFim,  '+
                                '       CASE                                                     '+
                                '         WHEN OrdemServico.OsFinalizada = ''S'' THEN ''Concluída'' '+
                                '       ELSE ''Pendente''                                            '+
                                '       END AS OsFinalizada                                      '+
                                'FROM ORDEMSERVICO                                               '+
                                '     INNER JOIN USUARIO                                            '+
                                '     ON USUARIO.IdUsuario = ORDEMSERVICO.CodUsuario                '+
                                '     INNER JOIN DEPARTAMENTO                                    '+
                                '     ON DEPARTAMENTO.IdDepartamento = USUARIO.CodDepartamento '+
                                '     INNER JOIN USUARIO AS TEC                                     '+
                                '     ON TEC.IdUsuario = ORDEMSERVICO.CodTecnico                    '+
                                'WHERE Usuario.idUsuario =:IdUsuario';

    qryOrdemServico.Parameters.ParamByName('IdUsuario').DataType := ftInteger;
    qryOrdemServico.Parameters.ParamByName('IdUsuario').Value := frmLogin.qryLogin.FieldByName('IdUsuario').Value;
    qryOrdemServico.Open;
  end;

  if (qryMaquinas.RecordCount > 0) then
  begin
    grdMaquinas.PopupMenu := pmMaquina;
  end;

  if (qryOrdemServico.RecordCount > 0) then
  begin
    dbgrd1.PopupMenu := pmOS;
  end;

  qryRecUrgente.Close;
  qryRecUrgente.Open;

 { if (qryPedidoTelefone.FieldByName('Status').AsString = 'ABERTO') then
  begin
    dbgrdPedidoTelefone.Columns[4].Width := 130;
  end
  else
  begin
    dbgrdPedidoTelefone.Columns[4].Width := 330;
  end; }
end;

procedure TfrmMain.grdEmprestimoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 {with grdEmprestimo do
 begin
    if (gdSelected in State) then
    begin
      Canvas.Brush.Color := RGB(141,182,205);
      //Canvas.Font.Color := clWhite;
    end
    else
    if Odd(dsMaquina.DataSet.RecNo) then
    begin
      Canvas.Brush.Color := clGradientActiveCaption;
    end
    else
    begin
      Canvas.Brush.Color := clWindow
    end;
    Canvas.FillRect(Rect);
    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;}
end;

procedure TfrmMain.grdMaquinasDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 with grdMaquinas do
 begin
    if (gdSelected in State) then
    begin
      Canvas.Brush.Color := RGB(141,182,205);
      //Canvas.Font.Color := clWhite;
    end
    else
    if Odd(dsMaquina.DataSet.RecNo) then
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

procedure TfrmMain.ImprimirOS1Click(Sender: TObject);
begin
  qryOSDetalhe.Close;
  qryOSDetalhe.Parameters.ParamByName('idOrdemServico').Value := qryOrdemServicoIdOrdemServico.Value;
  qryOSDetalhe.Open;

  if (qryOSDetalhe.RecordCount >0) then
  begin
    if (qryOSDetalhe.RecordCount > 0) then
    begin
      if (qryOSDetalhe.FieldByName('OsFinalizada').AsString = 'S') then
      begin
        plbl10.Caption := 'CONCLUÍDA';
        plbl10.Font.Color := clGreen;
      end
      else
      begin
        plbl10.Caption := 'PENDENTE';
        plbl10.Font.Color := clRed;
      end;

      relOrdemServico1.Print;
    end
    else
    begin
      Application.MessageBox('Não há dados para impressão.','Aviso',MB_OK+MB_IconQuestion);
      Abort;
    end;
  end
  else
  begin
    Application.MessageBox('Não existe Ordem de Serviço em aberto.','Aviso',MB_OK+MB_IconQuestion);
    Abort;
  end;

end;

procedure TfrmMain.Label1Click(Sender: TObject);
begin
  frmRelatorio.ShowModal;
end;

procedure TfrmMain.Label2Click(Sender: TObject);
begin
  try
    frmCadastroDepartamento:= TfrmCadastroDepartamento.Create(nil);
    frmCadastroDepartamento.ShowModal;
  finally
    frmCadastroDepartamento.Free;
  end;
end;

procedure TfrmMain.Label5Click(Sender: TObject);
begin
  try
    frmTipoUsuario:=TfrmTipoUsuario.Create(nil);
    frmTipoUsuario.showmodal;
  finally
    frmTipoUsuario.Free;
  end;
end;

procedure TfrmMain.Label6Click(Sender: TObject);
begin
  try
    frmCadTelefone := TfrmCadTelefone.Create(nil);
    frmCadTelefone.ShowModal;
  finally
    frmCadTelefone.Free;
  end;
end;

procedure TfrmMain.Label8Click(Sender: TObject);
begin
  try
    frmTelefone := TfrmTelefone.Create(nil);
    frmTelefone.qryPedido.Close;
    frmTelefone.qryPedido.Open;
    frmTelefone.qryPedido.Insert;
    frmTelefone.ShowModal;
  finally
    frmTelefone.Free;
  end;
end;

procedure TfrmMain.lbl20Click(Sender: TObject);
begin
  if (pnlOSDetalhe.Visible = True) then
  begin
    pnlOSDetalhe.Visible := False;
  end
  else
  begin
    pnlOSDetalhe.Visible := True;
  end;
end;

procedure TfrmMain.lbl21Click(Sender: TObject);
begin
  try
    frmNivelParticularidade:=TfrmNivelParticularidade.Create(nil);
    frmNivelParticularidade.showmodal;
  finally
    frmNivelParticularidade.Free;
  end;
end;

procedure TfrmMain.lbl22Click(Sender: TObject);
begin
  pnlRecusaLigacao.Visible := False;
end;

procedure TfrmMain.lbl8Click(Sender: TObject);
begin
  pnlDetalhe.Visible := False;
end;

procedure TfrmMain.lbl9Click(Sender: TObject);
begin
  pnlFecha.Visible := False;
end;

procedure TfrmMain.Ping1Click(Sender: TObject);
var
  ip: String;
begin
  ip := qryMaquinas.FieldByName('ip').AsString;
  ShellExecute(0, nil, 'cmd.exe', PChar('/c ping '+ ip + ' -t'), nil, SW_SHOWNOACTIVATE);
end;

procedure TfrmMain.rbAbertoClick(Sender: TObject);
begin
  if (rbAberto.Checked = True) then
  begin
    qryPedidoTelefone.Close;
    qryPedidoTelefone.Parameters.ParamByName('status').Value := 'A';
    dbgrdPedidoTelefone.Columns[3].FieldName := 'DataHora';
    dbgrdPedidoTelefone.Columns[3].Title.Caption := 'DataHora Pedido';
    dbgrdPedidoTelefone.Columns[4].Title.Caption := 'DescricaoPedido';

    dbgrdPedidoTelefone.Columns[0].Width := 250;
    dbgrdPedidoTelefone.Columns[1].Width := 200;
    dbgrdPedidoTelefone.Columns[2].Width := 250;
    dbgrdPedidoTelefone.Columns[3].Width := 200;
    dbgrdPedidoTelefone.Columns[4].Width := 330;
    dbgrdPedidoTelefone.Columns[5].Width := 100;
    dbgrdPedidoTelefone.Columns[5].Width := 100;
    qryPedidoTelefone.Open;
  end;
end;

procedure TfrmMain.rbFinalizadoClick(Sender: TObject);
begin
  if (rbFinalizado.Checked = True) then
  begin
    qryPedidoTelefone.Close;
    qryPedidoTelefone.Parameters.ParamByName('status').Value := 'F';

    dbgrdPedidoTelefone.Columns[0].Width := 400;
    dbgrdPedidoTelefone.Columns[1].Width := 330;
    dbgrdPedidoTelefone.Columns[2].Width := 400;
    dbgrdPedidoTelefone.Columns[4].Width := 100;

    dbgrdPedidoTelefone.Columns[3].FieldName := 'DataHoraEncerramento';
    dbgrdPedidoTelefone.Columns[4].FieldName := '';

    dbgrdPedidoTelefone.Columns[3].Title.Caption := 'DataHora Enc.';
    dbgrdPedidoTelefone.Columns[4].Title.Caption := 'Status';

    qryPedidoTelefone.Open;
  end;
end;

procedure TfrmMain.rbRecusadoClick(Sender: TObject);
begin
  if (rbRecusado.Checked = True) then
  begin
    qryPedidoTelefone.Close;
    qryPedidoTelefone.Parameters.ParamByName('status').Value := 'R';

    dbgrdPedidoTelefone.Columns[3].FieldName := 'DataHoraEncerramento';
    dbgrdPedidoTelefone.Columns[4].FieldName := 'MotivoRejeicao';

    dbgrdPedidoTelefone.Columns[3].Title.Caption := 'DataHora Enc.';
    dbgrdPedidoTelefone.Columns[4].Title.Caption := 'Motivo Rejeicao';

    dbgrdPedidoTelefone.Columns[0].Width := 250;
    dbgrdPedidoTelefone.Columns[1].Width := 200;
    dbgrdPedidoTelefone.Columns[2].Width := 250;
    dbgrdPedidoTelefone.Columns[3].Width := 200;
    dbgrdPedidoTelefone.Columns[4].Width := 530;
    qryPedidoTelefone.Open;
  end;
end;

procedure TfrmMain.btnOrdemClick(Sender: TObject);
begin
  if (Panel2.Visible = True) then
  begin
    Panel2.Visible := False;
  end;

  if (pnlTelefone.Visible = True) then
  begin
    pnlTelefone.Visible := False;
  end;

  try
    frmOrdemServico:= TfrmOrdemServico.Create(nil);
    frmOrdemServico.ShowModal;
  finally
    frmOrdemServico.Free;
  end;

end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  if (Panel2.Visible = True) then
  begin
    Panel2.Visible := False;
  end;

  if (pnlTelefone.Visible = True) then
  begin
    pnlTelefone.Visible := False;
  end;

  try
    frmNoticia := TfrmNoticia.Create(nil);
    frmNoticia.ShowModal;
  finally
    frmNoticia.Free;
  end;
end;

procedure TfrmMain.SpeedButton2Click(Sender: TObject);
begin
  if (Panel2.Visible = True) then
  begin
    Panel2.Visible := False;
  end;

  try
    frmEmprestimo:= TfrmEmprestimo.Create(nil);
    frmEmprestimo.ShowModal;
  finally
    frmEmprestimo.Free;
  end;

end;

procedure TfrmMain.teste1Click(Sender: TObject);
var
 i:dword;
begin
  if InternetGetConnectedState(@i,0) then
  begin
    showmessage('esta conectado');
  end
  else
  begin
    showmessage('nun ta não');
  end;
end;

procedure TfrmMain.tmrAtualizaGridTimer(Sender: TObject);
begin
  qryPedidoTelefone.Close;
  qryPedidoTelefone.Open;
end;

procedure TfrmMain.VNC1Click(Sender: TObject);
var
  ip: String;
begin
  ip := qryMaquinas.FieldByName('ip').AsString;
  ShellExecute(0, 'open', PChar('C:\Program Files\uvnc bvba\UltraVNC\vncviewer.exe'),PChar('VNC Server '+ ip),nil,  SW_SHOWNOACTIVATE);
//C:\Program Files\uvnc bvba\UltraVNC\vncviewer.exe
end;

procedure TfrmMain.btnEstoqueClick(Sender: TObject);
begin
  if (Panel2.Visible = True) then
  begin
    Panel2.Visible := False;
  end;

  if (pnlTelefone.Visible = True) then
  begin
    pnlTelefone.Visible := False;
  end;

  try
    frmEmprestimo:=TfrmEmprestimo.Create(nil);
    frmEmprestimo.ShowModal;
  finally
    frmEmprestimo.Free;
  end;

end;

procedure TfrmMain.btnGravarClick(Sender: TObject);
begin
  if (Trim(mmoRecusaLigacao.Text)='') then
  begin
    Application.MessageBox('Informe o motivo da recusa.','Aviso',MB_OK+MB_ICONWARNING);
  end
  else
  begin
    try
      spAlteraStatus.Close;
      spAlteraStatus.Parameters.ParamByName('IDPEDIDO').Value := qryPedidoTelefoneIdPedidoLigacao.Value;
      spAlteraStatus.Parameters.ParamByName('STATUS').Value := 'R';
      spAlteraStatus.Parameters.ParamByName('REJEICAO').Value := mmoRecusaLigacao.Text;
      spAlteraStatus.Parameters.ParamByName('DATAFECHAMENTO').Value := FormatDateTime('YYYY-MM-DD',Now);
      spAlteraStatus.Parameters.ParamByName('HORAFECHAMENTO').Value := FormatDateTime('hhmm',Now);
      spAlteraStatus.ExecProc;
      Application.MessageBox('Pedido Recusado com Sucesso','Confirmação',MB_OK+MB_ICONINFORMATION);
      qryPedidoTelefone.Close;
      qryPedidoTelefone.Open;
      mmoRecusaLigacao.Clear;
      pnlRecusaLigacao.Visible := False;
    except on e:EDatabaseError  do
      Application.MessageBox('Não foi possível Recusar a solicitação','Aviso',MB_OK+MB_ICONWARNING);
    end;
  end;
end;

procedure TfrmMain.btnUsuarioClick(Sender: TObject);
begin
  if (Panel2.Visible = True) then
  begin
    Panel2.Visible := False;
  end;

  if (pnlTelefone.Visible = True) then
  begin
    pnlTelefone.Visible := False;
  end;

  try
    frmCadastroUsuario := TfrmCadastroUsuario.Create(nil);
    frmCadastroUsuario.ShowModal;
  finally
    frmCadastroUsuario.Free;
  end;

end;

procedure TfrmMain.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  if (qryRecUrgente.FieldByName('Urgente').AsString = 'S') then
  begin
    Image2.Left := 1300;
    Image2.Visible := True;
  end
  else
  begin
    Image2.Visible := False;
  end;

end;

procedure TfrmMain.dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrd1 do
  begin
    if (gdSelected in state) then
    begin
      Canvas.Brush.Color := RGB(141,182,205);
    end
    //dbgrd1.Canvas.Font.Color := clBlack;

    else if (qryOrdemServico.FieldByName('OsFinalizada').AsString = 'Concluída') then
    begin
     dbgrd1.Canvas.Brush.Color := clWindow;
    end

    else if (qryOrdemServico.FieldByName('OsFinalizada').AsString = 'Pendente') then
    begin
      dbgrd1.Canvas.Brush.Color := clGradientActiveCaption;
      dbgrd1.Canvas.Font.Color := clHotLight;
    end;

    Canvas.FillRect(Rect);
    dbgrd1.DefaultDrawColumnCell( Rect, DataCol, Column, State);
  end;

end;

procedure TfrmMain.dbgrdPedidoTelefoneCellClick(Column: TColumn);
begin
  if not(qryPedidoTelefone.IsEmpty) then
  begin
    if Column.Index = 5 then
      if (qryPedidoTelefone.FieldByName('Status').AsString = 'ABERTO') then
        begin
          if (Application.MessageBox('Deseja Finalizar essa Ligação?', 'Confirmar',MB_YESNO+MB_ICONQUESTION)=ID_YES) then
          begin
          try
            spAlteraStatus.Close;
            spAlteraStatus.Parameters.ParamByName('IDPEDIDO').Value := qryPedidoTelefoneIdPedidoLigacao.Value;
            spAlteraStatus.Parameters.ParamByName('STATUS').Value := 'F';
            spAlteraStatus.Parameters.ParamByName('REJEICAO').Value := '';
            spAlteraStatus.Parameters.ParamByName('DATAFECHAMENTO').Value := FormatDateTime('YYYY-MM-DD',Now);
            spAlteraStatus.Parameters.ParamByName('HORAFECHAMENTO').Value := FormatDateTime('hhmm',Now);
            spAlteraStatus.ExecProc;
            Application.MessageBox('Pedido Finalizado com Sucesso','Confirmação',MB_OK+MB_ICONINFORMATION);
            qryPedidoTelefone.Close;
            qryPedidoTelefone.Open;
          except on e:EDatabaseError  do
            Application.MessageBox('Não foi possível Finalizar a solicitação','Aviso',MB_OK+MB_ICONWARNING);
          end;
          end;
        end;

    if Column.Index = 6 then
      if (qryPedidoTelefone.FieldByName('Status').AsString = 'ABERTO') then
        begin
          if (pnlRecusaLigacao.Visible = False) then
          begin
            //pnlRecusaLigacao.Left := (Self.Width - pnlRecusaLigacao.Width) div 2;
            //pnlRecusaLigacao.Top := (Self.Height - pnlRecusaLigacao.Height) div 2;
            pnlRecusaLigacao.Visible := True;
          end;
        end;
  end;
end;

procedure TfrmMain.dbgrdPedidoTelefoneDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
  var Bitmap:
  TBitmap;
begin
  {if (gdSelected in State) then
  begin
    dbgrdPedidoTelefone.Canvas.Brush.Color := RGB(141,182,205);
    dbgrdPedidoTelefone.Canvas.FillRect(Rect);
    dbgrdPedidoTelefone.DefaultDrawDataCell(Rect,Column.Field,State);
  end}
  if odd(dsPedidoTelefone.DataSet.RecNo) then
  begin
    dbgrdPedidoTelefone.Canvas.Brush.Color := clGradientInactiveCaption;
    dbgrdPedidoTelefone.Canvas.FillRect(Rect);
    dbgrdPedidoTelefone.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end
  else
  begin
    Canvas.Brush.Color := clWindow;
    dbgrdPedidoTelefone.Canvas.FillRect(Rect);
    dbgrdPedidoTelefone.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;

  if (qryPedidoTelefone.RecordCount > 0) then
  begin
    if Column.Index = 4 then
      if (qryPedidoTelefone.FieldByName('Status').AsString = 'FINALIZADO') then
      begin
        Bitmap := img3.Picture.Bitmap;
        with TDBGrid(Sender) do
        begin
          Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
        end;
      end;

    if (Column.Index = 5) then
      if (qryPedidoTelefone.FieldByName('Status').AsString = 'ABERTO') then
      begin
        Bitmap := img1.Picture.Bitmap;
        with TDBGrid(Sender) do
        begin
          Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
        end;
      end;

    if Column.Index = 6 then
      if (qryPedidoTelefone.FieldByName('Status').AsString = 'ABERTO') then
      begin
        Bitmap := img2.Picture.Bitmap;
        with TDBGrid(Sender) do
        begin
          Canvas.Draw((Rect.Right - Rect.Left - Bitmap.Width) div 2 + Rect.Left,
          (Rect.Bottom - Rect.Top - Bitmap.Height) div 2 + Rect.Top, Bitmap);
        end;
      end;

      if ((qryPedidoTelefone.FieldByName('Status').AsString = 'FINALIZADO')or (qryPedidoTelefone.FieldByName('Status').AsString = 'RECUSADO')) then
      begin
        dbgrdPedidoTelefone.Columns[5].Visible := False;
        dbgrdPedidoTelefone.Columns[6].Visible := False;
      end
      else if (qryPedidoTelefone.FieldByName('Status').AsString = 'ABERTO') then
      begin
        dbgrdPedidoTelefone.Columns[5].Visible := True;
        dbgrdPedidoTelefone.Columns[6].Visible := True;
      end;
  end;
end;

procedure TfrmMain.Detahes1Click(Sender: TObject);
begin
  if (pnlDetalhe.Visible = False) then
  begin
    pnlDetalhe.Visible := True;

    qryMaquinaDetalhe.Close;
    qryMaquinaDetalhe.Parameters.ParamByName('idusuario').Value := qryMaquinas.FieldByName('idUsuario').Value;
    qryMaquinaDetalhe.Open;
  end
  else
  begin
    pnlDetalhe.Visible := False;
  end;
end;

procedure TfrmMain.Detalhe1Click(Sender: TObject);
begin
  qryOSDetalhe.Close;
  qryOSDetalhe.Parameters.ParamByName('idOrdemServico').Value := qryOrdemServicoIdOrdemServico.Value;
  qryOSDetalhe.Open;

  if (qryOSDetalhe.RecordCount >0) then
  begin
    if (pnlOSDetalhe.Visible = False) then
    begin
      pnlOSDetalhe.Visible := True;
      pnlOSDetalhe.top := (self.Height div 2) - (pnlDetalhe.height div 2);
      pnlOSDetalhe.left := (self.Width div 2) - (pnlDetalhe.width div 2);
      if (qryOSDetalhe.FieldByName('OsFinalizada').AsString = 'S') then
      begin
        lblStatus.Font.Color := clGreen;
        lblStatus.Caption := 'Concluída'
      end
      else
      begin
        lblStatus.Font.Color := clRed;
        lblStatus.Caption := 'Pendente'
      end;
    end
    else
    begin
      pnlOSDetalhe.Visible := False;
    end;
  end
  else
  begin
    ShowMessage('Não contem Ordem de Serviço em aberto.');
    Abort;
  end;
end;

procedure TfrmMain.edtBuscaTelChange(Sender: TObject);
begin
  qryPedidoTelefone.Locate('LocalouNome',edtBuscaTel.Text,[loCaseInsensitive,loPartialKey]);
  if (Trim(edtBuscaTel.Text)='') then
  begin
    qryPedidoTelefone.First;
  end;
end;

procedure TfrmMain.Etiqueta1Click(Sender: TObject);
begin
  qryMaquinaDetalhe.Close;
  qryMaquinaDetalhe.Parameters.ParamByName('idusuario').Value := qryMaquinas.FieldByName('idUsuario').Value;
  qryMaquinaDetalhe.Open;

  ppREtiqueta.Print;
end;

procedure TfrmMain.btnDadosClick(Sender: TObject);
begin
   if (panel2.Visible = False) then
   begin
     Panel2.Visible := True;
   end
   else
   begin
     Panel2.Visible := False;
   end;

   if (pnlTelefone.Visible = True) then
   begin
     pnlTelefone.Visible := False;
   end;
end;

procedure TfrmMain.btnMaquinaClick(Sender: TObject);
begin
  if (Panel2.Visible = True) then
  begin
    Panel2.Visible := False;
  end;

  if (pnlTelefone.Visible = True) then
  begin
    pnlTelefone.Visible := False;
  end;

  try
    frmCadastroMaquina:= TfrmCadastroMaquina.Create(nil);
    frmCadastroMaquina.ShowModal;
  finally
    frmCadastroMaquina.Free;
  end;
end;

procedure TfrmMain.btn1Click(Sender: TObject);
begin
  if(Trim(mmo1.Text) = '')then
  begin
    Application.MessageBox('Favor preencha o resultado para finalização.','Alerta',MB_OK+MB_IconQuestion);
    Abort;
  end;


  if Application.MessageBox('Deseja Finalizar Ordem de Serviço?','Confirmar',mb_YesNo+MB_IconQuestion)= IDYES then
  begin
    cmdFechaOS.Parameters.ParamByName('datafim').Value := FormatDateTime('YYYY-MM-DD', now);
    cmdFechaOS.Parameters.ParamByName('horafim').Value := TimeToStr(Time);
    cmdFechaOS.Parameters.ParamByName('resultado').Value := mmo1.Text;
    cmdFechaOS.Parameters.ParamByName('idordem').Value := qryOrdemServicoIdOrdemServico.Value;
    cmdFechaOS.Execute;

    pnlFecha.Visible := False;
    qryOrdemServico.Close;
    qryOrdemServico.Open;
  end;
end;

procedure TfrmMain.btn2Click(Sender: TObject);
begin
  if(Trim(mmo1.Text) = '')then
  begin
    Application.MessageBox('Favor preencha o resultado para finalização.','Alerta',MB_OK+MB_IconQuestion);
    Abort;
  end;


  if Application.MessageBox('Deseja Finalizar Ordem de Serviço?','Confirmar',mb_YesNo+MB_IconQuestion)= IDYES then
  begin
    cmdFechaOS.Parameters.ParamByName('datafim').Value := FormatDateTime('YYYY-MM-DD', now);
    cmdFechaOS.Parameters.ParamByName('horafim').Value := TimeToStr(Time);
    cmdFechaOS.Parameters.ParamByName('resultado').Value := mmo1.Text;
    cmdFechaOS.Parameters.ParamByName('idordem').Value := qryOrdemServicoIdOrdemServico.Value;
    cmdFechaOS.Execute;

    pnlFecha.Visible := False;
    qryOrdemServico.Close;
    qryOrdemServico.Open;
  end;
end;

procedure TfrmMain.btnAgendaClick(Sender: TObject);
begin
  if (Panel2.Visible = True) then
  begin
    Panel2.Visible := False;
  end;

  if (pnlTelefone.Visible = False) then
  begin
    pnlTelefone.Visible := True;
  end
  else
  begin
    pnlTelefone.Visible := False;
  end;


end;

procedure TfrmMain.btnChamadoClick(Sender: TObject);
begin
  if (Panel2.Visible = True) then
  begin
    Panel2.Visible := False;
  end;

  if (pnlTelefone.Visible = True) then
  begin
    pnlTelefone.Visible := False;
  end;

  try
    frmChamado := TfrmChamado.Create(nil);
    frmChamado.ShowModal
  finally
    frmChamado.Free;
  end;
end;

procedure TfrmMain.btnSairClick(Sender: TObject);
begin
  if application.MessageBox ('Deseja Realmente Sair do Sistema?','Confirma',mb_YesNo+MB_iconQuestion) = IdYes then
  begin
    Application.Terminate;
  end;
end;

end.
