 procedure TForm1.Button1Click(Sender: TObject);
var

i: Integer;
F: TFieldDef;
D: String;
begin

Table1.Active := True;
ListBox1.Items.Clear;


with Table1 do begin
for i := 0 to FieldDefs.Count - 1 do begin
F := FieldDefs.Items[i];
case F.DataType of
ftUnknown: D := 'Unknown';
ftString: D := 'String';
ftSmallint: D := 'SmallInt';
ftInteger: D := 'Integer';
ftWord: D := 'Word';
ftBoolean: D := 'Boolean';
ftFloat: D := 'Float';
ftCurrency: D := 'Currency';
ftBCD: D := 'BCD';
ftDate: D := 'Date';
ftTime: D := 'Time';
ftDateTime: D := 'DateTime';
ftBytes: D := 'Bytes';
ftVarBytes: D := '';
ftBlob: D := 'BLOB';
ftMemo: D := 'Memo';
ftGraphic: D := 'Graphic';
else
D := '';
end;
ListBox1.Items.Add(F.Name + ', ' + D);
end;
end;
Table1.Active := False;
end;  