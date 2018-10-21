#' Building a Model with Top 10 Features
#'
#' This function develops a prediction algorithm base on top 10 features
#' in 'x' that are most predictive of 'y'
#'
#' @param x a n x p matrix of n observations and p predictors
#' @param y a vector of length n representing the response
#' @return a vector of coefficients from the final fitted model with top 10 features
#' @author Juan Beleño
#' @details
#' This function run a univariate regression of 'y' on each predictor in 'x'
#' and calculates de p-value indicating the significance of the association.
#' The final set of 10 predictors is taken from the 10 smallest p-values.
#' @seealso \code{lm}
#' @export
#' @importFrom stats lm

leekasso <- function(x, y) {
  # Number of predictors
  p <- ncol(x)
  if (p < 10)
        stop("There are less than 10 predictors")
  # Empty vector of zeros
  pvalues <- numeric(p)
  for (i in seq_len(p)) {
    fit <- lm(y ~ x[, i])
    summ <- summary(fit)
    pvalues[i] <- summ$coefficients[2, 4]
  }
  # Ordering pvalues indices from the smaller to the largest
  ord <- order(pvalues)
  ord <- ord[1:10]
  # Choosing the top 10 predictors with smaller pvalues
  x10 <- x[, ord]
  fit <- lm(y ~ x10)
  coef(fit)
}

#' Prediction with the Top 10 Features
#'
#' This function takes a set of coefficients produced by the \code{leekasso}
#' function and makes the predictions for each of the values provided in the
#' input 'X' matrix.
#'
#' @param X a n x 10 matrix containing n new observation
#' @param b a vector of coefficients obtained from \code{leekasso} function
#' @return a numeric vector containig the predicted values
#' @export

predict10 <- function(X, b) {
  # Add intercept to the matrix
  X <- cbind(1, X)
  # Matrix multiplication and convert it into a vector of predicted responses
  drop(X %*% b)
}

