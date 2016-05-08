## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        
        #create the inverse variable as null initially
        inverse <- NULL
        
        # store values to matrix
        setMatrix <- function(values) {
                x <<- values
                inverse <<- NULL
        }
        
        # returns the stored value of the matrix
        getMatrix <- function() {
                x
        }
        
        # stor  the given inverse 
        setInverse <- function(solve) {
                inverse <<- solve
        }
        
        # get the stored inverse
        getInverse <- function() {
                inverse
        }
        
        # return a list. Each named element of the list is a function
        list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse, getInverse = getInverse)
}



## Write a short comment describing this function

cacheSolve <- function(y, ...) {
        
        inverse <- y$getInverse()
        
        if(!is.null(inverse)) {
                print("getting cached data")
                return(inverse)
        }
       
        print("nothing found in the cache, calculating fresh inverse value")
        data <- y$getMatrix()
        inverse <- solve(data)
        y$setInverse(inverse)
        
        
        inverse
}
