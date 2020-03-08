test_that("New dimensions are not correct", {
  expect_equal(reduce_dimensions("../mandrill.jpg", "../../images/reduced.jpg", 200, 200), c(200, 200,3))
  # width : even, height : even number
  
})

test_that("New dimensions are not correct", {
  expect_equal(reduce_dimensions("../mandrill.jpg", "../../images/reduced.jpg", 201, 201), c(201, 201,3))
  # width : odd, height : odd number
  
})
test_that("New dimensions are not correct", {
  expect_equal(reduce_dimensions("../mandrill.jpg", "../../images/reduced.jpg", 200, 201), c(200, 201,3))
  # width : even, height : odd number
  
})

test_that("New dimensions are not correct", {
  expect_equal(reduce_dimensions("../mandrill.jpg", "../../images/reduced.jpg", 201, 200), c(201, 200,3))
  # width : odd, height : odd number
  
})