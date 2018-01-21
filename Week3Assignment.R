
#This function will take a matrix and inverse

makeCacheMatrix <- function(x = matrix()) {
        inverse_matrix<-NULL
        set <- function(y) {
                x <<- y
                inverse_matrix <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse_fun)inverse_matrix<<-solve(inverse_fun)

        getinverse <- function() inverse_matrix
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## This function will Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- inv(data, ...)
        x$setinverse(m)
        m

}

minverse<-makeCacheMatrix()

x<-matrix(1:4,2,2)

#Get the matrix from the makeCacheMatrix method
minverse$set(x)
minverse$get()

#Return empty for inverse
minverse$getinverse()

#Set the matrix for inverse.
minverse$setinverse(x)
#Get the inverse matrix
minverse$getinverse()


#Get cached data
cacheSolve(minverse)




