program cau1;

uses crt;
var n,i,j:byte;
    a:array[1..100,1..100] of integer;
    b,e:array[1..100,1..100] of integer;
    c,d:array[1..100] of integer ;
    ans,max:integer ;
procedure imp;
var f:text;
begin
        assign(f,'RESERVES.INP');
        reset(f);
        readln(f,n);
        for i:=1 to n do
        begin
                for j:=1 to n do begin read(f,a[i,j]);b[i,j]:=-1;e[i,j]:=-1 end;
                readln(f);
        end;
        close(f);
end;
////////////////////////////////////////////////
procedure exp;
var f:text;
begin
        assign(f,'RESERVES.OUT');
        rewrite(f);
        write(f,ans);
        close(f);
end;
////////////////////////////////////////////////
BEGIN
        imp;
        ans:=0;
        for i:=1 to n do
        begin
                max:=0;
                for j:=1 to n do
                begin
                        c[j]:=-1;
                        d[j]:=-1;
                        if (i=1) or (j=1) then b[i,j]:=-2 else
                        if a[i,j]>=max then
                        begin
                        max:=a[i,j];c[j]:=max;
                        end
                        else c[j]:=0;
                end;
                for j:=n downto 1 do
                begin
                        if a[i,j]>max then
                        begin
                        max:=a[i,j];d[j]:=max;
                        end
                        else d[j]:=0;
                end;
                for j:=1 to n do if (c[j]=0) and (d[j]=0) and (b[i,j]<>-2) then b[i,j]:=0;

        end;
        for j:=1 to n do
        begin
                max:=0;
                for i:=1 to n do
                begin
                        c[i]:=-1;
                        d[i]:=-1;
                        if (i=1) or (j=1) then e[i,j]:=-2 else
                        if a[i,j]>=max then
                        begin
                        max:=a[i,j];c[i]:=max;
                        end
                        else c[i]:=0;
                end;
                for i:=n downto 1 do
                begin
                        if a[i,j]>max then
                        begin
                        max:=a[i,j];d[i]:=max;
                        end
                        else d[i]:=0;
                end;
                for i:=1 to n do if (c[i]=0) and (d[i]=0) and (e[i,j]<>-2) then e[i,j]:=0;

        end;
        for i:=1 to n do
                for j:=1 to n do
                        if (b[i,j]=0) and (e[i,j]=0) then inc(ans);
        exp;

END.









