library(ggplot2)
library(dplyr)
# Example dataset (This is a sample dataset. Replace it with your actual dataset if needed)
house_data <- data.frame(
  price = c(200000, 250000, 300000, 350000, 400000, 450000, 500000, 550000, 600000, 650000),
  size = c(1200, 1500, 1800, 2000, 2500, 2800, 3200, 3500, 4000, 4500),
  location = factor(c("A", "B", "C", "A", "B", "C", "A", "B", "C", "A")),
  age = c(10, 5, 15, 7, 20, 25, 8, 6, 30, 12)
)

str(house_data)
# to consider location for thhe model
house_data <- house_data %>%
  mutate(location = as.factor(location))

#editing the dataframe. One hot encoding is applied to the location variable
house_data <- cbind(house_data, model.matrix(~ location - 1, data = house_data))
head(house_data)

#fitting the model
model = lm(price ~ size + location + age + location,data  = house_data)

summary(model)

#plotting the model
par(mfrow= c(2,2))
plot(model)


#sample data to test the model

new_data <- data.frame(
  size = c(1600, 2200, 3500),
  age = c(5, 10, 15),
  location = factor(c("A", "B", "C"), levels = c("A", "B", "C")) # match factor levels
)

predictions <- predict(model, new_data)
print(predictions)

predictions <- predict(model, new_data)
print(predictions)

ggplot(house_data, aes(x = size, y = price)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  ggtitle("Relationship Between Size and Price")

ggplot(house_data, aes(x = age, y = price)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  ggtitle("Relationship Between Age and Price")

                       