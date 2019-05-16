unit uOrdemServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.DB, Data.Win.ADODB, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmOrdemServico = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton5: TSpeedButton;
    qryOS: TADOQuery;
    qryOSIdOrdemServico: TAutoIncField;
    qryOSCodUsuario: TIntegerField;
    qryOSCodTecnico: TIntegerField;
    lbldata: TLabel;
    lblhora: TLabel;
    btnPesquisa: TSpeedButton;
    edtCodFunc: TEdit;
    qryDepartamento: TADOQuery;
    dsDepartamento: TDataSource;
    qryDepartamentoDescricao: TStringField;
    dbedtNome: TDBEdit;
    qryFunc: TADOQuery;
    dsFunc: TDataSource;
    qryFuncNome: TStringField;
    Label10: TLabel;
    qryOSOsFinalizada: TStringField;
    dbmmoMotivo: TDBMemo;
    dbmmoResultado: TDBMemo;
    dsOS: TDataSource;
    tmr1: TTimer;
    lblDataFinal: TLabel;
    lblHoraFinal: TLabel;
    chkFinaliza: TCheckBox;
    img3: TImage;
    img2: TImage;
    img1: TImage;
    img4: TImage;
    qryFuncIdUsuario: TAutoIncField;
    qryFuncCodDepartamento: TIntegerField;
    qryFuncCodTipoUsuario: TIntegerField;
    dbtxtSetor: TDBText;
    qryDepartamentoIdDepartamento: TAutoIncField;
    qryDepartamentoRamal: TStringField;
    qryOSMotivo: TMemoField;
    qryOSResultado: TMemoField;
    qryOSDataIni: TWideStringField;
    qryOSDataFim: TWideStringField;
    strngfldOSHoraIni: TStringField;
    strngfldOSHoraFim: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure edtCodFuncChange(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure chkFinalizaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure edtCodFuncExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrdemServico: TfrmOrdemServico;

implementation

{$R *.dfm}

uses uPesquisa, uLogin, uMain;

procedure TfrmOrdemServico.btn1Click(Sender: TObject);
var
 data, hora, databd : string;
begin

  ShowMessage(databd + ' ' + hora);
end;

procedure TfrmOrdemServico.btnPesquisaClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPesquisa, frmPesquisa);
  try
    frmPesquisa.pesquisa := 'F';
    frmPesquisa.ShowModal;
  finally
    if (frmPesquisa.ModalResult = mrOk) then
    begin
      edtCodFunc.Text := IntToStr(frmPesquisa.funcionario);

      qryFunc.Close;
      qryFunc.Parameters.ParamByName('idUsuario').Value := StrToInt(edtCodFunc.Text);
      qryFunc.Open;

      qryDepartamento.Close;
      qryDepartamento.Parameters.ParamByName('idDepartamento').Value := qryFuncCodDepartamento.Value;
      qryDepartamento.Open;
    end;
    frmPesquisa.Release;
    frmPesquisa := nil;
  end;
end;

procedure TfrmOrdemServico.chkFinalizaClick(Sender: TObject);
begin
  if ((Trim(dbmmoMotivo.Text) = '') or (Trim(edtCodFunc.Text) = '')) then
  begin
    ShowMessage('Favor adicionar um motivo de abertura');
    chkFinaliza.Checked := False;
    Abort;
  end;

  if (chkFinaliza.Checked) then
  begin
    dbmmoResultado.Enabled := True;
    lblDataFinal.Caption := DateToStr(now);
    lblHoraFinal.Caption := TimeToStr(now);
  end
  else
  begin
    dbmmoResultado.Enabled := False;
    lblDataFinal.Caption := '';
    lblHoraFinal.Caption := '';
  end;
end;

procedure TfrmOrdemServico.edtCodFuncChange(Sender: TObject);
begin
  if (Trim(edtCodFunc.Text) <> '') then
  begin
    qryFunc.Close;
    qryFunc.Parameters.ParamByName('idUsuario').Value := StrToInt(edtCodFunc.Text);
    qryFunc.Open;


    qryDepartamento.Close;
    qryDepartamento.Parameters.ParamByName('idDepartamento').Value := qryFuncCodDepartamento.Value;
    qryDepartamento.Open;
  end;

  if (edtCodFunc.Text = '') then
  begin
    dbedtNome.Text := '';
    dbtxtSetor.Caption := '';
  end;

end;

procedure TfrmOrdemServico.edtCodFuncExit(Sender: TObject);
begin
  if (StrToInt(edtCodFunc.Text) = frmLogin.qryLoginidUsuario.Value) then
  begin
     Application.MessageBox('Altere o funcionário destino da Ordem de Serviço.','Alerta',MB_OK+MB_IconQuestion);
     Abort;
  end;

end;

procedure TfrmOrdemServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryOS.Close;
  frmMain.qryOrdemServico.Close;
  frmMain.qryOrdemServico.Open;
end;

procedure TfrmOrdemServico.FormShow(Sender: TObject);
begin
  lbldata.Caption := DateToStr(Now);
  lblhora.caption := timetostr(time);
  Label10.Caption := frmlogin.logado;
  qryOS.Close;
  qryOS.Open;
  qryOS.Insert;
end;

procedure TfrmOrdemServico.SpeedButton1Click(Sender: TObject);
var
  horafinal, datafinal, dataini, horaini, databdini, databdfinal : string;
begin
  if ((Trim(edtCodFunc.Text) = '') or
      (Trim(dbmmoMotivo.Text) = '')) then
  begin
     Application.MessageBox('Favor preencha os campos, para realizar a abertura da ordem de serviço.','Alerta',MB_OK+MB_IconQuestion);
     Abort;
  end;

  if (chkFinaliza.Checked) then
  begin
    if(Trim(dbmmoResultado.Text) = '')then
    begin
     Application.MessageBox('Favor preencha o resultado para finalização ou desmarque a opção de finalizar.','Alerta',MB_OK+MB_IconQuestion);
     Abort;
    end;
  end;

  if Application.MessageBox('Deseja Salvar o cadastro?','Confirmar',mb_YesNo+MB_IconQuestion)= IDYES then
  begin
    qryOS.Edit;
    qryOS.FieldByName('CodUsuario').Value := StrToInt(edtCodFunc.Text);

    if (chkFinaliza.Checked =  True) then
    begin
      qryOS.FieldByName('OsFinalizada').Value := 'S'
    end
    else
    begin
      qryOS.FieldByName('OsFinalizada').Value := 'N'
    end;
    qryOS.FieldByName('CodTecnico').Value := frmLogin.qryLogin.FieldByName('idUsuario').Value;

    qryOS.FieldByName('DataIni').Value := FormatDateTime('YYYY-MM-DD', Date);
    qryOS.FieldByName('HoraIni').Value := TimeToStr(Time);

    if ((lblDataFinal.Caption <> '') or (lblHoraFinal.Caption <> '')) then
    begin
      qryOS.FieldByName('DataFim').Value := FormatDateTime('YYYY-MM-DD', Date);
      qryOS.FieldByName('HoraFim').Value := TimeToStr(Time);
    end
    else
    begin
      qryOS.FieldByName('DataFim').Value := Null;
      qryOS.FieldByName('HoraFim').Value := Null;
    end;
    qryOS.Post;
    Application.MessageBox('Usuario registrado com sucesso!', 'Confirmação', MB_OK+MB_IconQuestion);
  end;
end;

procedure TfrmOrdemServico.tmr1Timer(Sender: TObject);
begin
  lblhora.caption := timetostr(time);
end;

end.
