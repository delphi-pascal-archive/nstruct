
procedure Pechat(Sender:TObject);
var
  I, Start, Stop: Integer;
begin
PrintDialog1.Options := [poPageNums, poSelection];
PrintDialog1.FromPage := 1;
PrintDialog1.MinPage := 1;
PrintDialog1.ToPage := PageControl1.PageCount;
PrintDialog1.MaxPage := PageControl1.PageCount;
if PrintDialog1.Execute then
  begin
    { determine the range the user wants to print }
    with PrintDialog1 do
    begin
      if PrintRange = prAllPages then
        begin
        Start := MinPage - 1;
        Stop := MaxPage - 1;
      end
      else if PrintRange = prSelection then
      begin
        Start := PageControl1.ActivePage.PageIndex;
        Stop := Start;
        end
      else  { PrintRange = prPageNums }
      begin
        Start := FromPage - 1;
        Stop := ToPage - 1;
      end;
    end;
    { now, print the pages }

    with Printer do
    begin
      BeginDoc;
      for I := Start to Stop do
      begin
        PageControl1.Pages[I].PaintTo(Handle, 10, 10);
        if I <> Stop then
          NewPage;
      end;
      EndDoc;
    end;
  end;
