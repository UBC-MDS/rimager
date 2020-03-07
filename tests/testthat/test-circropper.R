test_that("yield error when argument type is wrong", {
  expect_error(circropper(1, 1, "one"))
  expect_error(circropper(1, 1, 0))
  expect_error(circropper(1, "result.jpg", "one"))
  expect_error(circropper("tests/milad.jpg", 1, "one"))
  expect_error(circropper("tests/milad.jpg", 1, 1))
  expect_error(circropper(1, "result.jpg", 1))
  expect_error(circropper("tests/milad.jpg", "result.png", "one"))
})

test_that("yield error when margin value is out of scope", {
  expect_error(circropper("tests/milad.jpg", "result.png", 10000))
})

input_path <- "https://static0.srcdn.com/wordpress/wp-content/uploads/2019/08/We-Bear-Bears.jpg?q=50&fit=crop&w=960&h=500&dpr=1.5"
img <- image_read(input_path)
  height <- image_info(img)$height
width <- image_info(img)$width
cropped <- circropper(input_path, "result.png", 0)
cropped_height <- image_info(cropped)$height
cropped_width <-image_info(cropped)$width

test_that("circropper works good", {
  expect_identical(height, cropped_height)
  expect_identical(width, cropped_width)
})
