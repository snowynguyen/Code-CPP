var n,i,j,dem:integer;
    a,tham,f:array[1..100,1..100] of longint;
    ans:longint;

const dx:array[1..4] of integer=(0,1,0,-1);
      dy:array[1..4] of integer=(1,0,-1,0);
      maxn=32767;
      fi='reserves.inp';
      fo='reserves.out';

function tinh(u,v:integer):longint;
var x,y,z,bang,minij:longint;
begin
dem:=0;
minij:=maxn;

        for z:=1 to 4 do
        begin
                        if(minij>a[u+dx[z]][v+dy[z]]) then
                        begin
                             x:=u+dx[z];
                             y:=v+dy[z];
                            minij:=a[u+dx[z]][v+dy[z]];
                        end;

        end;

        for z:=1 to 4 do
        begin
                {if ((a[i][j]>=a[i+dx[z]][j+dx[z]]) and (i+dx[z]=x) and (j+dy[z]=y)) then begin
                                                                                        tham[u,v]:=1;
                                                                                        f[u,v]:=tinh(x,y);
                                                                                        end;}
                //if (a[i][j]==a[i+dx[z]][j+dx[z]]) {bang++;}
                if (a[u][v]<a[u+dx[z]][v+dy[z]]) then
                    inc(dem);
                //end;
        end;
            if (dem=4) then
            begin
            f[u][v]:=a[x][y]-a[u][v];
            a[u,v]:=a[x,y];
            tham[u,v]:=1;
            end
            else begin
                if tham[x,y]=0 then
                begin
                        tham[u][v]:=1;
                        f[u][v]:=tinh(x,y);
                        end
                else f[u,v]:=0;
            end;
end;

BEGIN
assign(input,fi); reset(input);
assign(output,fo);rewrite(output);

    read(n);
    for i:=1 to n do
    begin
        for j:=1 to n do
        begin
            read(a[i][j]);
            f[i][j]:=maxn;
            tham[i][j]:=0;
        end;
    end;

    for i:=1 to n do
    begin
        f[1][i]:=-1;
        f[i][1]:=-1;
        f[n][i]:=-1;
        f[i][n]:=-1;
        tham[1][i]:=1;
        tham[i][1]:=1;
        tham[n][i]:=1;
        tham[i][n]:=1;
    end;



    for i:=2 to n-1 do
    begin
        for j:=2 to n-1 do
        begin
            if (tham[i][j]=0) then tinh(i,j);
        end;
    end;

    for i:=1 to n do
    begin
        for j:=1 to n do
        begin
            if (f[i][j]>0) then ans:=ans+f[i][j];
        end;
    end;
  //  sort(b,b+n);
    write(ans);
END.
