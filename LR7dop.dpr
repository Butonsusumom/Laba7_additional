program LR7dop;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
symbols = ['A'..'z', ' '];
K=225;

type
  TStringsArray = array[1..K] of string;

  procedure Correctinput(var S:string; var g,position:integer);
 var i:Integer;
  begin
    Readln(S);

    g:=0;
     for i:=1 to Length(S) do
      begin
       If not(S[i] in symbols) then
       inc(g);
      end;
   position := pos(' ', S);
  end;

function MyTrim( var S:string):string;
 var  i,g:Integer;
 begin
   i:=length(s);
   if S[i]=' ' then
    begin
     repeat dec(i) until (s[i]<>' ');
     Delete(S,i+1,Length(S)-i);
    end;
  g:=1;
   if (S[g]=' ')  then
    begin
     repeat inc(g) until (s[g]<>' ');
     Delete(S,1,g-1);
    end;
   MyTrim:=S;
 end;

procedure toStandart(var S:string);
  var
  g:Integer;
 begin
   S:=MyTrim(S);
  g:=1;
   while g<=Length(S) do
    begin
     if (S[g]=' ') and (S[g-1]=' ') and (g>1) then
     Delete(S,g,1)
     else
     Inc(g);
    end;
 end;

 procedure CountWords( S:string;var N:integer);
  begin
       N := 1;
    while pos(' ', S) > 0 do
     begin
      delete(S, 1, pos(' ', S));
      inc(N);
     end;
  end;

  function FindWord (S:string;numb:Integer):string;
   var i,position,beg,en:Integer;
 begin
     for i:=1 to numb-1 do
      begin
        position:=pos(' ',S);
        Delete(S,1,position);
      end;
      beg:=1;
      en:=1;
     while (S[en]<>' ') and (S[en]<>'') do
      Inc(en);
    FindWord:=Copy(S,beg,en-1);
  end;

  procedure Swap( var A,B:string);
  var Temp:String;
   begin
      Temp:=A;
      A:=B;
      B:=Temp;
   end;

   function MyLowerCase(s: string): string;
var
   i: integer;
begin
  result := s;
  for i := 1 to length(result) do
     if (result[i] in ['A'..'Z'])
       then result[i] := chr(ord(result[i]) + 32);
end;

 function MyAnsiCompareText(S1,S2:string):integer;
  begin
    S1:=MyLowercase(S1);
    S2:=MyLowerCase(S2);
    if S1<S2 then  result:=-1;
    if S1>S2 then  result:=1;
    if S1=S2 then  result:=0;
  end;

 procedure Sort(var A:TStringsArray; var size:Integer);
 var i,j,min:Integer;
   begin
     for i:=1 to size-1 do
       begin
        min:=i;
        for j:=i+1 to size do
        begin
          if MyAnsiCompareText(A[j],A[min])=-1 then min:=j;
        end;
        Swap(A[i],A[min]);
       end;
   end;

   procedure Arr( var A:TStringsArray;S:string;N:Integer);
    var i:integer;
   begin
     for i:=1 to N do
      A[i]:=FindWord(S,i);
   end;

 procedure Output(A:TStringsArray;N:integer);
 var i:Integer;
  begin
    for i:=1 to N do
    write(A[i],' ');

  end;

 var S:string;
     g,position,N:integer;
     A:TStringsArray;


BEGIN
  Writeln('Please, write the line');
  Correctinput(S,g,position);
  If (S = '') or (g>0) or (position=0) then
   writeln('You haven''t entered a correct line')
  else

  begin
   toStandart(S);
   CountWords(S,N);
   Arr(A,S,N);
   Sort(A,N);
   Writeln;
   Output(A,N);
      end;

   Readln;

END.
