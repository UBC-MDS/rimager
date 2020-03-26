##Unit test for reducolor function

test_that("Expect two colors only, more or less are returned", {
  expect_equal(length(unique(as.vector(reducolor("../milad.jpg", c("black", "white"))))), 2)
  expect_equal(length(unique(as.vector(reducolor("../mandrill.jpg", c("blue", "red"))))), 2)
})

test_that("Expect eight colors, more or less are returned", {
  expect_equal(length(unique(as.vector(reducolor("../milad.jpg", "eight")[, , 1]))) *
                 length(unique(as.vector(reducolor("../milad.jpg", "eight")[, , 2]))) *
                 length(unique(as.vector(reducolor("../milad.jpg", "eight")[, , 3]))), 8)
  expect_equal(length(unique(as.vector(reducolor("../mandrill.jpg", "eight")[, , 1]))) *
                 length(unique(as.vector(reducolor("../mandrill.jpg", "eight")[, , 2]))) *
                 length(unique(as.vector(reducolor("../mandrill.jpg", "eight")[, , 3]))), 8)

})

test_that("Error should be raised for invalid input for the style argument", {
  expect_error(reducolor("../mandrill.jpg", c("black", "whit")))
  expect_error(reducolor("../mandrill.jpg", c("blac", "whit")))
  expect_error(reducolor("../mandrill.jpg", c("black", "black")))
  expect_error(reducolor("../mandrill.jpg", c("black", "white", "black")))
  expect_error(reducolor("../mandrill.jpg", c("black")))
})

test_that("Error should be raised for non-existant image files", {
  expect_error(reducolor("../wrong.jpg", "eight"))
})
