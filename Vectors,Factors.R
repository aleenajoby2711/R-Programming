#Name: ALEENA JOBY
#Register No: 22122303
#Date:- 28/01/2023
#Lab 2: R programming – Matrices and Factors

#QUESTION 1. Create the three vector a,b,c with three integers each
#ANSWER:- 
a<-c(1,2,3) # Create a vector a
b<-c(4,5,6) # Create a vector b
c<-c(7,8,9) # Create a vector c

#QUESTION 2. Combine three vectors to form a 3x3 matrix where each column represents a vector and print it.
#ANSWER:- 
r<-cbind(a,b,c)           # Create a matrix r with three vectors
print("Printing a,b,c")
print(r)

#QUESTION 3. Create a matrix from the given list of vectors
#ANSWER:-
x <- c(21:24)                         # Defining multiple vectors
y <- c(41:44)
z <- c(61:64)
m <- matrix(c(x, y, z), ncol = 3)     # Creating matrix
print(m)                              # print matrix


#QUESTION 4. Concatenate the two given matrices of same column but different rows
#ANSWER:-
mat1 <- matrix(1:12, ncol = 3)       # Create first example matrix
mat2 <- matrix(21:35, ncol = 3)      # Create second example matrix
                               
result_matrix <- rbind(mat1, mat2)   # Concatenate the two matrices by adding the rows
print(result_matrix)                 # Display the resulting matrix

#QUESTION 5. Create a matrix with 4 rows for 1 to 16 and find the index of maximum and minimum value in matrix
#ANSWER:-

matrix <- matrix(1:16, nrow = 4)   # Defining a sample matrix

# Find the index of the maximum value
which(matrix == max(matrix), arr.ind = TRUE)

# Find the index of the minimum value
which(matrix == min(matrix), arr.ind = TRUE)

#QUESTION 6. Find the labels(name of the factor)
#v-c(1,2,3,3,NA,4,5,NA,5)
#ANSWER:-

# Create a vector
v <- c(1, 2, 3, 3, NA, 4, 5, NA, 5)

# Convert vector to a factor
v_factor <- factor(v)

# Retrieve the levels (or labels) of the factor
levels(v_factor)

#QUESTION 7. Create a ordered factor for the names of the weekdays for two weeks
#ANSWER:-

# Creates a vector of the names of the weekdays
weekdays <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
weekdays_two_weeks <- rep(weekdays, 2) #  Create a vector of the weekdays for two weeks
weekdays_factor <- factor(weekdays_two_weeks, levels = weekdays, ordered = TRUE) #Ordered factor with the levels set to the weekdays vector and the values set to the weekdays_two_weeks vector
weekdays_factor

#QUESTION 8. Concatenate two factors in a single factor.

#ANSWER:-
# Create two factors
factor1 <- factor(c(LETTERS[1:4]))
factor2 <- factor(c(LETTERS[3:7]))

# Concatenate the two factors into a single vector
combined_vector <- c(factor1, factor2)

# Convert the vector back into a factor
combined_factor <- as.factor(combined_vector)

# Print the combined factor
print(combined_factor)
