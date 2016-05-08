
## this funciton gets inverse, sets inverse, gets matrix, sets matrix. the inverse is cached using the <<- operator

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
        
        # store  the given inverse 
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



## this funciton returns the inverse of the matrix. if the inverse is already present cached, it will provide the same.
## Elsewise, it will compute the inverse newly

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
