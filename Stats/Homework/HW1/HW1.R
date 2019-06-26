#SMU = c(34, 1200, 23, 50, 60, 50, 0, 0, 30, 89, 0, 300, 400, 20, 10, 0)
#Seattle = c(20, 10, 5, 0, 30, 50, 0, 100, 110, 0, 40, 10, 3, 0)
#hist(SMU)
#hist(Seattle)


cash <- read.table(file = "~/Documents/SMU/Stats/Homework/cash.csv",header = T,sep = ","); # This reads it in if you directory is set to the right folder.



#creativity <- read.table(file = "creativity.csv",header = T,sep = ","); # This reads it in if you directory is set to the right folder.

cash_data = data.frame(cash);
t.test(cash_data$balance ~ cash_data$school);

number_of_permutations = 10000;
xbarholder = c();
counter = 0;
observed_diff = mean(subset(cash_data, school == "SMU")$balance)-mean(subset(cash_data, school == "Seattle")$balance);

for(i in 1:number_of_permutations)
{
  scramble = sample(cash_data$balance,30);
  extrinsic = scramble[1:16];
  intrinsic = scramble[17:30];
  diff = mean(intrinsic)-mean(extrinsic);
  xbarholder[i] = diff;
  if(diff > observed_diff)
    counter = counter + 1;
  
}
hist(xbarholder);
pvalue = counter / number_of_permutations;





