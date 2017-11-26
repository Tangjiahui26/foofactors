context("Set levels of a factor to the order appeared in data")

test_that("new_factor returns factors in the order they appear", {

  a <- c("a","b","c","d")
  b <- c("b","c","a","d")
  c <- c("d","c","b","a")
  d <- 123

  a1 <- new_factor(factor(a))
  b1 <- new_factor(factor(b))
  c1 <- new_factor(factor(c))

  expect_equal(levels(a1), a)
  expect_equal(levels(b1), b)
  expect_equal(levels(c1), c)

  expect_error(new_factor(a))
  expect_error(new_factor(d))
})

test_that("new_factor returns factors in the reverse order they appear", {

  a <- c("a","b","c","d")
  b <- c("b","c","a","d")
  c <- c("d","c","b","a")
  d <- 123

  a1 <- c("d","c","b","a")
  b1 <- c("d","a","c","b")
  c1 <- c("a","b","c","d")

  a2 <- new_factor_rev(factor(a))
  b2 <- new_factor_rev(factor(b))
  c2 <- new_factor_rev(factor(c))

  expect_equal(levels(a2), a1)
  expect_equal(levels(b2), b1)
  expect_equal(levels(c2), c1)

  expect_error(new_factor_rev(a))
  expect_error(new_factor_rev(d))
})
