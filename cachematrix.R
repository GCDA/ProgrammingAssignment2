## Put comments here that give an overall description of what your
## functions do

## It has the same structure as the function provided in the example
## because it serves exactly the same purpose

makeCacheMatrix <- function(x = matrix()) {
		
		Minv <-  NULL
		
		setMat <- function(y){
			x <<- y
			Minv <- NULL
		}

		getMat <- function() x

		setInv <- function(m) Minv <<- m

		getInv <- function() Minv
		list(setMat = setMat, getMat = getMat, 
			setInv = setInv, getInv = getInv)
}


## Same structure as before basically changing the calculation:
## inverse matrix instead of mean

cacheSolve <- function(x, ...) {
                Minv <- x$getInv()
        if(!is.null(Minv)) {
                message("getting cached data")
                return(Minv)
        }
        data <- x$getMat()
	  		n = nrow(data)
			m = ncol(data)
			Minv = matrix(,m,n)
			for (i in 1:n){ 
				for (j in 1:m){
					Minv[j,i] <- data[i,j]
				}}
        x$setInv(Minv)
        Minv
}


