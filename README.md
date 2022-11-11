# pic_empty.pas
Проверка файла в формате jpg на наличие изображения.

## Описание

```pas
function peIsPicEmpty(const jpgFileName:string;const density:single;const level:integer):integer;
```
```jpgFileName``` - абсолютный путь к файлу\
```density``` - плотность заполнения, выше которой считаем что рисунок заполнен\
```level``` - уровень яркости (255- белый .... 0 - черный),   меньше которой ( по одной компоненте rgb) 
считаем, что цвет невидим 




## Пример использования
```pas
uses pic_empty;

...

procedure TForm.Button2Click(Sender: TObject);
var res:integer;
begin

    if OpenDialog1.Execute() then
    begin
        memo1.Lines.Add('test: '+ OpenDialog1.FileName);
        res:=peIsPicEmpty(OpenDialog1.FileName,5,200);
        memo1.Lines.Add('result: '+IntToStr(res));
        if (res = 1) then
            memo1.Lines.Add('пустой')
        else if (res = 0) then
            memo1.Lines.Add('заполненный')
        else
            memo1.Lines.Add('ошибка');
    end;

end;

```

