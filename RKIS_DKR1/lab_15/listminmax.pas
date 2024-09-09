program FindMinMaxProgram;

type
  PNode = ^TNode;
  TNode = record
    data: Integer;
    next: PNode;
  end;

var
  Head: PNode;

procedure Add(var Head: PNode; Value: Integer);
var
  NewNode: PNode;
begin
  New(NewNode);
  NewNode^.data := Value;
  NewNode^.next := Head;
  Head := NewNode;
end;

procedure FindMinMax(Head: PNode; var Min, Max: Integer);
begin
  if Head = nil then Exit;

  Min := Head^.data;
  Max := Head^.data;

  while Head <> nil do
  begin
    if Head^.data < Min then
      Min := Head^.data;
    if Head^.data > Max then
      Max := Head^.data;
    Head := Head^.next;
  end;
end;

procedure PrintList(Head: PNode);
begin
  while Head <> nil do
  begin
    Write(Head^.data, ' ');
    Head := Head^.next;
  end;
  WriteLn;
end;

var
  i, Min, Max: Integer;
begin
  Head := nil;
  for i := 1 to 10 do
    Add(Head, Random(100) + 1); 
  Write('List: ');
  PrintList(Head);
  FindMinMax(Head, Min, Max);
  WriteLn('Минимальный элемент: ', Min);
  WriteLn('Максимальный элемент: ', Max);
end.
