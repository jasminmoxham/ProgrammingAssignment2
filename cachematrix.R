## Put comments here that give an overall description of what your
## functions do

## x is matrix
## get the matrix, set the inverse of the matrix, and get the inverse of the matrix and have the inverse matrix hang out in memory

makeCacheMatrix <- function(x = matrix()) {
     m <- NULL
     set <- function(y) {
          x <<- y
          m <<- NULL
       }
     get <- function() x
     setinverse <- function(solve) m <<- solve
     getinverse <- function() m
     list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


##grab the inverse matrix from memory, if the inverse has been calculated then skip it, if it hasn't then calculate it
##sets value to setinverse fucntion

cachedSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
