Mall_Customers
# Load necessary libraries
Mall_Customers


# Get summary of the dataset
summary(Mall_Customers)

# Check for missing values
sum(is.na(Mall_Customers))

# Replace missing values with mean
Mall_Customers[is.na(Mall_Customers)] <- sapply(Mall_Customers[is.na(Mall_Customers)], function(x) mean(x, na.rm = TRUE))

# Add monthly income as a new variable
Mall_Customers$Monthly_Income <- Mall_Customers$"Annual.Income..k.."/12
Mall_Customers

# Find number of females in the dataset
num_females <- sum(Mall_Customers$Genre == "Female")
print(paste0("Number of females: ", num_females))

# Visualize 
library(ggplot2)
# Age Distribution
ggplot(Mall_Customers, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "#FF7F0E", color = "white") +
  labs(title = "Age Distribution", x = "Age", y = "Count")
# The histogram shows that the majority of customers are in their 20s and 30s, with the number of customers decreasing as age increases.

# Gender Distribution
ggplot(Mall_Customers, aes(x = Genre, fill = Genre)) +
  geom_bar() +
  labs(title = "Gender Distribution", x = "Gender", y = "Count") +
  scale_fill_manual(values = c("#CC79A7", "#000000"))
# We can draw from the visualization is that there are more female customers than male customers in the dataset.

# Age and Gender Distribution
ggplot(Mall_Customers, aes(x = Age, fill = Genre)) +
  geom_histogram(binwidth = 5, position = "dodge", alpha = 0.8) +
  labs(title = "Age and Gender Distribution", x = "Age", y = "Count") +
  scale_fill_manual(values = c("#CC79A7", "#000000"))
#The visualization shows the distribution of age for males and females separately. 
#From this plot, we can see that the number of female customers is higher than the number of male customers for ages between 20 and 50. 
#Additionally, there are more male customers than female customers in the older age group (50-70).

# Age and Income Distribution
ggplot(Mall_Customers, aes(x = Annual.Income..k.., fill = Genre)) +
  geom_density(alpha = 0.5) +
  labs(title = "Density Plot of Income by Gender", x = "Annual Income (k$)", y = "Density") +
  scale_fill_manual(values = c("#CC79A7",  "#000000"))
#The code produces a density plot of the distribution of Annual Income (in thousands of dollars) by Gender. 
#The plot shows two overlaid density curves, one for each gender, with different colors. The alpha parameter is set to 0.5 to make the curves slightly transparent.
#By looking at the plot, we can see the shape of the distribution of annual income for each gender. 
#The plot can help us identify differences or similarities in the income distributions between men and women in the dataset.

# Income and Spending Score Distribution
ggplot(Mall_Customers, aes(x = `Annual.Income..k..`, y = `Spending.Score..1.100.`)) +
  geom_point(aes(color = Genre), alpha = 0.8) 
  labs(title = "Income and Spending Score Distribution", x = "Annual Income", y = "Spending Score (1-100)") +
  scale_color_manual(values = c("#CC79A7",  "#000000"))
# The code is creating a scatter plot to show the relationship between the annual income and spending score of the mall customers, with points colored by their gender. 
#The plot shows that there is no clear correlation between annual income and spending score, and that there is a relatively even distribution of males and females across the range of income and spending score values.
  
# Find correlation between all variables
correlation_matrix <- cor(Mall_Customers[,c("Age", "Annual.Income..k..", "Spending.Score..1.100.")])
correlation_matrix
#The cor() function calculates the correlation matrix between the variables "Age", "Annual Income (k$)", and "Spending Score (1-100)" from the df dataframe. 
#The resulting correlation_matrix contains the correlation coefficients between all possible pairs of these variables.
#The values of correlation coefficients range from -1 to 1. 
#A coefficient of 1 indicates a perfect positive correlation between two variables, i.e., as one variable increases, 
#the other variable increases proportionally. A coefficient of -1 indicates a perfect negative correlation, i.e., as one variable increases, the other variable decreases proportionally. 
#A coefficient of 0 indicates no correlation between the variables.

# Visualize correlation matrix
levelplot(correlation_matrix, main = "Correlation Matrix", xlab = c("Age", "Annual.Income..k..", "Spending.Score..1.100."), ylab = c("Age", "Annual Income (k$)", "Spending Score (1-100)"), col.regions = colorRampPalette(c("#FFFFFF", "#5DA5DA"))(100))
names(Mall_Customers)
#The code visualizes the correlation matrix of the variables Age, Annual Income, and Spending Score using a level plot. 
#The plot shows the strength and direction of the linear relationship between the variables. 
#We can see that there is a strong negative correlation between Age and Spending Score, indicating that as customers get older, their spending score tends to decrease. 
#There is also a moderate positive correlation between Annual Income and Spending Score, indicating that as customers' annual income increases, their spending score tends to increase. 
#Overall, the plot provides a clear and concise way to interpret the correlation between the variables.
