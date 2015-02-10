setwd("~/GitHub/ProgrammingAssignment2")

source("cachemean.R")
vec <- makeVector(1:10)
m <- cachemean(vec)
m <- cachemean(vec)

source("cachematrix.R")
mat <- makeCacheMatrix(matrix(rnorm(9), 3, 3))
inv <- cacheSolve(mat)
inv <- cacheSolve(mat)
