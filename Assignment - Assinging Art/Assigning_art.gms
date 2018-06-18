$title Assigning Art OR Assignment 2 Section A
$onSymXRef
$onSymList
$onUELList
$onUELXRef
$onText

Assigning Art Problem.


$offText

Set
   s 'Artist' / a,b,c,d,e,f,g,h,i,j,k,l,m /
   t 'Title'           / 1,2,3,4 /     ;



Variables
     y(s,t)  'Whether artwork t by artist s is selected'
     z       'Total Number of artwork to be displayed' ;
binary variables y;

Equation
   artWorks      'Objective function'
   collage 'Collage related requirement'
   meshReq 'Mesh related requirement'
   realistic 'realistic paintings related requirement'
   cubist 'cubist paintings related requirement'
   expressionist 'Expressionist paintings related requirement'
   water 'Water paintings related requirement'
   oil 'Oil paintings related requirement'
   paintSculpture 'paintings to sculpture ratio related requirement'
   abct1 'ABCT constraint painting 1'
   abct2 'ABCT constraint painting 2'
   abf1 'ABF constraint 1'
   abf2 'ABF constraint 2'
   abf3 'ABF constraint 3'
   ziggy 'Ziggy  constraint'
   criticism 'Celeste criticism'
   env 'Celeste Environment'
   native 'Celeste Native paintings'
   science 'Celeste Science related paintings'
   narcissim 'Celeste Narcissism related paintings'
   sculpt  'number of sculptures'
   space 'number of artworks'
   cost 'Total cost of artwork display ';

artWorks..      z =e= y('a','1') + y('a','2') + y('a','3') + y('b','1') + y('b','2') + y('b','3') + y('b','4') + y('c','1') + y('c','2') + y('d','1') + y('d','2') + y('e','1') + y('e','2') + y('f','1') + y('f','2') + y('g','1') + y('g','2') + y('g','3') + y('h','1') + y('h','2') + y('h','3') + y('i','1') + y('i','2') + y('j','1') + y('j','2') + y('j','3') + y('k','1') + y('k','2') + y('l','1') + y('l','2') + y('m','1') + y('m','2') + y('m','3') + y('m','4');

collage.. y('c','2')+y('g','1')+y('l','1')+y('l','2') =e= 1 ;

meshReq.. y('b','1')+y('b','2') =L= y('a','1')+y('a','2')+y('a','3')  ;

realistic.. y('f','1')+y('f','2')+y('h','1') =G= 1 ;

cubist.. y('h','2')+y('k','1')+y('k','2') =G= 1 ;

expressionist.. y('h','3') =G= 1 ;

water.. y('d','1')+y('d','2')+y('m','1')+y('m','2')+y('m','3')+y('m','4') =G= 1 ;

oil.. y('e','1')+y('e','2')+y('i','1')+y('i','2')+y('j','3') =G= 1 ;

paintSculpture.. y('d','1')+y('d','2')+y('e','1')+y('e','2')+y('f','1')+y('f','2')+y('h','1')+y('h','2')+y('h','3')+y('i','1')+y('i','2')+y('j','3')+y('k' ,'1') + y('k','2')+y('m' ,'1')+y('m','2')+y('m' ,'3')+ y('m' ,'4') =L= 2*(y('a','1')+y('a' ,'2')+y('a','3')+y('b','1')+y('b' ,'2')+y('b','3')+y('b' ,'4') + y('c','1')+y('c','2')+y('g','1')+y('g' ,'2')+y('g','3')+y('j' ,'1') + y('j','2')+y('l' ,'1') + y('l','2')) ;

abct1.. y('d','1') =e= 1 ;

abct2.. y('d','2') =e= 1 ;

abf1.. y('f','1')+y('f','2') =G= 1;

abf2.. y('h','1')+y('h','2')+y('h','3') =G= 1;

abf3.. y('f','1')+y('f','2') =e= y('h','1')+y('h','2')+y('h','3');

ziggy.. y('l','1') + y('l','2') =L= 1;

criticism.. (y('c','1')+y('c','2')+y('e','1')+y('e','2')+y('f','1')+y('f' ,'2')+y('g','1')+y('g' ,'2')+y('g','3')+y('h','1')+y('h' ,'2')+y('h','3')+y('i' ,'1') + y('i','2')+y('j' ,'1')+y('j','2')+y('j' ,'3')+ y('l' ,'1')+ y('l' ,'2')+ y('m' ,'1')+ y('m' ,'2')+ y('m' ,'3')+ y('m' ,'4'))/2 =L= y('a','1')+y('a' ,'2')+y('a','3')+y('b','1')+y('b' ,'2')+y('b','3')+y('b' ,'4') + y('d','1')+y('d','2')+y('k','1')+y('k' ,'2') ;

env.. y('c','1') + y('c','2') =G= 1;

native.. y('j','1')+y('j','2')+y('j','3') =G= 1;

science.. y('b','1') + y('b','2') + y('i','1') + y('i','2') =G= 1;

narcissim.. y('g','2') =G= y('l','2');

sculpt..  y('a','1')+y('a','2')+y('a','3')+y('c','1')+y('g','2')+y('g','3') =L= 4;

space.. y('b','1')+y('b','2')+y('b','3')+y('b','4')+y('c','2')+y('d' ,'1')+y('d','2')+y('e' ,'1')+y('e','2')+y('f','1')+y('f' ,'2')+y('g','1')+y('h' ,'1') + y('h','2')+y('h' ,'3')+y('i','1')+y('i' ,'2')+ y('j' ,'1')+ y('j' ,'2')+ y('j' ,'3')+ y('k' ,'1')+ y('k' ,'2')+ y('l' ,'1')+ y('l' ,'2')+ y('m' ,'1') +y('m' ,'2')+y('m' ,'3')+y('m' ,'4') =L= 20;

cost.. 300*y('a','1') + 250*y('a','2') + 125*y('a','3') + 400*y('b','1') + 500*y('b','2') + 400*y('b','3') + 550*y('b','4') + 700*y('c','1') + 575*y('c','2') + 200*y('d','1') + 225*y('d','2') + 150*y('e','1') + 150*y('e','2') + 850*y('f','1') + 750*y('f','2') + 400*y('g','1') + 175*y('g','2') + 450*y('g','3') + 500*y('h','1') + 500*y('h','2') + 500*y('h','3') + 650*y('i','1') + 650*y('i','2') + 250*y('j','1') + 350*y('j','2') + 450*y('j','3') + 400*y('k','1') + 400*y('k','2') + 300*y('l','1') + 300*y('l','2') + 50*y('m','1') + 50*y('m','2') + 50*y('m','3') + 50*y('m','4') =L= 4000;


Model assignart /all/ ;

Solve assignart using MIP maximizing z ;
