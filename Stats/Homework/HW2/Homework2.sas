*PROBLEM 1;
data bats;
input bat_size;
datalines;
1.7   
1.6    
1.5    
2.0    
2.3    
1.6    
1.6    
1.8    
1.5    
1.7   
1.2    
1.4    
1.6    
1.6    
1.6
;
data critval;
p = quantile("T", .975, 14)  
;
proc print data = critval;
*run;                                                                                                                                                                                                                                                                                                                                                                                                                     
*two sided t-test;
proc ttest data = bats h0=1.8 sides = 2 alpha =0.05;
*run;


*PROBLEM 2;
data ages;
input fired age;
datalines;
1 34
1 37
1 37
1 38
1 41
1 42
1 43
1 44
1 44 
1 45
1 45
1 45
1 46
1 48
1 49
1 53
1 53
1 54
1 54
1 55
1 56
2 27
2 33
2 36
2 37
2 38
2 38
2 39
2 42
2 42
2 43
2 43
2 44
2 44
2 44
2 45
2 45
2 45
2 45
2 46
2 46
2 47
2 47
2 48
2 48
2 49
2 49
2 51
2 51
2 52
2 54
; 
proc ttest data=ages h0=0.0 sides=2;  * You will need to change the dataset name here.;                                                                                                                                                     
                                                                                                                                                                                                                             
   class fired;    *and change the class variable to match yours here;                                                                                                                                                  
                                                                                                                                                                                                                             
   var age;          * and change the var name here.;                                                                                                                                                                      
                                                                                                                                                                                                                             
run;                                                                                                                                                                                                                         
ods output off;
ods exclude all;
                                                                                                                                                                                                                         
*borrowed code from internet ... randomizes observations and creates a matrix ... one row per randomization ;                                                                                                                
proc iml;                                                                                                                                                                                                                    
use ages;                        * change data set name here to match your data set name above;                                                                                                                              
read all var{fired age} into x;   *change varibale names here ... make sure it is class then var ... in that order.;                                                                                                  
p = t(ranperm(x[,2],1000));    *Note that the "1000" here is the number of permutations. ;                                                                                                                                    
paf = x[,1]||p;                                                                                                                                                                                                              
create newds from paf;                                                                                                                                                                                                       
append from paf;                                                                                                                                                                                                             
quit;                                                                                                                                                                                                                        
                                                                                                                                                                                                                             
*calculates differences and creates a histogram;                                                                                                                                                                             
ods output conflimits=diff;                                                                                                                                                                                                  
proc ttest data=newds plots=none;                                                                                                                                                                                            
  class col1;                                                                                                                                                                                                                
  var col2 - col1001;                                                                                                                                                                                                        
run;                                                                                                                                                                                                                         

ods output on;
ods exclude none;       
                  
proc univariate data=diff;                                                                                                                                                                                                   
  where method = "Pooled";                                                                                                                                                                                                   
  var mean;                                                                                                                                                                                                                  
  histogram mean;                                                                                                                                                                                                            
run;                                                                                                                                                                                                                         
                                                                                                                                                                                  
*The code below calculates the number of randomly generated differences that are as extreme or more extreme thant the one observed (divide this number by 1000 you have the pvalue);                                         
*check the log to see how many observations are in the data set.... divide this by 1000 (or however many permutations you generated) and that is the (one sided)p-value;                                                     
data numdiffs;                                                                                                                                                                                                               
set diff;                                                                                                                                                                                                                    
where method = "Pooled";                                                                                                                                                                                                     
if abs(mean) >= 1.9238;   *you will need to put the observed difference you got from t test above here.  note if you have a one or two tailed test.;                                                                           
run;                                                                                                                                                                                                                         
* just a visual of the rows produced ... you can get the number of obersvations from the last data step and the Log window.;                                                                                                 
proc print data = numdiffs;                                                                                                                                                                                                  
where method = "Pooled";                                                                                                                                                                                                     
run;             



*PROBLEM 4;
proc power;
twosamplemeans test=diff_satt
stddev = 6.1519
power=0.8
meandiff=1.9238
ntotal=.;
plot x=effect min=0.5 max=2;
run; 

proc power;
twosamplemeans test=diff_satt
stddev = 6.1519
power=0.8 0.7 0.6
meandiff=1.9238
ntotal=.;
plot x=effect min=0.5 max=2;
run; 

proc power;
twosamplemeans test=diff_satt
stddev = 6.1519
power=0.8 0.6
meandiff=0.8
ntotal=.;
run; 