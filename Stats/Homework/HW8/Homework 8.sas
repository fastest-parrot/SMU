*base ball scatter;
proc sgplot data=WORK.baseball;
scatter x=Wins y=Payroll / datalabel=TEAM;
  xaxis grid display=(nolabel);
  yaxis grid; 
run;

*calc pearson correlations;
proc corr data=WORK.baseball;
run;