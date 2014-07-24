## R Programming Assignment 2
## Cacheing the inverse of a matrix

## Create a functtion that wraps a in closure with
## a list of functions that mutate both the matrix
## and a cached inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  # Wrap a matrix in order to cache the value of its inverse
  #
  # Args:
  #   x: the matrix to wrap, defaults to the empty matrix
  #
  # Returns:
  #   A list of accessor and mutator functions for the
  #   matrix and its inverse

  # initialize the inverse as NULL, aka yet unknown
  inv <- NULL

  set <- function(y) {
    # (Re)set the matrix
    #
    # Args:
    #   y: the new matrix to hold
    # Returns:
    #   NULL

    # Reset both the matrix x and its inverse inv
    x <<- y
    inv <<- NULL
  }

  get <- function() {
    # Get the current matrix
    #
    # Args:
    #   None
    #
    # Returns:
    #  the current matrix
    x
  }

  setinverse <- function(inverse) {
    # Sets the inverse of the matrix
    #
    # Note this caches a value computed elsewhere
    #
    # Args:
    #   inverse: the inverse matrix of x
    #
    # Returns:
    #   the value of inverse argument

    # store away a copy of the inverse
    inv <<- inverse
  }

  getinverse <- function() {
    # Get the cached inverse matrix
    #
    # Args:
    #  None
    #
    # Returns:
    #  The cached value of the inverse matrix

    # fetch the inverse
    inv
  }

  # return a list of the above functions
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


# Solve for the inverse of a matrix, but
# using a makeCacheMatrix wrapper to cache the results

cacheSolve <- function(x, ...) {
  # Return a matrix that is the inverse of x
  #
  # Args:
  #  x: matrix to invert, wrapped in a makeCacheMatrix
  #  ...: Additional argument to pass to solve()
  #
  # Returns:
  #  invese matrix of x

  # Try just pulling out a cached result
  inv <- x$getinverse()
  # if we got it just return it
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }

  # otherwise, really do the work

  # grab the actual matrix
  m <- x$get()
  # compute its inverse
  inv <- solve(m, ...)
  # cache the result
  x$setinverse(inv)
  # and return the value we computed
  inv
}
