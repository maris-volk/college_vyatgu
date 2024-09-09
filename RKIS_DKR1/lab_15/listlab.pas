program AlphabeticalFrequencyDictionary;

type
  PNode = ^Node;
  Node = record
    word: string[40];
    count: integer;
    next: PNode;
  end;

var
  Head: PNode = nil;
  
function CreateNode(NewWord: string): PNode;
var
  NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.count := 1;
  NewNode^.next := nil;
  Result := NewNode;
end;

procedure AddSorted(var Head: PNode; NewNode: PNode);
var
  Current, Previous: PNode;
begin
  Current := Head;
  Previous := nil;
  
  while (Current <> nil) and (Current^.word < NewNode^.word) do
  begin
    Previous := Current;
    Current := Current^.next;
  end;
  
  if Previous = nil then
  begin
    NewNode^.next := Head;
    Head := NewNode;
  end
  else
  begin
    NewNode^.next := Previous^.next;
    Previous^.next := NewNode;
  end;
end;

function FindOrAddWord(var Head: PNode; Word: string): PNode;
var
  Current: PNode;
begin
  Current := Head;
  while Current <> nil do
  begin
    if Current^.word = Word then
    begin
      Inc(Current^.count);
      Exit();
    end;
    Current := Current^.next;
  end;
  Current := CreateNode(Word);
  AddSorted(Head, Current);
end;

procedure PrintList(Head: PNode);
var
  Current: PNode;
begin
  Current := Head;
  while Current <> nil do
  begin
    writeln(Current^.word, ': ', Current^.count);
    Current := Current^.next;
  end;
end;

function CountNodes(Head: PNode): integer;
var
  Count: integer;
  Current: PNode;
begin
  Count := 0;
  Current := Head;
  while Current <> nil do
  begin
    Inc(Count);
    Current := Current^.next;
  end;
  Result := Count;
end;

var
  F: TextFile;
  Word: string;
  TotalWords: integer;
begin
  AssignFile(F, 'input.txt');
  Reset(F);
  while not eof(F) do
  begin
    ReadLn(F, Word);
    FindOrAddWord(Head, Word);
  end;
  CloseFile(F);
  PrintList(Head);
  TotalWords := CountNodes(Head);
  writeln('Всего уникальных слов (количество узлов): ', TotalWords);
end.
