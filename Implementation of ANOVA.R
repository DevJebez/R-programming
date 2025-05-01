# implementation of  way anova

data <- data.frame(
  Department = factor(c("Sales", "HR", "IT", "Marketing", "Sales", "HR", "IT", "Marketing", "Sales", "HR",
                        "IT", "Marketing", "Sales", "HR", "IT", "Marketing", "Sales", "HR", "IT", "Marketing")),
  Performance = c(78, 82, 90, 75, 85, 78, 91, 80, 88, 85,76, 83, 92, 79, 86, 81, 89, 84, 94, 82)
)

str(data)

anova_result <- aov(Performance ~ Department , data = data)

anova_summary <- summary(anova_result)

qqnorm(residuals(anova_result))
qqline(residuals(anova_result), col = "red")

if(!require(car)) install.packages("car", dependencies = TRUE)
library(car)

print(anova_summary)

leveneTest(Performance~Department , data = data)
if(anova_summary[[1]]$`Pr(>F)`[1]<0.05){
  turkey_result = TurkeyHSD(anova_result)
  print(summary(turkey_result))
}else{
  print("No significant differences found , no need for post-hoc tests")
}

boxplot(Performance~Department, data = data,
        main = "Performance Comparision Across Departments",
        xlab = "Departmenet",
        ylab = "Performance",
        col = c("lightblue","lightgreen","lightpink","lightyellow"))