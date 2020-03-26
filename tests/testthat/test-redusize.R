path_in <- "../mandrill.jpg"
path_out <- "../reduced.jpg"

test_that("No images produced", {
  redusize(path_in, path_out, 200, 200)
  expect_true(file.exists(path_out))
}) 
test_that("Yield error when size inputs are greater than the original size", {
  expect_error(redusize(path_in, path_out, 300, 200))
}) # raise error

test_that("New dimensions are not correct", {
  expect_equal(dim(redusize(path_in, path_out, 200, 200)), c(200, 200, 3))
  # width : even, height : even number
})

test_that("New dimensions are not correct", {
  expect_equal(dim(redusize(path_in, path_out, 201, 201)), c(201, 201, 3))
  # width : odd, height : odd number
})
test_that("New dimensions are not correct", {
  expect_equal(dim(redusize(path_in, path_out, 200, 201)), c(200, 201, 3))
  # width : even, height : odd number
})

test_that("New dimensions are not correct", {
  expect_equal(dim(redusize(path_in, path_out, 201, 200)), c(201, 200, 3))
  # width : odd, height : odd number
})

test_that("New dimensions are not correct", {
  expect_equal(dim(redusize(path_in, path_out, 15, 10)), c(15, 10, 3))
  # very small image
})
