test_that("New dimensions are not correct", {
  expect_equal(dim(reduce_dimensions("../mandrill.jpg", "../reduced.jpg", 200, 200)), c(200, 200,3))
<<<<<<< HEAD


=======
  # width : even, height : even number
  
>>>>>>> 3e7441957ecf82759de6cd3c4296f2482824eab7
})

test_that("New dimensions are not correct", {
  expect_equal(dim(reduce_dimensions("../mandrill.jpg", "../reduced.jpg", 201, 201)), c(201, 201,3))
<<<<<<< HEAD


})
test_that("New dimensions are not correct", {
  expect_equal(dim(reduce_dimensions("../mandrill.jpg", "../reduced.jpg", 200, 201)), c(200, 201,3))


})

test_that("New dimensions are not correct", {
  expect_equal(dim(reduce_dimensions("../mandrill.jpg", "../reduced.jpg", 200, 201)), c(200, 201,3))


})
=======
  # width : odd, height : odd number
  
})
test_that("New dimensions are not correct", {
  expect_equal(dim(reduce_dimensions("../mandrill.jpg", "../reduced.jpg", 200, 201)), c(200, 201,3))
  # width : even, height : odd number
  
})

test_that("New dimensions are not correct", {
  expect_equal(dim(reduce_dimensions("../mandrill.jpg", "../reduced.jpg", 201, 200)), c(201, 200,3))
  # width : odd, height : odd number
  
})
>>>>>>> 3e7441957ecf82759de6cd3c4296f2482824eab7
