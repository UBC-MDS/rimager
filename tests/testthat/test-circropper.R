input_path <- "../mandrill.jpg"

test_that("yield error when argument type is wrong", {
  expect_error(circropper(1, "one"))
  expect_error(circropper(input_path, "one"))
  expect_error(circropper(1, 1))
  expect_error(circropper(input_path, 0, 10))
})

test_that("yield error when margin value is out of scope", {
  expect_error(circropper("tests/milad.jpg", 10000))
})


test_that("The output image and input image have the same height and width", {
  img <- image_read(input_path)
  height <- image_info(img)$height
  width <- image_info(img)$width
  cropped <- circropper(input_path, 0)
  cropped_height <- image_info(cropped)$height
  cropped_width <- image_info(cropped)$width
  expect_identical(height, cropped_height)
  expect_identical(width, cropped_width)
})
