context("Make a frequency table for a factor")

test_that("Does it create accurate frequencies", {

  cars_tibble <- freq_out(factor(mtcars$cyl))
  iris_tibble <- freq_out(factor(iris$Species))

  expect_equal(cars_tibble$n, c(11,7,14))
  expect_equal(iris_tibble$n, c(50,50,50))

  #ERROR - not a factor
  expect_error(freq_out(mtcars))
})
