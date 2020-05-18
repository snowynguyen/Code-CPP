const
fi='LUCKY.inp';
fo='LUCKY.out';
maxn=100000;
var n:longint;
    a:array[1..maxn] of int64;
    k,d:int64;

procedure nhap;
var f:text; i:longint;
begin
 assign(f,fi);
 reset(f);
 readln(f,n,k);
 for i:=1 to n do
  read(f,a[i]);
 close(f);
end;

procedure quicksort(l,r:longint);
var i,j:longint; z,x:int64;
begin
 i:=l; j:=r;
 x:=a[(i+j) div 2];
 repeat
  while a[i]<x do inc(i);
  while a[j]>x do dec(j);
  if i<=j then
   begin
    z:=a[i];
    a[i]:=a[j];
    a[j]:=z;
    inc(i);
    dec(j);
   end;
 until i>j;
 if l<j then quicksort(l,j);
 if i<r then quicksort(i,r);
end;

procedure xuli;
var i,j:longint;
begin
 d:=0;
 for i:=1 to n-1 do
 for j:=i+1 to n do
  if k-a[i]=a[j] then
   begin
    d:=d+1;
    if a[j+1]<>a[j] then break;
   end;
end;

procedure xuat;
var f:text;
begin
 assign(f,fo);
 rewrite(f);
 write(f,d);
 close(f);
end;

BEGIN
 nhap;
 quicksort(1,n);
 xuli;
 xuat;
END.
