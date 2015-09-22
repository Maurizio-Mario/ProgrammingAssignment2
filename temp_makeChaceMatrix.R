
makeCacheMatrix <- function(x = matrix()) { # Main function
        get <- function() x # Report the value of x
        set <- function(y) {  # Eventually change the value of the main function \\\
                x <<- y       # aka the superior environment of set()  
                invs <<- NULL #
        }
        set_solve <<- function(solve) invs <<- solve # How useless is this part??
        get_solve <<- function() invs                # Investigate!
                
        list(get = get, set = set, set_solve = set_solve, get_solve = get_solve)
}

a <- makeCacheMatrix()
a$get()
a$set(matrix(rnorm(16, 8, 4), 4, 4))
a$set_solve(10)
a$get_solve()

