#1
add2 <- function(x, y){
  x + y
}
cube <- function(x,n){
  x^3
}
#number 27

#2
#x<-1:10
#if(x>5) {
#  x<-0
#}
#x is a vector of length 10 and if can only test... 

#3
f <- function(x) { #3
  g<- function(y) {
    y+z
  }
  z<-4
  x+g(x) # = x+(x+z) :=3+(3+4)
}
z<-10
f(3)
# 10

#4
x<-5
y<- if(x<3){
          NA
} else{
      10
}
#10

#5
h<-function(x,y=NULL, d=3L){
  z<-cbind(x, d)
  if (!is.null(y))
    z <- z+y
  else
    z <- z+f
  g<- x+y/z
  if(d==3L)
    return(g)
  g<-g+10
  g
}