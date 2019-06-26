                                                                                                                                                                                                                             
data cash;                                                                                                                           
input school balance;   /* 1 is extrinsic and 0 in intrinsic*/                                                                                                                                                                                                     
datalines;                                                                                                                                                                                                                   
1 34 
1 1200 
1 23 
1 50 
1 60 
1 50
1 0
1 0
1 30
1 89
1 0
1 300
1 400
1 20
1 10
1 0
2 20 
2 10
2 25
2 0
2 30
2 50
2 0
2 100
2 110
2 0
2 40
2 10
2 3 
2 0
;                                                                                                                                                                                                                            
                                                                                                                                                                                                                             
* To get the observed difference;                                                                                                                                                                                            
proc ttest data=cash;  * You will need to change the dataset name here.;                                                                                                                                                     
                                                                                                                                                                                                                             
   class school;    *and change the class variable to match yours here;                                                                                                                                                  
                                                                                                                                                                                                                             
   var balance;          * and change the var name here.;                                                                                                                                                                      
                                                                                                                                                                                                                             
run;                                                                                                                                                                                                                         

ods output off;
ods exclude all;
                                                                                                                                                                                                                         
*borrowed code from internet ... randomizes observations and creates a matrix ... one row per randomization ;                                                                                                                
proc iml;                                                                                                                                                                                                                    
use cash;                        * change data set name here to match your data set name above;                                                                                                                              
read all var{school balance} into x;   *change varibale names here ... make sure it is class then var ... in that order.;                                                                                                  
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
if abs(mean) >= 113.2;   *you will need to put the observed difference you got from t test above here.  note if you have a one or two tailed test.;                                                                           
run;                                                                                                                                                                                                                         
* just a visual of the rows produced ... you can get the number of obersvations from the last data step and the Log window.;                                                                                                 
proc print data = numdiffs;                                                                                                                                                                                                  
where method = "Pooled";                                                                                                                                                                                                     
run;                                                                                                                                                                                                                         
                                                                                                                                                                                                                             
                                                                                                                                                                                                                             
*Idea from http://sas-and-r.blogspot.com/2011/10/example-912-simpler-ways-to-carry-out.html ;                                                                                                                                
                              