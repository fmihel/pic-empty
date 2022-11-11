unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs{,GR32}, StdCtrls,JPEG,pic_empty;

type
  TForm28 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form28: TForm28;

implementation

{$R *.dfm}


procedure TForm28.FormCreate(Sender: TObject);
begin
    if (DirectoryExists('E:\Delphi7\pic-empty\media')) then
        OpenDialog1.InitialDir :='E:\Delphi7\pic-empty\media'
    else
        OpenDialog1.InitialDir := GetCurrentDir();
end;

procedure TForm28.Button1Click(Sender: TObject);
{
var bit:TBitmap32;
    x: Integer;
    c:TColor32;
    s:string;
    y: Integer;
    jpeg:TJPEGImage;
    rgba:TColor32Entry;
}
begin
{
    if OpenDialog1.Execute() then
    begin
        bit:=TBitmap32.Create();

        jpeg:=TJPEGImage.Create;
        jpeg.CompressionQuality:=100;
        jpeg.LoadFromFile(OpenDialog1.FileName);
        bit.Assign(jpeg);
        //bit.LoadFromFile(OpenDialog1.FileName);
        Memo1.Lines.BeginUpdate;
        for x:=0 to bit.Width-1 do
        begin
            s:=IntToStr(x);
            for y:=0 to bit.Height-1 do
            begin
                rgba:=TColor32Entry(bit.Pixel[x,y]);

                s:=s+' | ('+intToStr(rgba.R)+','+intToStr(rgba.G)+','+intToStr(rgba.B)+','+intToStr(rgba.A)+')';
            end;
                Memo1.Lines.Add(s);
        end;
        Memo1.Lines.EndUpdate;
        bit.Free;
    end;
}
end;


procedure TForm28.Button2Click(Sender: TObject);
var res:integer;
begin


    if OpenDialog1.Execute() then
    begin
        memo1.Lines.Add('test: '+ OpenDialog1.FileName);
        res:=peIsPicEmpty(OpenDialog1.FileName,5,200);
        memo1.Lines.Add('result: '+IntToStr(res));
        if (res = 1) then
            memo1.Lines.Add('empty')
        else if (res = 0) then
            memo1.Lines.Add('filled')
        else
            memo1.Lines.Add('error');
    end;

end;

end.
