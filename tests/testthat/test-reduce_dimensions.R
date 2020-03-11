test_that("New dimensions are not correct", {
  expect_equal(dim(reduce_dimensions("../mandrill.jpg", "../reduced.jpg", 200, 200)), c(200, 200,3))


})

test_that("New dimensions are not correct", {
  expect_equal(dim(reduce_dimensions("../mandrill.jpg", "../reduced.jpg", 201, 201)), c(201, 201,3))


})
test_that("New dimensions are not correct", {
  expect_equal(dim(reduce_dimensions("../mandrill.jpg", "../reduced.jpg", 200, 201)), c(200, 201,3))


})

test_that("New dimensions are not correct", {
  expect_equal(dim(reduce_dimensions("../mandrill.jpg", "../reduced.jpg", 200, 201)), c(200, 201,3))


})
