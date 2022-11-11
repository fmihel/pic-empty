# pic-empty
Проверка файла в формате jpg на наличие изображения.

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
            memo1.Lines.Add('empty')
        else if (res = 0) then
            memo1.Lines.Add('filled')
        else
            memo1.Lines.Add('error');
    end;

end;


```

