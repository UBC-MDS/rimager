
test_that("Error should be raised. Should not allow size more than the original size", {
  expect_error(redusize("../mandrill.jpg", "../reduced.jpg", 300, 200))
}) # raise error 

test_that("New dimensions are not correct", {
  expect_equal(dim(redusize("../mandrill.jpg", "../reduced.jpg", 200, 200)), c(200, 200,3))
  # width : even, height : even number
  
})

test_that("New dimensions are not correct", {
  expect_equal(dim(redusize("../mandrill.jpg", "../reduced.jpg", 201, 201)), c(201, 201,3))
  # width : odd, height : odd number
  
})
test_that("New dimensions are not correct", {
  expect_equal(dim(redusize("../mandrill.jpg", "../reduced.jpg", 200, 201)), c(200, 201,3))
  # width : even, height : odd number
  
})

test_that("New dimensions are not correct", {
  expect_equal(dim(redusize("../mandrill.jpg", "../reduced.jpg", 201, 200)), c(201, 200,3))
  # width : odd, height : odd number
  
})

test_that("New dimensions are not correct", {
  expect_equal(dim(redusize("../mandrill.jpg", "../reduced.jpg", 200,201 )), c(200, 201,3))
  # very samll image
  
})

test_that("New dimensions are not correct", {
  expect_equal(dim(redusize("../mandrill.jpg", "../reduced.jpg", 15,10 )), c(15, 10,3))
  # very samll image
  
})

