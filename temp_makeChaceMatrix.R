
makeCacheMatrix <- function(x = matrix()) {
        invs <<- NULL
        set <- function(y) {                
                x <<- y                      
                invs <<- NULL
                }
        get <- function() x 
        set_solve <<- function(inverse) invs <<- inverse 
        get_solve <<- function() invs               
        list(get = get, set = set, set_solve = set_solve, get_solve = get_solve)
}


# The second function
cacheSolve <- function(x, ...)    {  # It takes as argument the object where the first is stored
        invs <- x$get_solve()
        if(!is.null(invs))    {
                message("getting cached data")
                return(invs)
        }
        dt <- x$get()
        invs <- solve(dt)
        x$set_solve(invs)
        invs
}

x = matrix(rnorm(10^6, 5^6, 2^6), 1000, 1000)
m = makeCacheMatrix(x)
m$get()

cacheSolve(m)

rm(list = ls())


