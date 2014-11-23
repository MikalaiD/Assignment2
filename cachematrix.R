## The functions are suppose to save time by saving a matrix inverse 
## calculations to cache with the following retriving it from cache when it's
## needed.

## The first function will contain an original matrix inside and is designed
## to cache an inverse matrix after the second function returns(calculates) 
## the inverse it.
## Initially, the inversed matrix is assigned as local variable - Null  
## a possibility of being changed from containg environment (see i<<-minv).    

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        
        get <- function() x
        setinv<-function(minv) i<<-minv
        getinv<-function() i
        list(get=get, set=set, getinv=getinv, setinv=setinv)

}


## This function checks if the previous one already has the inverse matrix
## cached inside. If no (=NULL), then function culculates one and put it 
## inside the first function.

cacheSolve <- function(x, ...) {
        i<-a$getinv()
        if(!is.null(i)){
                message ("Obtained from cache")
                return(i)
        }
        data<-a$get()
        i<-solve(data)
        a$setinv(i)
        i
        
}
