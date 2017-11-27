context("Check a dataframe for factors")

test_that("expectation for true", {
  a <- check_factors(iris)#Have factors: "Species"
  a1 <- c("Species")

  expect_true(length(a) > 0)
  expect_identical(a, a1)
})

test_that("expectation for false", {
  b <- check_factors(mtcars) #Expect no factors

  expect_false(length(b) > 0)
})

test_that("expectation for error", {
  c <- c('a','b','c','d')

  expect_error(check_factors(c))
})
