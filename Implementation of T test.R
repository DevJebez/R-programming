# implementation of T test
group_A <- c(85,100,90,95,66,25,14,77,99,55)
group_B <- c(78,79,18,81,25,99,78,86,88,96)

t_result <- t.test(group_A, group_B)

cat("T-results:\n")
print(t_result)

if(t_result$p.value < 0.05)
{
  cat("Reject Null hypothesis : There is significant difference between two groups")
  
}else{
  cat("Fail to reject the null hypothesis : There is significant difference between two groups")
} 

cat("\n Additional information :\n")
cat("95 % confidence interval for the difference in means:",t_result$conf.int[1],"to",t_result$conf.int[2],"\n")

cat("Mean of group_A: ",mean(group_A),"\n")
cat("Mean of group_B :",mean(group_B))