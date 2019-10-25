function yrequired= CubicRegression(x,y,xgiven)

sizx = size(x);
sizx = sizx(2);
sizy = size(y);
sizy = sizy(1);
for j=1 : sizy
    sx=0;sx2=0;sx3=0;sx4=0;sx5=0;sx6=0;sy=0;sxy=0;sx2y=0;sx3y=0;
for i=1 : sizx
    sx  = sx  + x(i);
    sx2 = sx2 + x(i)*x(i);
    sx3 = sx3 + x(i)*x(i)*x(i);
    sx4 = sx4 + x(i)*x(i)*x(i)*x(i);
    sx5 = sx5 + x(i)*x(i)*x(i)*x(i)*x(i);
    sx6 = sx6 + x(i)*x(i)*x(i)*x(i)*x(i)*x(i);
    sy  = sy  + y(j,i);
    sxy = sxy + x(i)*y(j,i);
    sx2y= sx2y+ x(i)*x(i)*y(j,i);
    sx3y= sx3y+ x(i)*x(i)*x(i)*y(j,i);
end
MAT=[sizx sx sx2 sx3;sx sx2 sx3 sx4; sx2 sx3 sx4 sx5; sx3 sx4 sx5 sx6];
BVEC=[sy;sxy;sx2y;sx3y];
BVEC=MAT\BVEC;
yrequired(j)=[1 xgiven xgiven*xgiven xgiven*xgiven*xgiven]*BVEC;
end
