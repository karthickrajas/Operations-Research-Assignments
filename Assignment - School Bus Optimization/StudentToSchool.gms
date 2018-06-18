$title Transportation of Students to Schools
$onSymXRef
$onSymList
$onUELList
$onUELXRef
$onText
The objective of this model is to encorporate a model that allows us
to distribute Students from 6 different Areas to 3 different school,
subject to certain constraints given in the problem.

Keywords: linear programming, transportation distribution
$offText

Set
   i 'Area Number' / 1*6 /
   j 'School Number'           / 1*3 /
   k 'Grade of the Student'   / 6*8 /;

Parameter
   n(i) 'Number of Students to be transported from Area i'
        / 1    450
          2    600
          3    550
          4    350
          5    500
          6    450  /

   cap(j) 'Maximum Capacity of School j'
        / 1     900
          2     1100
          3     1000 /;



Table p(i,k) 'Percentage of Students in Area i that are in Grade k'
          6      7      8
   1     0.32   0.38   0.30
   2     0.37   0.28   0.35
   3     0.30   0.32   0.38
   4     0.28   0.40   0.32
   5     0.39   0.34   0.27
   6     0.34   0.28   0.38              ;

Table c(i,j) 'Annual Bussing Cost per student that are in Area i transported to School j in Dollars'
          1      2      3
   1     300     0     700
   2            400    500
   3     600    300    200
   4     200    500
   5      0            400
   6     500    300     0              ;


Variables
     x(i,j)  'Number of Students from Area i transported to School j'
     z       'Total transportation cost for moving all the students' ;
positive variables x ;

Equation
   cost      'Definition of Objective function'
   allotall(i) 'Allotting each Student a school j in Area i'
   capacity(j) 'Capacity limit of School j'
   percentone(k,j) 'Percentage constraint on each Grade having less than 36 percent'
   percenttwo(k,j) 'Percentage constraint on each Grade having greater than 30 percent';

cost..      z =e= sum((i,j), c(i,j)*x(i,j));

allotall(i).. sum(j, x(i,j)) =e= n(i) ;

capacity(j).. sum(i, x(i,j)) =L= cap(j)  ;

percentone(k,j).. sum(i, x(i,j)*p(i,k)) =L= 0.36*sum(i, x(i,j)) ;

percenttwo(k,j).. sum(i, x(i,j)*p(i,k)) =G= 0.30*sum(i, x(i,j));

Model schooltransport /all/ ;

Solve schooltransport using LP minimizing z ;
