unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Data.DB, Data.Win.ADODB;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    ConectaBanco: TADOConnection;
    qryLogin: TADOQuery;
    qryLoginlogin: TStringField;
    qryLoginsenha: TStringField;
    qryLoginnome: TStringField;
    qryLoginidUsuario: TAutoIncField;
    qryLoginCodTipoUsuario: TIntegerField;
    lbl1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaChange(Sender: TObject);
    procedure edtSenhaExit(Sender: TObject);
  private
    { Private declarations }
  public
    logado : string;
    idLogado, idTipo : Integer;
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;


implementation

{$R *.dfm}

uses uMain;

procedure TfrmLogin.edtSenhaChange(Sender: TObject);
begin
  If getkeystate(vk_CAPITAL) = 0 then // Caps lock está OFF
  begin
    lbl1.Caption := '';
  end
  else If getkeystate(vk_CAPITAL) = 1 then // Caps lock está ON
  begin
    lbl1.Caption := 'Verifique o CAPS LOCK esta ativo!'
  end;
end;

procedure TfrmLogin.edtSenhaExit(Sender: TObject);
begin
  if (Trim(edtSenha.Text)='') then
  begin
    lbl1.Caption := '';
  end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Deseja Realmente Sair do Sistema?','Confirmar',mb_YesNo+MB_IconQuestion)<> IDYES then
  begin
    Action:=caNone
  end
  else
  begin
    Action:=caFree;
  end;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if(Key=#13)then
  begin
    if ((Trim(edtLogin.Text) = '')and (Trim(edtSenha.Text) = '')) then
    begin
      Application.MessageBox('Campo Vazio, Favor Digite seu Login.','Alerta',MB_OK+MB_IconQuestion);
    end

    else if (Trim(edtLogin.Text) = '') then
    begin
      Application.MessageBox('Favor Digite seu Login.','Alerta',MB_OK+MB_IconQuestion);
      if (edtLogin.CanFocus) then
      begin
        edtLogin.CanFocus;
      end;
    end

    else if (Trim(edtSenha.Text) = '') then
    begin
      Application.MessageBox('Favor Digite sua Senha','Alerta',MB_OK+MB_IconQuestion);
      if (edtSenha.CanFocus) then
      begin
        edtSenha.CanFocus;
      end;
    end
    else
    begin
      qryLogin.Close;
      qryLogin.Parameters.ParamByName('login').Value:= edtLogin.Text;
      qryLogin.Open;

      logado := qryLogin.FieldByName('Nome').AsString;
      idLogado := qryLogin.FieldByName('IdUsuario').Value;
      idTipo := qryLogin.FieldByName('CodTipoUsuario').Value;

      if ((qryLogin.FieldByName('login').Value = edtLogin.Text)and
          (qryLogin.FieldByName('senha').Value = edtSenha.Text)) then
      begin
        try
          frmMain:= TfrmMain.Create(nil);
          //nivel de particularidade
          if ((qryLogin.FieldByName('CodTipoUsuario').Value = 1) and
              (qryLogin.FieldByName('CodTipoUsuario').Value = 3))then   //1 Adm - 3 Tec
          begin
            frmMain.btnUsuario.Visible := True;
            frmMain.btnMaquina.Visible := True;
            frmMain.btnEstoque.Visible := True;
            frmMain.btnOrdem.Visible := True;
            frmMain.btnDados.Visible := True;
            frmMain.btnChamado.Top := 429;
            frmMain.btnAgenda.Top := 344;
            frmMain.btnSair.Top := 590;

            frmMain.TsMaquinas.PageIndex := 0;
            frmMain.TsEmprestimo.PageIndex := 3;
            frmMain.tsOrdem.PageIndex := 2;
            frmMain.tsTelefone.PageIndex := 4;
            frmMain.tsRecados.PageIndex := 1;

            frmMain.TsMaquinas.TabVisible := True;
            frmMain.PgControle.ActivePage := frmMain.TsMaquinas;


            if (qryLogin.FieldByName('CodTipoUsuario').Value = 1) then
            begin
              frmMain.Panel2.Height := 141;
            end
            else if (qryLogin.FieldByName('CodTipoUsuario').Value = 2) then
            begin
              frmMain.Panel2.Height := 100;
            end;
          end
          else if ((qryLogin.FieldByName('CodTipoUsuario').Value = 4)and
                   (qryLogin.FieldByName('CodTipoUsuario').Value = 2))then //4 padrão - 2 Telefonista
          begin
            frmMain.btnUsuario.Visible := False;
            frmMain.btnMaquina.Visible := False;
            frmMain.btnEstoque.Visible := False;
            frmMain.btnOrdem.Visible := False;
            frmMain.btnDados.Visible := False;
            frmMain.btnChamado.Top := 108;
            frmMain.btnAgenda.Top := 20;
            frmMain.btnSair.Top := 202;

            frmMain.tsRecados.PageIndex := 1;
            frmMain.tsTelefone.PageIndex := 0;
            frmMain.tsOrdem.PageIndex := 2;

            frmMain.TsMaquinas.TabVisible := False;
            frmMain.TsEmprestimo.TabVisible := False;
            frmMain.PgControle.ActivePage := frmMain.tsRecados;
          end;
          frmMain.showmodal;
        finally
          frmMain.Free;
          //Application.Terminate;
        end
      end

      else if (qryLogin.FieldByName('login').Value <> edtLogin.Text) then
      begin
        Application.MessageBox('Usuario Invalido','Alerta',MB_OK+MB_IconQuestion);
        edtLogin.Clear;
        if (edtLogin.CanFocus) then
        begin
          edtLogin.SetFocus;
        end;
      end

      else if (qryLogin.FieldByName('senha').Value <> edtSenha.Text) then
      begin
        Application.MessageBox('Senha invalida.','Alerta',MB_OK+MB_IconQuestion);
        edtSenha.Clear;
        if (edtSenha.CanFocus) then
        begin
          edtSenha.SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  ConectaBanco.Close;
  ConectaBanco.Open;

  Panel1.Left := (Self.Width - Panel1.Width) div 2;
  Panel1.Top := (Self.Height - Panel1.Height) div 2;
end;

procedure TfrmLogin.SpeedButton1Click(Sender: TObject);
begin
 if ((Trim(edtLogin.Text) = '')and (Trim(edtSenha.Text) = '')) then
  begin
    Application.MessageBox('Campo Vazio, Favor Digite seu Login.','Alerta',MB_OK+MB_IconQuestion);
  end

  else if (Trim(edtLogin.Text) = '') then
  begin
    Application.MessageBox('Favor Digite seu Login.','Alerta',MB_OK+MB_IconQuestion);
    if (edtLogin.CanFocus) then
    begin
      edtLogin.CanFocus;
    end;
  end

  else if (Trim(edtSenha.Text) = '') then
  begin
    Application.MessageBox('Favor Digite sua Senha.','Alerta',MB_OK+MB_IconQuestion);
    if (edtSenha.CanFocus) then
    begin
      edtSenha.CanFocus;
    end;
  end

  else
  begin
    qryLogin.Close;
    qryLogin.Parameters.ParamByName('login').Value:= edtLogin.Text;
    qryLogin.Open;

    logado := qryLogin.FieldByName('Nome').AsString;
    idLogado := qryLogin.FieldByName('IdUsuario').Value;

    if ((qryLogin.FieldByName('login').Value = edtLogin.Text) and
        (qryLogin.FieldByName('senha').Value = edtSenha.Text))then
    begin
      try
        frmMain:= TfrmMain.Create(nil);

        //nivel de particularidade
        if ((qryLogin.FieldByName('CodTipoUsuario').Value = 1) and
            (qryLogin.FieldByName('CodTipoUsuario').Value = 2))then
        begin
          frmMain.btnUsuario.Visible := True;
          frmMain.btnMaquina.Visible := True;
          frmMain.btnEstoque.Visible := True;
          frmMain.btnOrdem.Visible := True;
          frmMain.btnDados.Visible := True;
          frmMain.btnChamado.Top := 429;
          frmMain.btnAgenda.Top := 344;
          frmMain.btnSair.Top := 590;
          frmMain.TsMaquinas.TabVisible := True;
          frmMain.PgControle.ActivePage := frmMain.TsMaquinas;

          if (qryLogin.FieldByName('CodTipoUsuario').Value = 1) then
          begin
            frmMain.Panel2.Height := 141;
          end
          else if (qryLogin.FieldByName('CodTipoUsuario').Value = 2) then
          begin
            frmMain.Panel2.Height := 100;
          end;
        end
        else if (qryLogin.FieldByName('CodTipoUsuario').Value = 4)then
        begin
          frmMain.btnUsuario.Visible := False;
          frmMain.btnMaquina.Visible := False;
          frmMain.btnEstoque.Visible := False;
          frmMain.btnOrdem.Visible := False;
          frmMain.btnDados.Visible := False;
          frmMain.btnChamado.Top := 108;
          frmMain.btnAgenda.Top := 20;
          frmMain.btnSair.Top := 202;
          frmMain.TsMaquinas.TabVisible := False;
          frmMain.PgControle.ActivePage := frmMain.TsEmprestimo;
        end;

        frmMain.showmodal;
      finally
        frmMain.Free;
        //Application.Terminate;
      end
    end

    else if (qryLogin.FieldByName('login').Value <> edtLogin.Text) then
    begin
      Application.MessageBox('Usuario Invalido','Alerta',MB_OK+MB_IconQuestion);
      edtLogin.Clear;
      if (edtLogin.CanFocus) then
      begin
        edtLogin.SetFocus;
      end;
    end

    else if (qryLogin.FieldByName('senha').Value <> edtSenha.Text) then
    begin
      Application.MessageBox('Senha invalida.','Alerta',MB_OK+MB_IconQuestion);
      edtSenha.Clear;
      if (edtSenha.CanFocus) then
      begin
        edtSenha.SetFocus;
      end;
    end;
  end;

end;

end.
