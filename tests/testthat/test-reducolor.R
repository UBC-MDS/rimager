##Unit test for reducolor function

test_that("Expect two colors only, more or less are returned", {
  expect_equal(length(unique(as.vector(reducolor(0, "../milad.jpg")))), 2)
  expect_equal(length(unique(as.vector(reducolor(0, "../mandrill.jpg")))), 2)
})

test_that("Expect eight colors, more or less are returned", {
  expect_equal(length(unique(as.vector(reducolor(1, "../milad.jpg")[, , 1])))*
                 length(unique(as.vector(reducolor(1, "../milad.jpg")[, , 2])))*
                 length(unique(as.vector(reducolor(1, "../milad.jpg")[, , 3]))), 8)
  expect_equal(length(unique(as.vector(reducolor(1, "../mandrill.jpg")[, , 1])))*
                 length(unique(as.vector(reducolor(1, "../mandrill.jpg")[, , 2])))*
                 length(unique(as.vector(reducolor(1, "../mandrill.jpg")[, , 3]))), 8)

})

test_that("Error should be raised. Should not allow style code input other than 0 or 1", {
  expect_error(reducolor(2, "../mandrill.jpg"))
})

test_that("Error should be raised for non-existant image files", {
  expect_error(reducolor(0, "../wrong.jpg"))
})
