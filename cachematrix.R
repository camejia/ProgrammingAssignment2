## Matrix inversion is usually a costly computation and there may be some
## benefit to caching the inverse of a matrix rather than computing it
## repeatedly.

## The makeCacheMatrix function creates a special "matrix" object that can
## cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  # Initialize inv to NULL to indicate it hasn't yet been evaluated
  inv <- NULL
  
  # set the value of the matrix
  set <- function(y) {
    # Note use of "super assignment" operator <<- to define value in parent
    # environment
    x <<- y
    # Set inv back to NULL because it hasn't yet been evaluated for this new
    # matrix
    inv <<- NULL
  }
  
  # get the value of the matrix
  get <- function() x
  
  # set the value of the inverse
  setinverse <- function(inverse) inv <<- inverse
  
  # get the value of the inverse
  getinverse <- function() inv
  
  # return a list of the functions defined above
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## The cacheSolve function computes the inverse of the special "matrix"
## returned by makeCacheMatrix above. If the inverse has already been
## calculated (and the matrix has not changed), then cacheSolve should
## retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  # Check if result has already been cached
  if(!is.null(inv)) {
    # message("getting cached data")
    # Uncomment the message() command above to confirm use of cached result
    return(inv)
  }
  # If result has not been cached, retrieve the matrix..
  data <- x$get()
  # ...and call solve() on the matrix to compute the inverse
  inv <- solve(data, ...)
  # Cache the inverse for future reference
  x$setinverse(inv)
  # Return the inverse
  inv
}
