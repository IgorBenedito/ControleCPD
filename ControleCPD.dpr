program ControleCPD;

uses
  Vcl.Forms,
  uLogin in 'uLogin.pas' {frmLogin},
  uMain in 'uMain.pas' {frmMain},
  uCadastroUsuario in 'uCadastroUsuario.pas' {frmCadastroUsuario},
  uCadastroMaquina in 'uCadastroMaquina.pas' {frmCadastroMaquina},
  uEmprestimoMaterial in 'uEmprestimoMaterial.pas' {frmEmprestimo},
  uOrdemServico in 'uOrdemServico.pas' {frmOrdemServico},
  uCadastroDepartamento in 'uCadastroDepartamento.pas' {frmCadastroDepartamento},
  uCadastroTipoUsuario in 'uCadastroTipoUsuario.pas' {frmTipoUsuario},
  uGeradorRelatorio in 'uGeradorRelatorio.pas' {frmRelatorio},
  uPesquisa in 'uPesquisa.pas' {frmPesquisa},
  uNivelParticularidade in 'uNivelParticularidade.pas' {frmNivelParticularidade},
  uPedidoTelefonema in 'uPedidoTelefonema.pas' {frmTelefone},
  uCadTelefone in 'uCadTelefone.pas' {frmCadTelefone},
  uNoticia in 'uNoticia.pas' {frmNoticia},
  uBuscaTelefone in 'uBuscaTelefone.pas' {frmBuscaTelefone},
  uChamado in 'uChamado.pas' {frmChamado};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmNoticia, frmNoticia);
  Application.CreateForm(TfrmBuscaTelefone, frmBuscaTelefone);
  Application.CreateForm(TfrmChamado, frmChamado);
  Application.Run;
end.
