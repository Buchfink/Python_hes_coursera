## The two functions can make it faster if we need to inverse a matrix more than once in a programm.  
## Once calculated, the inverse is saved and can be read later on instead of being computed. 

## This function creates a special object that can cache matrix inverse and store the matrix to inverse. 
## In oder to save the values "outside the function" a <<- command is used. 

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set <- function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() x
  setinverse <- function(inverse)
    m<<-inverse
  getinverse <- function() m
  list(set=set, get=get, setinverse = setinverse, getinverse = getinverse)
  
}


## This function returns the inverse of the matrix which is stored in cache. 
## (This implies the initial matrix shouldn't been changed.)
## In case the inverse has already been computed and stored in cache (x$getinverse it is not NULL), 
## the function just reads the value, returns it and quits informing that the inverse is from the cache.
## Otherwise (in case there is no inverse stored (x$getinverse is NULL)) the inverse is computed
## and written into the cache. 


cacheSolve <- function(x, ...) {
  m <- x$getinverse()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    } 
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
  }

