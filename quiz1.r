#question 4 = numeric
x<-4
class(x)

#5 = character
#6 2x3

#9
b<-c(1,2,3,4)
a<-2
b+a

#10
vec10 <- c(3,5,1,10,12,6)
vec10[vec10<=5]<-0
vec10

#11, 12
data <- read.csv("hw1_data.csv")
colnames(data)
data[1:2,]

#13  = 153
k<-nrow(data)

#14 18 , 20
data[(k-1):k,]
tail(data, 2)

#15 =21
data[47, "Ozone"]
ozone<-data[,1] #???????????????? ?????????????? ????????
ozone[47] 


#18

