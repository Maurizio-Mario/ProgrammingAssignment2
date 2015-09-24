# If I got it right, this assignment focuses on environments. 
# Encapsulated functions work as nested environments (think about
# set theory) where the main function operates as parent environment
# for the functions it includes. The <<- assignment operator could,
# random exempli gratia, assign a value from a child environment 
# to the parent environment.

# NOTE: due to small monitor, a couple of commands run on two lines,
# you will see by the indentations. R automatically recognizes 
# multilines commands. Python, e.g., does not! 

# Sorry for the long post, and thank you for your evaluation!


# First (fun)ction and parent (env)ironment of the next funs
makeCacheMatrix <- function(x = matrix()) {
        invs <<- NULL           # Empty object, it will host the inverse
        set <- function(y) {    # Fun eventually changing x content in            
                x <<- y         # the first fun/parent environment            
                invs <<- NULL
        }
        get <- function() x                # Reports the value of x
        set_solve <<- function
             (inverse) invs <<- inverse    # Sets the inverse!
        get_solve <<- function() invs      # Reports the value of the inverse               
        list(get = get, set = set,         # List of the functions IN makeCacheMatrix
             set_solve = set_solve, get_solve = get_solve)     
        
}



# This second function check if the inverse was already computed.
#

cacheSolve <- function(x, ...) {
        ## Return the matrix that is the inverse of 'x'
        invs <- x$get_solve()    # changes the content of "invs"
        if(!is.null(invs))    {  # checkes if "invs" changed, and eventually
                message("getting cached data")  # chooses an option
                return(invs)
        }                        # ELSE: the operations the function
        dt <- x$get()            # runs if "invs" actually changed!
        invs <- solve(dt)
        x$set_solve(invs)
        invs
}

# Here is a small test you can run to test the previous functions!
x = matrix(rnorm(16, 4, 4), 4, 4)    # Insert square matrix to run the test!
m = makeCacheMatrix(x)
m$get()

cacheSolve(m)
