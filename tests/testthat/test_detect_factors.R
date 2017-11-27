context("Detect factor that should be character")

test_that("expectation for FALSE",{

  a <- factor(c("a","b","c","d"))
  b <- factor(c("apple","banana","pear"))

  expect_identical(detect_factors(a), FALSE)
  expect_identical(detect_factors(b), FALSE)
})

test_that("expectation for TRUE",{

  c <- factor(c("a","b","b"))
  d <- factor(c("apple","banana","pear","apple"))

  expect_identical(detect_factors(c), TRUE)
  expect_identical(detect_factors(d), TRUE)

})

test_that("expectation for error",{

  e <- c("apple")
  f <- 123

  #ERROR - not a factor
  expect_error(detect_factors(e))
  expect_error(detect_factors(f))
})
