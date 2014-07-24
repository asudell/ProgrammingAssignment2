#
# Exercise makeCachedMatrix and cacheSolve
#

source("cachematrix.R")
m1 <- matrix(c(1,1,1,3,4,3,3,3,4), nrow=3, ncol=3)
m2 <- matrix(c(1,0,5,2,1,6,3,4,0), nrow=3, ncol=3)

cm <- makeCacheMatrix(m1)
message("original m1 matrix")
m1
message("wrapped matrix should be the same")
cm$get()

message("inverse using solve")
solve(m1)
message("inverse using cacheMatrix should be the same")
cacheSolve(cm)
message("running cacheSolve again should yeid cached results")
cacheSolve(cm)

message("reset matrix to m2")
cm$set(m2)

message("original m2")
m2
message("wrapped matrix should be the same")
cm$get()
message("and cached inverse should be null")
cm$getinverse()

message("inverse using solve")
solve(m2)
message("inverse using cacheMatrix should be the same")
cacheSolve(cm)
message("running cacheSolve again should yeid cached results")
cacheSolve(cm)
