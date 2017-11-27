context("A new version of reorder that uses desc")

test_that("expecataion for success", {

  a <- c("a","b","c","d")
  b <- c("1","2","3","4")
  c <- c("apple","banana","pear")
  e <- 123

  a1 <- new_reorder(factor(a))
  b1 <- new_reorder(factor(b))
  c1 <- new_reorder(factor(c))

  a2 <- c("d","c","b","a")
  b2 <- c("4","3","2","1")
  c2 <- c("pear","banana","apple")

  expect_equal(levels(a1),a2)
  expect_equal(levels(b1),b2)
  expect_equal(levels(c1),c2)
})

test_that("expectation for error", {

  a <- c("a","b","c","d")
  b <- c("1","2","3","4")
  c <- c("apple","banana","pear")
  e <- 123

  #ERROR - not a factor
  expect_error(new_reorder(e))
  expect_error(new_reorder(a))

})
