data working;
set work.glucose;
logX4 = log(X4);
logX16 = log(X16);
logX17 = log(X17);
logX28 = log(X28);
logX29 = log(X29);

*female is ref;
select(Gender);
	when('M')do;
	   GenderMale = 1;
	   GenderFemale = 0;
	   X10_M = X10;
	   X10_F = 0;
	 end;
	 otherwise do;
	 GenderMale = 0;
	 GenderFemale = 0;
	 X10_M = 0;
	 X10_F = 0;
	 end;
end;
*race1 is REF;
select(Race);
	when(2)do;
	   Race1 = 0;
	   Race2 = 1;
	   Race3 = 0;
	   Race4 = 0;
	   Race5 = 0;
	   Race1_X10 = 0;
	   Race2_X10 = X10;
	   Race3_X10 = 0;
	   Race4_X10 = 0;
	   Race5_X10 = 0;
	 end;
	 when(3)do;
	   Race1 = 0;
	   Race2 = 0;
	   Race3 = 1;
	   Race4 = 0;
	   Race5 = 0;
	   Race1_X10 = 0;
	   Race2_X10 = 0;
	   Race3_X10 = X10;
	   Race4_X10 = 0;
	   Race5_X10 = 0;
	 end;
	 when(4)do;
	   Race1 = 0;
	   Race2 = 0;
	   Race3 = 0;
	   Race4 = 1;
	   Race5 = 0;
	   Race1_X10 = 0;
	   Race2_X10 = 0;
	   Race3_X10 = 0;
	   Race4_X10 = X10;
	   Race5_X10 = 0;
end;
	 when(5)do;
	   Race1 = 0;
	   Race2 = 0;
	   Race3 = 0;
	   Race4 = 0;
	   Race5 = 1;
	 end;
	 otherwise do;
	 Race1 = 0;
	 Race2 = 0;
	 Race3 = 0;
	 Race4 = 0;
	 Race5 = 0;
	 Race1_X10 = 0;
	 Race2_X10 = 0;
	 Race3_X10 = 0;
	 Race4_X10 = 0;
	 Race5_X10 = 0;
	 end;
end;
run;

*part a - fit linear model on X10;
proc reg data=working plots=ALL;
model Glucose = X10 / influence adjrsq cli ;
run;


data alpha_summary alpha k bon_f_alpha t_crit norm_crit;
df = 1;
alpha = 0.05;
k = 3;
bon_f_alpha = alpha/k;
t_crit = quantile('T', alpha, df);
norm_crit = quantile('normal', alpha, df);
run;

proc univariate data = working;
var Glucose X10;
histogram Glucose X10;
qqplot Glucose X10 / normal(mu=est sigma=est);
title 'Histograms and QQ Plots to address Normality';
run;

proc univariate data = working;
class Gender;
var Glucose X10;
histogram Glucose X10;
qqplot Glucose X10 / normal(mu=est sigma=est);
title 'Histograms and QQ Plots to address Normality By Gender';
run;

proc univariate data = working;
class Race;
var Glucose X10;
histogram Glucose X10;
qqplot Glucose X10 / normal(mu=est sigma=est);
title 'Histograms and QQ Plots to address Normality By Gender';
run;
	

title 'One Way ANOVA - BF Adjusted';
proc glm data=working ORDER=DATA;
class Gender;
model  Glucose=Gender;
means Gender/ hovtest=bf bon cldiff;
means Gender/ hovtest=levene;
lsmeans Gender/adjust=BON pdiff;
lsmeans Gender/pdiff;
run;

*by male/female split;

proc univariate data=working robustscale plot;
by Gender;
var Glucose; 
title 'Glucose by Gender';
run;


proc univariate data=working robustscale plot;
by Race;
var Glucose X10; 
title 'Glucose by Race';
run;


** scatter matrix for multiple regressors;
proc sgscatter data=working;
matrix Glucose X10;
title 'Scatter Matrix for Regressors';
run;


** scatter matrix for multiple regressors;
proc sgscatter data=working;
matrix Glucose X10 GenderMale GenderFemale;
title 'Scatter Matrix for Regressors';
run;

** scatter matrix for multiple regressors;
proc sgscatter data=working;
compare x=X10 y=Glucose / group=Race;
title 'Scatter Matrix for Regressors';
run;

proc reg data=working plots(label)=(all);
model Glucose = X10
			/ influence 
			adjrsq 
			press;
run;

*no interaction;
proc reg data=working plots(label)=(all);
model Glucose = X10 GenderMale GenderFemale
			/ influence 
			adjrsq 
			press;
run;

*interaction;
proc reg data=working plots(label)=(all);
model Glucose = X10 GenderMale GenderFemale X10_M X10_F
			/ influence 
			adjrsq 
			press;
run;

proc glm data=working plots=ALL;
*class Gender(REF="F");
model Glucose = X10 / solution clparm; 
run;

proc glm data=working plots=ALL;
model Glucose = X10 / solution clparm; 
run;

*interaction;
proc glm data=working;
class Gender(REF="F");
model Glucose = X10 | Gender / solution clparm; 
run;


*interaction;
proc glm data=working;
class Race(REF="1");
model Glucose = X10 | Race / solution clparm; 
run;

*no interaction;
proc glm data=working;
class Race(REF="1");
model Glucose = X10 Race / solution clparm; 
run;



 
 
 ** scatter matrix for multiple regressors;
proc sgscatter data=working;
matrix Glucose X10 logX4 X16 X17 X28 X29;
title 'Scatter Matrix for Regressors';
run;

