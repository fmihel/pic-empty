object Form28: TForm28
  Left = 1063
  Top = 264
  Caption = 'pic_empty'
  ClientHeight = 337
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    454
    337)
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 106
    Top = 8
    Width = 75
    Height = 25
    Caption = 'fast'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 25
    Top = 8
    Width = 75
    Height = 25
    Caption = 'standart'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 25
    Top = 48
    Width = 421
    Height = 281
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
    WordWrap = False
  end
  object OpenDialog1: TOpenDialog
    InitialDir = '../'
    Left = 208
    Top = 24
  end
end
