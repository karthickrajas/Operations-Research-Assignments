$title A Quadratic Programming Model for Portfolio Analysis

$onText
Keywords: mixed integer nonlinear programming, portfolio optimization

$offText

Set i 'stocks' / BB, LOP, ILI, HEAL, QUI, AUA /;

Alias (i,j);

Scalar objective     'objective Annual return on portfolio       (%)' / 70/;

Parameter mean(i) 'Annual returns of the stock  (%)'
                  / BB 20, LOP 42, ILI 100, HEAL 50, QUI 46, AUA 30 /;

Table v(i,j) 'variance-covariance array   (%-squared annual return)'
              BB     LOP    ILI    HEAL    QUI     AUA
         BB  0.032  0.005  0.030  -0.031  -0.027  0.010
        LOP  0.005   0.1   0.085  -0.07   -0.05   0.020
        ILI  0.030  0.085  0.333  -0.11   -0.02   0.042
       HEAL -0.031  -0.07  -0.11  0.125    0.05   -0.060
        QUI -0.027  -0.05  -0.02  0.05     0.065  -0.020
        AUA  0.010  0.020  0.042  -0.060  -0.020   0.08
;

Variable
   x(i)     'fraction of portfolio invested in asset i'
   variance 'variance of portfolio';

Positive Variable x;

Equation
   propSum     'proportion of the stocks must add up to 1.0'
   portMean    'expression for mean of the portfolio'
   portVar     'expression for variance of the portfolio';

propSum..  sum(i, x(i))                    =e= 1.0;
portMean.. sum(i, mean(i)*x(i))            =e= objective;
portVar..  sum(i, x(i)*sum(j,v(i,j)*x(j))) =e= variance;

Model portfolio / propSum, portMean, portVar /;

solve portfolio using nlp minimizing variance;

