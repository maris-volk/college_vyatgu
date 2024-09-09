program lab16;

type 
  PointerNode = ^Node;
  Node = record
    num: integer;
    prev_node: PointerNode;
    next_node: PointerNode;
  end;
  DeQueue = record
    head, tail: PointerNode;
  end;

procedure PushTail(var DeQ: DeQueue; int: integer);
var 
  created_node: PointerNode;
begin
  New(created_node);
  created_node^.num := int;
  created_node^.next_node := nil;
  created_node^.prev_node := nil;
  if DeQ.tail <> nil then
  begin
    created_node^.prev_node := DeQ.tail;
    DeQ.tail^.next_node := created_node;
  end;
  DeQ.tail := created_node; 
  if DeQ.head = nil then
    DeQ.head := DeQ.tail;
end;

procedure InversePopNode(var DeQ: DeQueue);
var
  temp: integer;
  leftPointer, rightPointer: PointerNode;
begin
  if (DeQ.head = nil) or (DeQ.tail = nil) then
  begin
    writeln('Очередь пуста');
    Exit;
  end;
  leftPointer := DeQ.head;
  rightPointer := DeQ.tail;
  while leftPointer <> rightPointer do
  begin
    temp := leftPointer^.num;
    leftPointer^.num := rightPointer^.num;
    rightPointer^.num := temp;
    leftPointer := leftPointer^.next_node;
    rightPointer := rightPointer^.prev_node;
  end;
end;

procedure PrintList(Head: PointerNode);
var
  Current: PointerNode;
begin
  Current := Head;
  while Current <> nil do
  begin
    writeln(Current^.num);
    Current := Current^.next_node;
  end;
end;

procedure Rewrite_File(Head: PointerNode; F2: TextFile);
var
  Current: PointerNode;
begin
  Current := Head;
  while Current <> nil do
  begin
    WriteLn(F2, Current^.num);
    Current := Current^.next_node;
  end;
  CloseFile(F2);
end;

var 
  F: TextFile;
  F_1: TextFile;
  num: Integer;
  Main_DeQ: DeQueue;
begin
  Main_DeQ.head := nil;
  Main_DeQ.tail := nil;
  
  AssignFile(F, 'nums.txt');
  Reset(F);
  while not eof(F) do
  begin
    ReadLn(F, num);
    PushTail(Main_DeQ, num);
  end;
  CloseFile(F);
  Writeln('Начальный список');
  PrintList(Main_DeQ.head);
  InversePopNode(Main_DeQ);
  Writeln('Список после инвертирования');
  PrintList(Main_DeQ.head);
  AssignFile(F_1, 'out.txt');
  Rewrite(F_1);
  Rewrite_File(Main_DeQ.head, F_1);
end.
