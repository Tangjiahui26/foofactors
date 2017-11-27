context("Check a dataframe for factors")

test_that("check if your dataframe contains any factors you don't want to use.", {
  a <- check_factors(iris)#Have factors: "Species"
  b <- check_factors(mtcars) #Expect no factors
  c <- c('a','b','c','d')

  a1 <- c("Species")

  expect_true(length(a) > 0)
  expect_false(length(b) > 0)
  expect_identical(a, a1)
  expect_error(check_factors(c))
})
