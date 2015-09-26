## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
set <- function(y) {
  x <<- y
  m <<- NULL
}
get <- function() x
setinv <- function(solve) m <<- solve
getinv <- function() m
list(set = set, get = get,
     setinv = setinv,
     getinv = getinv)

}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ptm <- proc.time()
  m <- x$getinv()             
  if(!is.null(m)) {
    message("getting cached data")
    cat("Process Time", proc.time() - ptm)
    return(m)
  }
  mydata <- x$get()
  m <- solve(mydata, ...)
  x$setinv(m)
  cat("Process Time", proc.time() - ptm)
  m} 

