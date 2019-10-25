% Cubic Regression
% Hourly Data of GHIrsi (W/m²) average

x=[1 3 4 5 6 7 8 9];
y=[0	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	0
    0	0	1	1	1	1	1	1
    41	35	36	43	48	52	35	47
    183	160	169	186	209	219	86	198
    372	353	355	383	408	418	385	386
    563	540	545	584	601	615	373	574
    721	694	708	755	757	782	751	736
    836	797	812	873	873	892	878	846
    884	854	859	922	928	951	902	891
    874	850	792	870	919	943	871	888
    684	783	704	709	869	891	828	806
    563	646	518	726	759	772	733	707
    403	487	329	554	602	615	554	554
    389	364	353	386	419	421	333	369
    186	199	162	208	222	232	198	187
    35	45	36	52	53	58	49	46
    0	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	0
    0	0	0	0	0	0	0	0
    ];
xgiven = 10;
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
MAT=inv(MAT);
BVEC=[sy;sxy;sx2y;sx3y];
BVEC=MAT*BVEC;
yrequired(j)=[1 xgiven xgiven*xgiven xgiven*xgiven*xgiven]*BVEC;
end
