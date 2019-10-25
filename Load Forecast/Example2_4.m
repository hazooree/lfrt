%% Example 2.4 of Chapter 2 Load Foracasting
% 
% Developed By Hazoor Ahmad BSEE UET Lahore, MSEE UET Taxila, Pakistan. 
% 
%% Example 2.4 Chapter Load Foracasting
% Maximum Demand and coincident temperature record of seven years for a
% 
% certain area is given in the following table (only typical data points
% 
% are shown for purpose of illustration). Determine the constants Kw, Ks
% 
% and Max. base demand for each of the years.project this information to
% 
% determine the total maximum demand during 9th year. Assume that for
% 
% temperature range of 65 to 70 no heating or cooling load is connected.
% 
% the minimum and maximum temperature forecasts for the year 9 may be taken
% 
% 8F and 96F.
% 
%  Year 1  | Year 2  | Year 3  | Year 4  | Year  5 | Year 6  | Year 7  |
%  T   MD  | T   MD  | T   MD  | T   MD  | T   MD  | T   MD  | T   MD  |
%  09 1340 | 10 1499 | 08 1660 | 07 1785 | 10 1915 | 09 2013 | 06 2109 |
%  19 1215 | 15 1480 | 14 1635 | 15 1755 | 13 1895 | 16 1978 | 13 2065 |
%  20 1305 | 23 1450 | 19 1602 | 16 1748 | 18 1853 | 20 1933 | 15 2054 |
%  27 1290 | 28 1438 | 25 1587 | 18 1742 | 23 1824 | 30 1878 | 25 1973 |
%  35 1270 | 31 1427 | 29 1565 | 25 1668 | 30 1783 | 35 1848 | 36 1914 |
%  41 1260 | 38 1394 | 35 1543 | 37 1608 | 38 1734 | 40 1814 | 44 1875 |
%  45 1245 | 44 1372 | 41 1525 | 49 1576 | 44 1696 | 44 1775 | 50 1820 |
%  52 1238 | 59 1330 | 52 1478 | 52 1568 | 53 1655 | 54 1712 | 55 1770 |
%  64 1200 | 64 1308 | 69 1432 | 61 1518 | 61 1593 | 64 1665 | 64 1728 |
%  69 1200 | 68 1303 | 68 1412 | 67 1493 | 68 1578 | 66 1648 | 68 1713 |
%  71 1206 | 74 1330 | 75 1440 | 73 1509 | 73 1605 | 69 1648 | 77 1763 |
%  79 1238 | 79 1355 | 79 1473 | 78 1565 | 78 1656 | 79 1722 | 81 1826 |
%  82 1244 | 81 1361 | 86 1515 | 84 1594 | 85 1688 | 83 1768 | 85 1833 |
%  85 1267 | 85 1400 | 88 1532 | 88 1635 | 88 1734 | 90 1821 | 89 1898 |
%  90 1281 | 90 1409 | 90 1542 | 92 1659 | 91 1741 | 92 1829 | 92 1899 |
%  92 1285 | 93 1426 | 92 1548 | 94 1681 | 93 1758 | 94 1851 | 93 1905 |
%% Code 
%    Year 1  | Year 2  | Year 3  | Year 4  | Year 5  | Year 6  | Year 7  |
% 
%    T   MD  | T   MD  | T   MD  | T   MD  | T   MD  | T   MD  | T   MD  |
% 
MAT=[ 09 1340  10 1499  08 1660  07 1785  10 1915  09 2013  06 2109;
    19 1215  15 1480  14 1635  15 1755  13 1895  16 1978  13 2065 ;
    20 1305  23 1450  19 1602  16 1748  18 1853  20 1933  15 2054 ;
    27 1290  28 1438  25 1587  18 1742  23 1824  30 1878  25 1973 ;
    35 1270  31 1427  29 1565  25 1668  30 1783  35 1848  36 1914 ;
    41 1260  38 1394  35 1543  37 1608  38 1734  40 1814  44 1875 ;
    45 1245  44 1372  41 1525  49 1576  44 1696  44 1775  50 1820 ;
    52 1238  59 1330  52 1478  52 1568  53 1655  54 1712  55 1770 ;
    64 1200  64 1308  69 1432  61 1518  61 1593  64 1665  64 1728 ;
    69 1200  68 1303  68 1412  67 1493  68 1578  66 1648  68 1713 ;
    71 1206  74 1330  75 1440  73 1509  73 1605  69 1648  77 1763 ;
    79 1238  79 1355  79 1473  78 1565  78 1656  79 1722  81 1826 ;
    82 1244  81 1361  86 1515  84 1594  85 1688  83 1768  85 1833 ;
    85 1267  85 1400  88 1532  88 1635  88 1734  90 1821  89 1898 ;
    90 1281  90 1409  90 1542  92 1659  91 1741  92 1829  92 1899 ;
    92 1285  93 1426  92 1548  94 1681  93 1758  94 1851  93 1905 ];
%% (a) Finding Kw and Ks
sizr=size(MAT);
sizr=sizr(1);
sizc=size(MAT);
sizc=sizc(2);
x =zeros(1,sizc/2);
Ks=zeros(1,sizc/2);
Kw=zeros(1,sizc/2);
BD=zeros(1,sizc/2);
for i=1 : sizc/2
    x(i) = i;
    Kw(i)=(MAT(1,2*i)-MAT(10,2*i))/(MAT(1,2*i-1)-65);
    Ks(i)=(MAT(16,2*i)-MAT(10,2*i))/(MAT(16,2*i-1)-70);
    BD(i)=MAT(10,2*i);
end
%% (b) Estimating Kw for 9th Year
Kw9 =   DataFitting(x,Kw,1,9);
Ks9 =   DataFitting(x,Ks,1,9);
BD9 =   DataFitting(x,BD,1,9);
%% (c) Calculating Total Maximum Demand during Winter Season for 9th Year
MDw = BD9 + Kw9 * (8-65);
%% (d) Calculating Total Maximum Demand during Summer Season for 9th Year
MDs = BD9 + Ks9 * (96-70);
%% Output
msgbox({...
    strcat('Linear Curve Fitting result of Kw for 9th year is = ' , num2str(Kw9))...
    strcat('Linear Curve Fitting result of Ks for 9th year is = ' , num2str(Ks9))...
    strcat('Linear Curve Fitting result of BD for 9th year is = ' , num2str(BD9))...
    strcat('Total Maximum Demand during Winter Season for 9th year is = ' , num2str(MDw))...
    strcat('Total Maximum Demand during Summer Season for 9th year is = ' , num2str(MDs))});
Kw