twitch
# Check the structure of the dataset
str(twitch)
# Check for missing values
sum(is.na(twitch))

# Summary statistics
summary(twitch)

# Visualize the distributions of the variables
library(ggplot2)
ggplot(twitch, aes(x = Peak.viewers)) + geom_histogram(binwidth = 1000) + labs(title = "Distribution of Peak Viewers")

ggplot(twitch, aes(x = Average.viewers)) + geom_histogram(binwidth = 1000) + labs(title = "Distribution of Average Viewers")

ggplot(twitch, aes(x = Followers)) + geom_histogram(binwidth = 100000) + labs(title = "Distribution of Followers")

ggplot(twitch, aes(x = Followers.gained)) + geom_histogram(binwidth = 50000) + labs(title = "Distribution of New Followers")

ggplot(twitch, aes(x = Views.gained)) + geom_histogram(binwidth = 1000000) + labs(title = "Distribution of Views Gained")
-----------------------
#Data Manipulation
library(dplyr)
partnered_streamers <- filter(twitch, Partnered == 1) #filtering

sorted_by_followers <- arrange(twitch, desc(Followers)) #Sorting

followers_by_language <- twitch %>% group_by(Language) %>%
summarize(Avg.followers = mean(Followers))  #Grouping

library(dplyr)
joined_data <- left_join(streamer_data, social_media_data, by = "Channel") # add a dataset of streamer data and social media data

dataset <- mutate(twitch, Avg.watch.time.per.viewer = Watch.time.Minutes. / Average.viewers)
dataset #Creating new variables
---------------------------------------
#For univariate analysis, we can use the ggplot2 package to create a histogram with a density curve overlay:
  
library(ggplot2)
ggplot(twitch, aes(x = Average.viewers)) +
  geom_histogram(aes(y=after_stat(density)), bins=30, alpha=0.5, fill="#69b3a2") +
  geom_density(color="#e69f00", linewidth=1.5) +
  labs(title="Distribution of Average Viewers", x="Average Viewers", y="Density")

library(ggplot2)
ggplot(twitch, aes(x = Average.viewers, y = Followers)) +
  geom_point(alpha=0.5, size=2) +
  geom_smooth(method=lm, formula=y~x, se=FALSE, color="#e69f00", size=1.5) +
  labs(title="Relationship between Average Viewers and Followers", x="Average Viewers", y="Followers")
-------------------------------
#Correlation Analysis
  
# Select only numeric columns
numeric_cols <- twitch %>% 
select_if(is.numeric)

# Calculate correlation matrix
cor_mat <- cor(numeric_cols)

# Print correlation matrix
print(cor_mat)
-------------------------------
# Assumptions of the linear regression analysis

# Fit linear regression model to the twitch dataset
model <- lm(Average.viewers ~ Peak.viewers + Followers + Watch.time.Minutes., data = twitch)

# Create diagnostic plots
par(mfrow=c(2,2))
plot(model)

# Analyze the dataset by regression analysis  
  
# Fit linear regression model to the twitch dataset
model <- lm(Average.viewers ~ Peak.viewers + Followers + Watch.time.Minutes., data = twitch)

# Summarize the model
summary(model)

# Machine learning models, such as random forests or neural networks, can be used to identify complex patterns and make predictions based on a range of variables.

# Load the randomForest package
library(randomForest)

# Split the data into training and testing sets
set.seed(123)
train <- twitch[sample(nrow(twitch), 0.7*nrow(twitch)),]
test <- twitch[!(1:nrow(twitch)) %in% (1:nrow(train)),]

# Build a random forest model
rf_model <- randomForest(Peak.viewers ~ Followers + Average.viewers, data = train)
rf_model

# Make predictions on the testing set
rf_pred <- predict(rf_model, test)
rf_pred

# Evaluate the model performance
rf_rmse <- sqrt(mean((test$Peak.viewers - rf_pred)^2))
rf_rmse

---------------------------------------
1#
# Load the plotly library
library(plotly)

# Create an interactive scatter plot
plot_ly(twitch, x = ~Followers, y = ~Average.viewers, color = ~Language, 
        size = ~Peak.viewers, text = ~id) %>%
  layout(title = "Twitch Data", xaxis = list(title = "Followers"), 
         yaxis = list(title = "Average Viewers"))

install.packages("plotly")
names(twitch)
#######
2#
library(treemap)

# Aggregate the data by language
language_counts <- aggregate(twitch$id, by=list(Language=twitch$Language), FUN=length)
names(language_counts) <- c("Language", "Count")

# Create a treemap of the language distribution
treemap(language_counts,
        index = "Language",
        vSize = "Count",
        title = "Language Distribution on Twitch",
        palette = "Dark2")
########
3#
# Load the lattice library
library(lattice)

# Aggregate the data by partner status
partner_counts <- table(twitch$Partner)

# Create a bar plot of the partner status distribution
barchart(partner_counts, main = "Partner Status on Twitch", 
         xlab = "Partner Status", ylab = "Count", col = "blue")
#####
4#
# create density plots of Average.viewers by Partnered status
dplot <- densityplot(~Average.viewers | Partnered, data = twitch,
                     main = "Density of Average Viewers by Partnered Status",
                     xlab = "Average Viewers", ylab = "")

dplot
