library(magick)
input_path <- "https://static0.srcdn.com/wordpress/wp-content/uploads/2019/08/We-Bear-Bears.jpg?q=50&fit=crop&w=960&h=500&dpr=1.5"

test_that("yield error when argument type is wrong", {
  expect_error(circropper(1, "one"))
  expect_error(circropper(input_path, "one"))
  expect_error(circropper(1, 1))
})

test_that("yield error when margin value is out of scope", {
  expect_error(circropper("tests/milad.jpg", 10000))
})


test_that("circropper produces an output image with the same height and width as the original image", {
  img <- image_read(input_path)
  height <- image_info(img)$height
  width <- image_info(img)$width
  cropped <- circropper(input_path, 0)
  cropped_height <- image_info(cropped)$height
  cropped_width <-image_info(cropped)$width
  expect_identical(height, cropped_height)
  expect_identical(width, cropped_width)
})
