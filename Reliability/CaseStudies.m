x = [1 2 3 4 5 6 7 8 9 10];
y = [2550 2600 2750 2700 2750 2800 2900 3050 3100 3200];
n = 10;
type = 2 % for parabola DataFitting
Y = SuccessiveRegression( x, y, type, n );
Y = round(Y);
Lmin = 1000; % Supposing Lowest Demand for every year to be 2000MW
newunits = 0;
LOLE = zeros(1,n);
for i=1:n
    LOLE(i) = LOLP(10, 175, 0.1, 4, 432, 0.1, newunits, 470, 0.1, Y(i), Lmin)
    while (LOLE(i) > 0.1 && newunits <=3)
    newunits = newunits+1;
   LOLE(i) = LOLP(10, 175, 0.1, 4, 232, 0.1, newunits, 470, 0.1, Y(i), Lmin);
    end
end
