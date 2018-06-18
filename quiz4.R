set.seed(1) ## fixes the sequence of random variables
rnorm(5) ## [1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078
rnorm(5) ## [1] -0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884
rpois(10,1)
rpois(10,20)

ppois(2,2) ##Cumulative Distribution, mean=2 , P(x<=2)
ppois(4,2) ##Cumulative Distribution, mean=2 , P(x<=4)
ppois(4,2) ##Cumulative Distribution, mean=2 , P(x<=6)

##generating from a Normal LInear model
set.seed(20)
x<-rnorm(100)
e<-rnorm(100,0,2)
y <- 0.5 + 2*x +e
summary(y)

set.seed(10)
x<-rbinom(100, 1, 0.5)
e<-rnorm(100, 0, 2)
y <- 0.5 + 2*x +e
summary(y)

###generalized linear model (Poisson)
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5+0.3*x
y<- rpois(100, exp(log.mu))
summary(y)

plot(y)

####random sampling
set.seed(1)
sample(1:10,4) ###[1] 3 4 5 7
sample(1:10,4) ###[1] 3 9 8 5
sample(letters,5) ###[1] "q" "b" "e" "x" "p"
sample(1:10) ###  [1]  4  7 10  6  9  2  8  3  1  5
sample(1:10) ###  [1]  2  3  4  1  9  5  10 8  6  7
sample(1:10, replace = TRUE)
## [1] 2 9 7 8 2 8 5 9 7 8


system.time(readLines("http://www.jhsph.edu"))

hilbert<-function(n){
  i<-1:n
  1/outer(i-1, i, "+")
}
x<-hilbert(1000)
system.time(svd(x))

system.time(
{
      n<-1000
      r<-numeric(n)
      for (i in 1:n)
      {
          x<-rnorm(n)
          r[i] <- mean(x)
      }
})


## Q-1
## [1] 1 1 2 4 1

## Q-2
## rnorm

##Q-3
##...reproducible

##Q-4
qpois(0.9473,2)

##Q-5 generates data from a Normal linear model
set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2*x + e

#Q-6
rbinom(10,1,0.5)




