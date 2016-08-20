## New matrix structure with cached Matrix inversion

## create a cache matrix

makeCacheMatrix <- function(x = matrix()) {
    m.inversion <- NULL
    set <- function(y) {
          x <<- y
          m.inversion <<- NULL
    }
  get <- function() x
  set.Inversion <- function(m.i) m.inversion <<- m.i
  get.Inversion <- function() m.inversion
  list(set = set, get = get, set.Inversion = set.Inversion, get.Inversion = get.Inversion)
}


## cache matrix inversion

cacheSolve <- function(x, ...) {
    inver <- x$get.Inversion()
    
    if(!is.null(inver))    {
      message("getting cached matrix inversion")
      return (inver)
    }
    
    data <- x$get()
    inver <- solve(data)
    x$set.Inversion(inver)
    inver
}
