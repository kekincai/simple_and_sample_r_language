nth <- function(d, i, ...) {
    # get the nth element of vector
    # @param d vector
    # @param i index
    # @param ... can be pass to [] fucntion. see details please check ?`[`
    stopifnot(is.vector(d))
    `[`(d, i, ...)
}
if (FALSE) {
    source("lib/nth.r")
    d <- 1:10
    nth(d, 5)
}
