## The below pair of functions cache the inverse of a matrix. 

## This function creates a list containing a function to set the value of the vector, get the value of the vector, set the value of the mean, get the value of the mean
makeCacheMatrix <- function(x = matrix()) {
   inv <- NULL
   set <- function(y) {
        x <<- y
        inv <<- NULL
        }
   get <- function() x
   setinverse <- function(inverse) inv <<- inverse
   getinverse <- function() inv
   list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## The following function calculates the inverse of the special "vector" created with the above function. However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation. Otherwise, it calculates the inverse of the matrix and sets the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
   inv <- x$getinverse()
        if(!is.null(inv)) {
        message("getting cached data.")
        return(inv)
        }
   data <- x$get()
   inv <- solve(data)
   x$setinverse(inv)
   inv
}
