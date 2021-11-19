object Form_rel_abastecimento: TForm_rel_abastecimento
  Left = 438
  Top = 282
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Abastecimento por Per'#237'odo'
  ClientHeight = 144
  ClientWidth = 496
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 229
    Top = 45
    Width = 22
    Height = 16
    Caption = 'at'#233
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object btn_gerar: TBitBtn
    Left = 144
    Top = 88
    Width = 81
    Height = 33
    Caption = 'Gerar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btn_gerarClick
    Glyph.Data = {
      42010000424D4201000000000000760000002800000011000000110000000100
      040000000000CC00000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      77777000000070000000007777777000000070FFFFFFF07777700000000070F7
      7777F07777000000000070F77777F07770007000000070F77780008700077000
      000070F7700FFF0000777000000070F708FFFF0807777000000070F80E000F07
      08777000000070F0EFEFEF0770777000000070F0F0000F077077700000007000
      EFEFFF0770777000000077780000000708777000000077770077777807777000
      0000777770077700777770000000777777800087777770000000777777777777
      777770000000}
  end
  object dt_inicial: TDateTimePicker
    Left = 56
    Top = 40
    Width = 153
    Height = 24
    Date = 44517.839466192130000000
    Format = 'dd/MM/yyyy'
    Time = 44517.839466192130000000
    TabOrder = 1
  end
  object dt_final: TDateTimePicker
    Left = 272
    Top = 40
    Width = 153
    Height = 24
    Date = 44517.839622118050000000
    Format = 'dd/MM/yyyy'
    Time = 44517.839622118050000000
    TabOrder = 2
  end
  object btn_sair: TBitBtn
    Left = 256
    Top = 88
    Width = 81
    Height = 33
    Caption = 'Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btn_sairClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
      0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
      0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
      0333337F777FFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
  end
  object ADOQuery_rel_abastecimento: TADOQuery
    Connection = Form_principal.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    Left = 8
    Top = 112
  end
  object ADOQuery_aux: TADOQuery
    Connection = Form_principal.ConexaoBD
    Parameters = <>
    Left = 464
    Top = 112
  end
  object rel_abastecimento: TRvProject
    ProjectFile = 
      'C:\Program Files (x86)\Borland\Delphi7\Projects\Posto ABC\rel_ab' +
      'astecimento.rav'
    Left = 48
    Top = 112
  end
  object ds_rel_abastecimento: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOQuery_rel_abastecimento
    Left = 88
    Top = 112
  end
end
