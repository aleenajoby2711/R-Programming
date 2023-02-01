#Name: ALEENA JOBY
#Register No: 22122303
#Date:- 21/01/2023
#Lab based on vector and list
#QUESTION 1. What is a vector? How to create it? 
#Create a vector A of elements 5,2,-2,6,7,10,12,14,15 and from it create a vector Y containing elements of A>6
#ANSWER:- 
#A vector is a sequence of data elements of the same type. Vectors are the most basic R data objects and there are six types of atomic vectors. They are logical, integer, double, complex, character and raw. Members in the vector are called components. In DataFrame, each column is considered a vector.
#In R, we c() function is used to create a vector. This function returns a one-dimensional array or simply vector. c()
A<-c(5,2,-2,6,7,10,12,14,15) #Create a Vector
Y<-A[A>6] #Create another vector
Y

#QUESTION 2. Given two vectors : X <- c(3, 2, 4) and Y <- c(1, 2).
#Create Vector Z as multiplication of two vectors X and Y
#ANSWER:-
X <- c(3, 2, 4)
Y <- c(1, 2, 0)
Z <- X*Y
Z

#QUESTION 3. Create the following vectors in R.
#a = (5, 10, 15, 20, ..., 50) b = (5,4,3,2,1)
#Use vector arithmetic to multiply these vectors and call the result ‘d’. Select subsets of d to identify the following.
# i. What are the 19th, 20th, and 21st elements of d?
# ii. What are all of the elements of d which are less than 100?
# iii. How many elements of d are greater than 50?
#ANSWER:-
a<-seq(from=5,to=50,by=5) ## Create a vector a
a
length(a)
b<-seq(from=5,to=1,by=-1)
b
length(b)
d<-a*b # Use vector arithmetic to multiply these vectors and call the result ‘d’.
d
d[19:21] #What are the 19th, 20th, and 21st elements of d?
r<-d<100 #What are all of the elements of d which are less than 100?
d[r]
s<-d>50 ## How many elements of d are greater than 50?
length(d[s])

#QUESTION 4. Create a vector with some of your friend’s names
# i. Get the length of vector
# ii. Get the first two friends from vector
# iii. Get the 2nd and 3rd friends
# iv. Sort your friends by names
#ANSWER:- 
n<-c("Kathy","Vandy","Neri","AditiCR","Bindi") # Create a vector with some of your friend's names
length(n) 
n[1:2] # Get the first two friends from above vector
n[3:4] # Get the 2nd and 3rd friends
sort(n) #Sort your friends by names

#QUESTION 5. Create three vectors x,y,z with integers and each vector has 3 elements. Combine the three vectors to become a 3×3 array A where each column represents a vector. Change the row names to a,b,c.
#ANSWER:-
x<-c(1,2,3) # Create a vector x
y<-c(4,5,6) # Create a vector y
z<-c(7,8,9) # Create a vector z
A<-array(c(x,y,z),dim=c(3,3,2)) # Create a matrix A with three vectors
A # check the class of  A.
rownames(A)<-c("a","b","c") # Change the rownames of A
A