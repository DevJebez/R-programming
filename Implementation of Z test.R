# implementing Z test 

#customer reviews (1- satisfied , 0- unsatisfied)

# null hypothesis : There is significant difference between the proportions 

# to those who wonder, this does not satsify the conditions for Z - test for proportions 
# The conditions are : 
# 1. Population variance should be known
# 2. Large sample size or correct proprtion (pool * n_i >= 5 and ((1-pool) * n_i) >= 5) --> pool is pooled proportion
# 3. Uses standard normal Z 
group_A <- c(1, 1, 0, 1, 0, 1, 1, 0, 1, 0)
group_B <- c(1, 1, 1, 1, 0, 1, 0, 1, 0, 0)

proportion_A <- mean(group_A)
proportion_B <- mean(group_B)

n_A <- length(group_A)
n_B <- length(group_B)

p_pool <- (sum(group_A) + sum(group_B))/(n_A + n_B)

se <- sqrt(p_pool *(1-p_pool) * (1/n_A + 1/n_B))

z_statistic <-  (proportion_A - proportion_B)/se 

p_value <- 2 * pnorm(-abs(z_statistic))

cat("Proportion of satisfied customers in Group A:", proportion_A, "\n")
cat("Proportion of satisfied customers in Group B:", proportion_B, "\n")
cat("Z-statistic:", z_statistic, "\n")
cat("P-value:", p_value, "\n")
if (p_value < 0.05)
{
  cat("Reject the null hypothesis: There is a significant difference between the proportions.\n")
}else {
  cat("Fail to reject the null hypothesis: There is no significant difference between the proportions.\n")
}

