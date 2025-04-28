library(dplyr)
#this ensures reproducibility
set.seed(123)

# SIMPLE RANDOM SAMPLING

#defining the population size
population_size <- 100

#creating a data frame 
data = data.frame(
  id = 1:population_size,
  value = rnorm(population_size),
  group = sample(c("Male", "Female"), population_size, replace = TRUE)
)
# defining sample size
srs_size <- 10

#sample are generated
simple_random_sample <- sample(data$id, srs_size, replace = FALSE)

#sample are extracted
cat("\n The sample data generated from simple random sampling technique\n")
print(data[data$id %in% simple_random_sample, ])

# SYSTEMATIC RANDOM SAMPLING

#sample size
sys_sample_size <- 10

#calculating k
k<- floor(population_size / sys_sample_size)

#selecting kth random element to begin
first_element <- sample(1:k,1)

#generates sequence of elements from first element to population size incrementing by k
systematic_random_sample <- data$id[seq(first_element, population_size, by = k)]

#extracting the sample
cat("\nThe sample data generated from systematic random sampling technique")
print(data[data$id %in% systematic_random_sample, ])

# STRATIFIED RANDOM SAMPLING
stratified_sample_size <- 3

stratified_random_sample <- data %>%
  group_by(group) %>%
  sample_n(stratified_sample_size)
cat("\nThe sample data generated from stratified random sample")
print(stratified_random_sample)