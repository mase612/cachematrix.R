## This pair of functions caches the inverse of a matrix 

## This function caches the inverse of an invertible matrix 
##(assuming it will always be invertible)

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL ## inv to store the inverse
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x ##gets the matrix
        setinverse <- function(the.inverse) inv <<- the.inverse
        getinverse <- function() the.inverse
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}
        


## The function below sets calls the cached inverse of the matrix

cacheSolve <- function(x, ...) {
        the.inverse <- x$getinverse()
        if(!is.null(the.inverse)) {
                message("getting cached data")
                return(the.inverse)
        }
        data <- x$get()
        the.inverse <- solve(data, ...)
        x$setinverse(the.inverse)
        the.inverse
}