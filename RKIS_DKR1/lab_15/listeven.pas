program ListEvenItems;

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

procedure PrintList(Head: PNode);
begin
  while Head <> nil do
  begin
    WriteLn(Head^.data);
    Head := Head^.next;
  end;
end;

procedure PrintEvenItems(Head: PNode);
begin
  while Head <> nil do
  begin
    if Head^.data mod 2 = 0 then
      WriteLn(Head^.data);
    Head := Head^.next;
  end;
end;

var
  i: Integer;
begin
  Head := nil;
  Randomize;
  for i := 1 to 10 do
    Add(Head, Random(100) + 1); 
  WriteLn('All items:');
  PrintList(Head);
  WriteLn('Even items:');
  PrintEvenItems(Head);
end.
