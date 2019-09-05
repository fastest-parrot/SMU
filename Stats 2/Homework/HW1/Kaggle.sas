/* Fitting the model with a data set called titanictrain*/

proc print data = titanictrain;
 run;

 proc logistic data = titanictrain;
 class Sex PClass Embarked;
 model survived = Sex PClass Embarked age fare age*Sex;
 output out = predictions predicted = I;
 run;

 proc print data = predictions;
 run;

data finalp;
set predictions;
if I > .5 then survivedp = 0;
if I <= .5 then survivedp = 1;
keep passengerId survivedp;
run;

proc print data = finalp;
run;


/* Assuming we have imported the training.csv file into a data set called titanictraining */
/* and the test.csv file into a dataset called titanictest */
/* This is a very basic model to get us started! We will improve this model in UNIT 11 ! */

data titanic;
set titanictrain titanictest;
run;

proc print data = titanic;
run;


proc logistic data = titanic;
 class Sex PClass Embarked;
 model survived = Sex PClass Embarked age fare age*Sex;
 output out = predictions predicted = I;
 run;

 proc print data = predictions;
 run;

 data finalp;
set predictions;
where passengerId > 891;
if I > .5 then survivedp = 0;
if I <= .5 then survivedp = 1;
keep passengerId survivedp;
rename survivedp=Survived;
run;

proc print data = finalp;
run;
