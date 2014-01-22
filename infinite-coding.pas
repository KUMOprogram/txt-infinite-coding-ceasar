program ceasar_txt;
uses wincrt;
var u:text;
    t:char;
    filename:string;
    a:array[1..1000] of char;
    b:array[1..1000] of char;
    n,epanalipseis,i:integer;

BEGIN
 writeln('CEASAR is a CODE LANGUAGE where u add in every letter+1 and every number+1 too');
 writeln('eventually if u put 9 it should show 0 and if u put Z/z should show A/a');
 writeln('spaces are ! and enter gives END to the coding program');
 writeln;

 writeln('for translation from ceasar press 0');
 writeln('for coding to ceasar press 1');
 readln(n);

 {coding se ceasar}

 epanalipseis:=0;
 if n=1 then
 begin
  write('write your message: ');
  for i:=1 to 1000 do
  begin
   read(a[i]);

   if a[i]='z' then
   begin
    b[i]:='a';
    epanalipseis:=epanalipseis+1;
   end

   else if a[i]='Z' then
   begin
    b[i]:='A';
    epanalipseis:=epanalipseis+1;
   end

   else if a[i]='9' then
   begin
    b[i]:='0';
    epanalipseis:=epanalipseis+1;
   end

   else if a[i]=char(13) then
   begin
    i:=1000;
   end

   else
   begin 
    b[i]:=char(ord(a[i])+1);
    epanalipseis:=epanalipseis+1;
   end;

  end;

  write('CODE CEASAR: ');
  for i:=1 to epanalipseis do
  begin
   write(b[i]);
  end;

 writeln(char(13));
 writeln('CODE saved at C:\CODE_cea.txt');


 filename:='C:\CODE_cea.txt';
 assign(u,filename);
 rewrite(u);
  for i:=1 to epanalipseis do
  begin
   write(u,a[i]);
  end;

  writeln(u,char(13));

  for i:=1 to epanalipseis do
  begin
   write(u,b[i]);
  end;
 close(u);
 end;


 {metaglwtish apo ceasar}


 if n=0 then
 begin
  writeln('LOADING DATA FROM C:\ceasar.txt: ');

  filename:='C:\ceasar.txt';
   assign(u,filename);
   reset(u);
    for i:=1 to 1000 do
     begin
      read(u,t);
      b[i]:=t;
       if b[i]='A' then
       begin
        a[i]:='Z';
        epanalipseis:=epanalipseis+1;
       end

       else if b[i]='a' then
       begin
        a[i]:='z';
        epanalipseis:=epanalipseis+1;
       end
 
       else if b[i]='0' then
       begin
        a[i]:='9';
        epanalipseis:=epanalipseis+1;
       end
  
       else if b[i]=char(26) then
       begin
        i:=1000;
       end
  
       else
       begin
        a[i]:=char(ord(b[i])-1);
        epanalipseis:=epanalipseis+1;
       end;
      end;
     end;
   close(u);
     

  for i:=1 to 1000 do
  begin

  write('UNCODE CEASAR: ');
  for i:=1 to epanalipseis do
  begin
   write(a[i]);
  end;

  writeln(char(13));
  writeln('UNCODED MSG saved at C:\CODE_cea.txt');
  
  filename:='C:\CODE_cea.txt';
  assign(u,filename);
  append(u);
   writeln(u,char(13));
   write(u,'uncode: ');
   for i:=1 to epanalipseis do
   begin
    write(u,a[i]);
   end;

   writeln(u,char(13));

   write(u,'CODE: ');
   for i:=1 to epanalipseis do
   begin
    write(u,b[i]);
   end;

   writeln(u,char(13));

  close(u);
 end;

END.    
