# lets try those apply functions with examples from the lectures.
x<- list (a=(1:5), b = rnorm(10))
lapply(x, mean)
sapply(x, mean)
# the random numbers in x will not be regenerated if we call another function on x!!!


y<- list (a=(1:4), b = rnorm(10), c=rnorm(20,1), d= rnorm(100,5))
lapply(y, mean)
sapply(y, mean)

z<-1:4
lapply(z, runif)

lapply(x, runif) # works too, but gives only two vestors, the first one of the length 5 and the second one with 10 numbers from [0,1]

lapply(z, runif) #consequently gives 4 vestors which have length of 4, 10, 20 and 100 elements repectively

lapply(x, runif, max =10)

w<- list(a = matrix(1:4,2,2), b = matrix(1:6, 3 , 2))
lapply(w, function(v) v[,1])

lapply(w, function(v) v[1,]) # provides a list of two vectors each of length 2
sapply(w, function(v) v[1,])  # gives a matrix 2x2 , kindda transposed result of lapply

# let's get the "sapply"matrix out of "lapply"list
cbind(u[[1]],u[[2]])


t <- lapply(w, function(v) v[1:2,]) # provides a list of two matrices each of length 2
s <- sapply(w, function(v) v[1:2,]) # provides a matrix 4x2

# let's get the "sapply"matrix out of "lapply"lis
cbind(as.vector(t[[1]]),as.vector(t[[2]]))


##APPLY
x<-matrix(rnorm(200), 20, 10) # matrix 20 rows 10 columns
apply(x, 2, mean) #по колонкам - 10 средних
apply(x, 1, sum) #по строкам - 20 сумм
apply(x, c(1,2), function(h) {h^5}) #every element power 5
rowSums(x)
rowMeans(x)
colSums(x)
colMeans(x)
apply(x, 1, quantile, probs = c(0.25, 0.75))

a<- array(rnorm(2*2*10), c(2,2,10))
apply(a, c(1,2), mean) # a 2x2 matrix 
rowMeans(a, dims =2) # just the same
colMeans(a, dims=2) # 10 means - mean of all elements for every matrix

##MAPPLY
str(mapply) #function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, 
                                                  #USE.NAMES = TRUE)  

## оба варианта дадут списки в первом 4 единицы, во втрором три двойки и тд
list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
mapply(rep, 1:4, 4:1)

mapply(rep, 1:4, 4) #даст матрицу 4х4

noise <- function(n, mean, sd) {rnorm(n,mean,sd)}
noise(5,1,2) # gives 5 numbers all of N(1,2)
noise(1:5, 1:5,2) # gives still 5 numbers, but with means 1 to 5 respectively
mapply(noise, 1:5,1:5,2) #gives a list 


##TAPPLY

str(tapply)

x<-c(rnorm(10), runif(10), rnorm(10,1))
f<-gl(3,10) # дает уровни от 1 до 3 каждого 10 штук
tapply(x,f,mean) #returns a vector
tapply(x,f,mean, simplify =FALSE) #returns a list
tapply(x,f,range) #returns a matrix, as range has 2 values - min & max


##SPLIT
str(split)
split(x,f) #returns a list

lapply(split(x,f),mean) # same as tapply(x,f,mean, simplify=FALSE)

setwd("C:/Study/Rprog")
dat<-read.csv("hw1_data.csv")
head(dat)
s<-split(dat, dat$Month)
lapply(s, function(f) {colMeans(f[, c("Ozone", "Solar.R", "Wind")])})
sapply(s, function(f) {colMeans(f[, c("Ozone", "Solar.R", "Wind")])})
sapply(s, function(f) {colMeans(f[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE)})

x<-rnorm(10)
f1<-gl(2,5)   #1 1 1 1 1 22222 
f2<-gl(5,2)   #1 1 2 2 3 34455            

interaction(f1,f2) #возвращает 10 значений, склеивает номера из f1 и f2:  1.1 1.1 1.2 1.2 ... 2.5 2.5 б смотрит, есть ли такие номера и сколько их: 1.1 2.1 1.2 2.2 ... 1.5 2.5


split(x, list(f1,f2)) #возвращает список из 10 векторов. Ssame  split(x, interaction(f1,f2), drop=TRUE)
split(x, list(f1,f2), drop=TRUE) #пустые не выдает


#****************************QUIZ 3************************************************#
# There will be an object called 'iris' in your workspace. 
#In this dataset, what is the mean of 'Sepal.Length' for the species virginica?
mean(iris[iris["Species"] == "virginica", "Sepal.Length"], na.rm = TRUE)

#Continuing with the 'iris' dataset from the previous Question, what R code returns 
#a vector of the means of the variables 
#'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width"?
apply(iris[,1:4], 2, mean)
colMeans(iris[1:4])

#How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)?
data(mtcars)
dat<-data.frame(mtcars)
tapply(mtcars$mpg, mtcars$cyl, mean)

#what is the absolute difference between 
#the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?
mean(dat[dat["cyl"] == 4, "hp"], na.rm = TRUE)-mean(dat[dat["cyl"] == 8, "hp"], na.rm = TRUE)

################################Debugging
log(-1)

printmessage <- function(x){
  if(x>0)
    print("x is greater than zero")
  else
    print("x is less than zero")
  invisible(x)  ##prevents auto printing
}
printmessage2 <- function(x){
  if(is.na(x))
    print("x is a missing value!")
  else if(x>0)
    print("x is greater than zero")
  else
    print("x is less than zero")
  invisible(x)  ##prevents auto printing
}

########################TRACEBACK
mean(x)
traceback()

lm(y~x)
traceback()

options(error = recover)
read.csv("nosuchfile")
