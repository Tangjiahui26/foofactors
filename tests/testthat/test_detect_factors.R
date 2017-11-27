context("Detect factor that should be character")

test_that("detect_factors determines if # unique values = length",{

  a <- factor(c("a","b","c","d"))
  b <- factor(c("apple","banana","pear"))
  c <- factor(c("a","b","b"))
  d <- factor(c("apple","banana","pear","apple"))
  e <- c("apple")
  f <- 123

  expect_identical(detect_factors(a), FALSE)
  expect_identical(detect_factors(b), FALSE)
  expect_identical(detect_factors(c), TRUE)
  expect_identical(detect_factors(d), TRUE)

  #ERROR - not a factor
  expect_error(detect_factors(e))
  expect_error(detect_factors(f))
})
