unit pic_empty;

interface
// проверка наличи€ изображени€ в jpg файле
// density - плотность изоброжани€ (процентное соотношение реально видимых точек по отношению ко всем точкам)
// level - уровень €ркости меньше которой точка считаетс€ видимой ( 255 - бела€.... 0-черна€ )
function peIsPicEmpty(const jpgFileName:string;const density:single;const level:integer):integer;

implementation
uses
    Graphics,SysUtils,JPEG,Math;
type
    RGB = record
        R,G,B:byte;
    end;

// ----------------------------------------------------------------------------------------
function toRGB(c:TColor):RGB;
begin
  result.r     := c;
  result.g     := c shr 8;
  result.b     := c shr 16;
end;
// ----------------------------------------------------------------------------------------
function isBitEmpty(const bit:TBitmap;const density:single;const level:integer):integer;
var
    x: Integer;
    y: Integer;
    rgba:RGB;

    all:single;
    current:single;
    min:integer;

begin
    result:=1;

    try

        current:=0;
        all:=bit.Width*bit.Height;

        for x:=0 to bit.Width-1 do
        begin
            for y:=0 to bit.Height-1 do
            begin
                rgba:=toRGB(bit.Canvas.Pixels[x,y]);

                // наи€рчайший цвет (считаем если тускнее то не отображаетс€)
                min:=Math.Min(rgba.R,Math.Min(rgba.G,rgba.B));
                if (min <= level) then
                begin
                    // кол-во реально отображаемых точек
                    current:=current+1;
                end;


                // если кол-во прревысит указанную плотность, то считаем что рисунок не пустой
                if (  ((current/all)*100) >= density ) then
                begin
                    result:=0;
                    exit;
                end;


            end;
        end;

    except
        on e:Exception do
        begin
            result:=-2;
        end;
    end;
end;
// ----------------------------------------------------------------------------------------
function peIsPicEmpty(const jpgFileName:string;const density:single;const level:integer):integer;
var
    jpeg:TJPEGImage;
    bit:TBitmap;
begin

    jpeg:=TJPEGImage.Create;
    bit:=TBitmap.create();

    try
        try
            jpeg.CompressionQuality:=100;
            jpeg.LoadFromFile(jpgFileName);
            bit.Assign(jpeg);

            result:=isBitEmpty(bit,density,level);

        except
            on e:Exception do
            begin
                result:=-1;
            end;
        end;
    finally
        bit.Free;
        jpeg.Free;
    end;

end;
// ----------------------------------------------------------------------------------------
end.
