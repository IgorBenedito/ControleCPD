object frmBuscaTelefone: TfrmBuscaTelefone
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '.: Contorle CPD :. Busca Telefone'
  ClientHeight = 221
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnEnviar: TSpeedButton
    Left = 345
    Top = 185
    Width = 80
    Height = 31
    Caption = 'Concluir'
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFDF8E9FCF1D3FCEDC7F2E6
      BEF3E9C9F8F3E3FDFBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFAF0FBEBBEFCE194FFDD80
      FFDD80FDDC7EEAD177E8D077E8D077E9D487EFE3B4F8F6E8FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEFCDFDDF8AFF
      DD7FFFDD80FFDD80FFDD80FDDC7FEAD178E8D078E8D078E9D078E9D076E8D27D
      F1E5BCFFFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFBE9
      B4FFDD80FFDD80FFDD80FFDD80FFDD80FFDD80FDDC7FEAD178E8D078E8D078E8
      D078E8D078E8D078E8D077ECDBA1FDFCF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFBE8B6FFDD7FFFDD80FFDD80FFDD80FFDD80FFDD80FFDD80FDDC7FEAD1
      78E8CF76E7CE72E7CD71E7CE72E8D077E8D078E9D076ECDCA2FEFEFDFFFFFFFF
      FFFFFFFFFFFFFFFFFBF0CEFFDD7FFFDD80FFDD80FFDD80FFDD80FFDD80FFDD80
      FFDD81FDDB7DE9CE71E8D17EEDDC9CF0E1ACEDDD9EE8CF78E8CF75E8D078E8CF
      76F0E7BEFFFFFFFFFFFFFFFFFFFDFAF0FDDF87FFDD80FFDD80FFDD80FFDD80FF
      DD80FFDD80FFDD80FFDB7AFBDE87F3E6BAFAF8ECFEFFFFFFFFFFFFFFFFF6F0D6
      E9D381E8CF76E8D078E7D079F8F5E6FFFFFFFFFFFFFAEBC0FFDD7FFFDD80FFDD
      80FFDD80FFDD80FFDD80FFDD80FDDB79FCE5A0FCF9ECFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFF1E5B7E7CC70E8D078E9D076ECE0ADFFFFFFFEFDFAFDE092
      FFDD7FFFDD80FFDD80FFDD80FFDD80FFDD7FFEDB7AFCE9AFFDFEFBFEFFFFFFFF
      FFFFFFFFFEFFFFFEFFFFFFFFFFF9F8EBEAD68CE8CE74E8D078E7D077E8D07FFC
      FBF6FDF7E7FFDD7FFFDD80FFDD80FFDD80FFDD80FFDD80FEDA79FCE9B1FDFFFF
      FFFFFFFFFFFFFBFAF2F1E6BAFAF8EDFFFFFFFAF8EEEAD68BE7CD72E8D078E8D0
      78E8D078E7CE74F6F2DDFDF0D0FFDD7FFFDD80FFDD80FFDD80FFDD80FEDA79FC
      E6A7FCFEFCFEFFFFFEFFFFFBF5DDEAD587E6CB6BEAD78EF2E8BDEAD68CE7CD72
      E8D078E8D078E8D078E8D078E7CF73F3EAC9FCECBFFFDD7FFFDD80FFDD80FFDD
      80FFDC7CFCE190FDFCF5FEFFFFFEFFFFFDF6DEFBDC82EACF72E7D078E7CE73E7
      CD70E7CF74E8D078E8D078E8D078E8D078E8D078E8CF73F2E7BEFBECBDFFDD7F
      FFDD80FFDD80FFDD80FEDB7BFCF2D3FFFFFFFFFFFFFCFBF1FDE08DFEDA7AEAD1
      78E8D078E8D078E8D078E8D078E8D078E8D078E8D078E8D078E8D078E8CF73F2
      E7BEFCEFCDFFDD7FFFDD80FFDD80FFDC7CFCE196FDFEFCFFFFFFFFFFFFFBECBD
      FFDA75FDDC80EAD178E8D078E8D078E8D078E8D078E8D078E8D078E8D078E8D0
      78E8D078E8CF73F3EAC7FDF6E3FFDD80FFDD80FFDD80FEDB79FCE9B2FEFFFFFF
      FFFFFFFFFFFDF9EBFDE293FEDB7CEAD178E8D078E8D078E8D078E8D078E8D078
      E8D078E8D078E8D078E8D078E7CE73F6F1DCFEFCF8FDDF8DFFDD7FFFDD80FEDA
      78FCEBB8FFFFFFFFFFFFFFFFFFFEFFFFFCEFC3FCDA78EAD178E8D078E8D078E8
      D078E8D078E8D078E8D078E8D078E8D078E8D077E7D07AFCFAF3FFFFFFFAE9B6
      FFDD80FFDD80FFDB79FCE7A6FDFFFFFEFFFFFEFFFFFDFAF0FDE193FDDB7CEAD1
      78E8D078E8D078E8D078E8D078E8D078E8D078E8D078E8D078E9D077ECDCA2FF
      FFFFFFFFFFFCF8EAFEDE84FFDD7FFEDC7EFDDD81FCF5DDFEFFFFFCFAECFDE092
      FFDB7AFDDC7FEAD178E8D078E8D078E8D078E8D078E8D078E8D078E8D078E8D0
      78E8CF77F6F2DEFFFFFFFFFFFFFFFFFFFAEDC3FFDD7FFFDD7FFFDC7DFCDF8BFB
      ECBBFCE193FFDB79FFDD80FDDC7FEAD178E8D078E8D078E8D078E8D078E8D078
      E8D078E8D078E8CF76EDE0B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFAE5A9FFDD
      7EFFDD80FFDC7EFFDB79FFDC7DFFDD80FFDD80FDDC7FEAD178E8D078E8D078E8
      D078E8D078E8D078E8D078E9D076EAD898FEFDFAFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFEFCF8FBE6A9FFDD7FFFDD80FFDD80FFDD80FFDD80FFDD80FDDC7FEAD1
      78E8D078E8D078E8D078E8D078E8D078E8D076EBD998FBF9F1FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBEBBEFEDE83FFDD80FFDD80FFDD80
      FFDD80FDDC7FEAD178E8D078E8D078E8D078E9D077E8D077EEE0AEFDFCF8FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF7E6FC
      E8B1FEDF89FFDD7FFFDD80FEDC7EEAD177E8D077E8D076E8D27DEEDDA4F7F0DC
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFBF2FDF4DBFCECC2FAE9B8EFE1AFF0E3B8F5EDD2FB
      F8EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    OnClick = btnEnviarClick
  end
  object dbgrdBuscaTelefone: TDBGrid
    Left = 7
    Top = 63
    Width = 419
    Height = 120
    DataSource = dsBuscaTelefone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgRowSelect, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbgrdBuscaTelefoneDrawColumnCell
    OnDblClick = dbgrdBuscaTelefoneDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Tipo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefone'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 185
        Visible = True
      end>
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 57
    Align = alTop
    TabOrder = 1
    object dbtxtNome: TDBText
      Left = 7
      Top = 17
      Width = 402
      Height = 17
      DataField = 'Nome'
      DataSource = dsBuscaTelefone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object qryBuscaTelefone: TADOQuery
    Connection = frmLogin.ConectaBanco
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'idtel'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select t.IdTelefone,'
      '       t.Tipo,'
      #9't.Telefone,'
      #9't.Nome'
      '  from('
      
        'select '#39'('#39' + substring(Residencia,0,3) + '#39')'#39' + substring(Residen' +
        'cia,3,4) + '#39'-'#39' + substring(Residencia,4,4)  as Telefone,'
      '       '#39'Residencia'#39' as Tipo,'
      #9' nome,'
      #9' IdTelefone'
      '  from Telefone'
      'where Residencia <> '#39#39
      ' '
      'union all'
      ''
      
        'select '#39'('#39' + substring(Celular,0,3) + '#39')'#39' + substring(Celular,3,' +
        '5) + '#39'-'#39' + substring(Celular,4,4)  as Telefone,'
      '       '#39'Celular'#39'as Tipo,'
      #9' nome,'
      #9' IdTelefone'
      '  from Telefone'
      ' where Celular <> '#39#39
      ''
      'union all'
      ''
      
        ' select '#39'('#39' + substring(Comercial,0,3) + '#39')'#39' + substring(Comerci' +
        'al,3,4) + '#39'-'#39' + substring(Comercial,4,4)  as Telefone,'
      '       '#39'Comercial'#39' as Tipo,'
      #9' nome,'
      #9' IdTelefone'
      '  from Telefone '
      '  where Comercial <> '#39#39' ) as t'
      ''
      'where t.IdTelefone = :idtel')
    Left = 304
    Top = 8
  end
  object dsBuscaTelefone: TDataSource
    DataSet = qryBuscaTelefone
    Left = 384
    Top = 8
  end
end
