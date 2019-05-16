object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  Align = alCustom
  BorderStyle = bsSingle
  Caption = '.: Controle CPD :. Pesquisa'
  ClientHeight = 404
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object edtBusca: TEdit
    Left = 76
    Top = 6
    Width = 315
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = edtBuscaChange
  end
  object dbgrdPesquisa: TDBGrid
    Left = 4
    Top = 42
    Width = 436
    Height = 356
    DataSource = dsPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrdPesquisaCellClick
    OnDrawColumnCell = dbgrdPesquisaDrawColumnCell
  end
  object qryPesquisa: TADOQuery
    Connection = frmLogin.ConectaBanco
    CursorType = ctStatic
    Parameters = <
      item
        Size = -1
        Value = Null
      end>
    Left = 24
  end
  object dsPesquisa: TDataSource
    DataSet = qryPesquisa
    Left = 64
  end
end
