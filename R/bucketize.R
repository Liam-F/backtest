################################################################################
##
## $Id: bucketize.R 342 2006-10-01 05:02:50Z enos $
##
## Constructs a summary data frame.
##
##
################################################################################

## "x" is a numeric vector; "x.factor" and "y.factor" are two
## different factors for x.  "bucketize" divides the values of "x"
## into rows by "y.factor" and columns by "x.factor", and performs the
## "compute" function for each group.  Returns a two-dimensional array
## of the results, with the levels of "x.factor" and "y.factor" as
## dimnames.

bucketize <- function(x, x.factor, y.factor, compute, ...){

  stopifnot(
            is.numeric(x),
            is.factor(x.factor),
            is.factor(y.factor),
            all.equal(length(x), length(x.factor)),
            all.equal(length(x),length(y.factor)),
            is.function(compute)
            )

  data <- tapply(x, list(y.factor, x.factor), compute, ...)

  invisible(data)
}