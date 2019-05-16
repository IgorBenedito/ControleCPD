unit uPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Data.Win.ADODB;

type
  TfrmPesquisa = class(TForm)
    edtBusca: TEdit;
    qryPesquisa: TADOQuery;
    dsPesquisa: TDataSource;
    dbgrdPesquisa: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure dbgrdPesquisaCellClick(Column: TColumn);
    procedure edtBuscaChange(Sender: TObject);
    procedure dbgrdPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
  pesquisa : string;
  departamento, tipousuario,funcionario, pedido: Integer;
    { Public declarations }
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

procedure TfrmPesquisa.dbgrdPesquisaCellClick(Column: TColumn);
begin
  if (pesquisa = 'S') then
  begin
    departamento := qryPesquisa.FieldByName('idDepartamento').Value;
  end
  else if (pesquisa = 'U') then
  begin
    tipousuario := qryPesquisa.FieldByName('idTipoUsuario').Value;
  end
  else if (pesquisa = 'F') then
  begin
    funcionario := qryPesquisa.FieldByName('idUsuario').Value;
  end
  else if (pesquisa = 'P') then
  begin
    pedido := qryPesquisa.FieldByName('IdContato').Value;
  end;

  ModalResult := mrOk;
end;

procedure TfrmPesquisa.dbgrdPesquisaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with dbgrdPesquisa do
  begin
    if Odd(dsPesquisa.DataSet.RecNo) then
       Canvas.Brush.Color := clWindow
    else
       Canvas.Brush.Color := clGradientInactiveCaption;

    Canvas.FillRect(Rect);
    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TfrmPesquisa.edtBuscaChange(Sender: TObject);
begin
  if pesquisa = 'S' then
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT *'+
                        'FROM DEPARTAMENTO');
    qryPesquisa.SQL.Add(' WHERE DESCRICAO LIKE :Descricao');
    qryPesquisa.Parameters.ParamByName('Descricao').Value:= '%'+ edtBusca.Text +'%';
    qryPesquisa.Open;
  end
  else if pesquisa = 'U' then
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT *'+
                        'FROM TIPOUSUARIO');
    qryPesquisa.SQL.Add('WHERE TIPO LIKE :Tipo');
    qryPesquisa.Parameters.ParamByName('Tipo').Value:= '%'+ edtBusca.Text +'%';
    qryPesquisa.Open;
  end
  else if pesquisa = 'F' then
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT *'+
                        'FROM USUARIO');
    qryPesquisa.SQL.Add('WHERE NOME LIKE :Tipo');
    qryPesquisa.Parameters.ParamByName('Nome').Value:= '%'+ edtBusca.Text +'%';
    qryPesquisa.Open;
  end
  else if pesquisa = 'P' then
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT Contato.IdContato,                '+
                        '       Contato.Nome,'+
                        '       ''(''+ TELEFONE.DDD + '') '' TELEFONE.Telefone'+
                        'FROM CONTATO             '+
                        '     INNER JOIN TELEFONE'+
                        '     ON CONTATO.IdContato = TELEFONE.CodContato'+
                        'WHERE CONTATO.Nome LIKE :Nome');
    qryPesquisa.Parameters.ParamByName('Nome').Value:= '%'+ edtBusca.Text +'%';
    qryPesquisa.Open;
  end;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
begin
  if pesquisa = 'S' then
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT *'+
                        'FROM DEPARTAMENTO');
    qryPesquisa.Open;

    //Some com as colunas
    dbgrdPesquisa.Columns[2].Visible := False;

    //Tamanho das colunas
    dbgrdPesquisa.Columns[0].Width := 40;
    dbgrdPesquisa.Columns[1].Width := 360;

    //Titulos da colunas
    dbgrdPesquisa.Columns[0].Title.Caption := 'Código';
    dbgrdPesquisa.Columns[1].Title.Caption := 'Departamento';

  end

  else if pesquisa = 'U' then
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT *'+
                        'FROM TIPOUSUARIO');
    qryPesquisa.Open;

    //Some com as colunas

    //Tamanho das colunas
    dbgrdPesquisa.Columns[0].Width := 40;
    dbgrdPesquisa.Columns[1].Width := 360;

    //Titulos da colunas
    dbgrdPesquisa.Columns[0].Title.Caption := 'Código';
    dbgrdPesquisa.Columns[1].Title.Caption := 'Tipo de Usuario';
  end

  else if pesquisa = 'F' then
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT *'+
                        'FROM USUARIO');
    qryPesquisa.Open;

    //Some com as colunas
    dbgrdPesquisa.Columns[1].Visible := False;
    dbgrdPesquisa.Columns[2].Visible := False;
    dbgrdPesquisa.Columns[4].Visible := False;
    dbgrdPesquisa.Columns[5].Visible := False;

    //Tamanho das colunas
    dbgrdPesquisa.Columns[0].Width := 40;
    dbgrdPesquisa.Columns[3].Width := 360;

    //Titulos da colunas
    dbgrdPesquisa.Columns[0].Title.Caption := 'Código';
    dbgrdPesquisa.Columns[3].Title.Caption := 'Nome';
  end

  else if pesquisa = 'P' then
  begin
    qryPesquisa.Close;
    qryPesquisa.SQL.Clear;
    qryPesquisa.SQL.Add('SELECT Contato.IdContato,                '+
                        '       Contato.Nome,'+
                        '       ''(''+ TELEFONE.DDD + '') '' TELEFONE.Telefone'+
                        'FROM CONTATO             '+
                        '     INNER JOIN TELEFONE'+
                        '     ON CONTATO.IdContato = TELEFONE.CodContato');
    qryPesquisa.Open;

    //Some com as colunas

    //Tamanho das colunas
    dbgrdPesquisa.Columns[0].Width := 40;
    dbgrdPesquisa.Columns[1].Width := 180;
    dbgrdPesquisa.Columns[2].Width := 180;

    //Titulos da colunas
    dbgrdPesquisa.Columns[0].Title.Caption := 'Código';
    dbgrdPesquisa.Columns[1].Title.Caption := 'Contato';
    dbgrdPesquisa.Columns[2].Title.Caption := 'Telefone';
  end
end;

end.
