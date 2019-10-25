%% DataFitting Function for Load Foracasting
% 
% Developed By Hazoor Ahmad BSEE UET Lahore, MSEE UET Taxila, Pakistan.
%% Function 
function [yrequired] = DataFitting( x, y, type, xgiven) 
%% Data Fitting function for least square data fitting Program
% 
% Developed By Hazoor Ahmad BSEE UET Lahore, MSEE UET Taxila, Pakistan.
% 
% type = 0 :  Data Fitting of Exponential y=a*e^b*x are solved
% 
% type = 1 :  Data Fitting of Linear y=a+b*x are solved
% 
% type = 2 :  Data Fitting of Parabola y=a+b*x+c*x^2 are solved
% 
% type = 3 :  Data Fitting of Cubical Expression y=a+b*x+c*x^2+d*x^3 are solved
% 
%% Code
sx=0;
sx2=0;
sx3=0;
sx4=0;
sx5=0;
sx6=0;
sy=0;
sxy=0;
sx2y=0;
sx3y=0;
if nargin == 4
    sizx = size(x);
    sizx = sizx(2);
    sizy = size(y);
    sizy = sizy(2);
    if sizy == sizx
        if type==1
            for i=1 : sizx
                sx  = sx  +x(i);
                sx2 = sx2+x(i)*x(i);
                sy  = sy+y(i);
                sxy = sxy+x(i)*y(i);
            end
            MAT=[sizx sx;sx sx2];
            MAT=inv(MAT);
            BVEC=[sy;sxy];
            BVEC=MAT*BVEC;
            yrequired=[1 xgiven]*BVEC;
        elseif type ==2
            for i=1 : sizx
                sx  = sx  +x(i);
                sx2 = sx2+x(i)*x(i);
                sx3 = sx3+x(i)*x(i)*x(i);
                sx4 = sx4+x(i)*x(i)*x(i)*x(i);
                sy  = sy+y(i);
                sxy = sxy+x(i)*y(i);
                sx2y= sx2y+x(i)*x(i)*y(i);
            end
            MAT=[sizx sx sx2;sx sx2 sx3; sx2 sx3 sx4];
            MAT=inv(MAT);
            BVEC=[sy;sxy;sx2y];
            BVEC=MAT*BVEC;
            yrequired=[1 xgiven xgiven*xgiven]*BVEC;
        elseif type ==3
            for i=1 : sizx
                sx  = sx  +x(i);
                sx2 = sx2+x(i)*x(i);
                sx3 = sx3+x(i)*x(i)*x(i);
                sx4 = sx4+x(i)*x(i)*x(i)*x(i);
                sx5 = sx5+x(i)*x(i)*x(i)*x(i)*x(i);
                sx6 = sx6+x(i)*x(i)*x(i)*x(i)*x(i)*x(i);
                sy  = sy+y(i);
                sxy = sxy+x(i)*y(i);
                sx2y= sx2y+x(i)*x(i)*y(i);
                sx3y= sx3y+x(i)*x(i)*x(i)*y(i);
            end
            MAT=[sizx sx sx2 sx3;sx sx2 sx3 sx4; sx2 sx3 sx4 sx5; sx3 sx4 sx5 sx6];
            MAT=inv(MAT);
            BVEC=[sy;sxy;sx2y;sx3y];
            BVEC=MAT*BVEC;
            yrequired=[1 xgiven xgiven*xgiven xgiven*xgiven*xgiven]*BVEC;
        elseif type == 0
            for i=1 : sizx
                sx  = sx  +x(i);
                sx2 = sx2+x(i)*x(i);
                sy  = sy+log(y(i));
                sxy = sxy+x(i)*log(y(i));
            end
            MAT=[sizx sx;sx sx2];
            MAT=inv(MAT);
            BVEC=[sy;sxy];
            BVEC=MAT*BVEC;
            BVEC(1)=exp(BVEC(1));
            yrequired=BVEC(1)*exp(BVEC(2)*xgiven);
        else
            msgbox('Type of Data Fitting is not defined please enter (0 to 3) for type')
        end
    else
        msgbox('Sizes of Given Data are not the same')
    end
else
    msgbox('Too Few Inputs Given');
end
% For Example
% x=[1 2 3 4 5 6 7 8 9 10];
% y=[1250 1300 1400 1450 1550 1640 1730 1840 1950 2060];
% type=3;
% xgiven=12;
% answer=DataFitting(x,y,type,xgiven)

