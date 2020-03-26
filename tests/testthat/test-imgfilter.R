library(OpenImageR)
img_path <- "../mandrill.jpg"

test_that("Yield error when `strength` type or value is out of scope.", {
  expect_error(imgfilter(img_path, filter_type = "blur", strength = "5"))
  expect_error(imgfilter(img_path, filter_type = "blur", strength = 1.5))
  expect_error(imgfilter(img_path, filter_type = "blur", strength = -2))
})

test_that("Yield error when `filter_type` is not one of 'blur' or 'sharpen'", {
  expect_error(imgfilter(img_path, filter_type = "3D", strength = 0.4))
})

test_that("Output image dimensions are less than the original image array.", {
  img <- OpenImageR::readImage(img_path)
  h <- dim(img)[1]
  w <- dim(img)[2]
  output_img <- imgfilter(img_path, filter_type = "blur", strength = 0.2, output_path = "../mandrill_imgfilter.jpg")
  output_img2 <- imgfilter(img_path, filter_type = "sharpen", strength = 0.1)
  expect_lte(dim(output_img)[1], h)
  expect_lte(dim(output_img)[2], w)
  expect_lte(dim(output_img2)[1], h)
  expect_lte(dim(output_img2)[2], w)
})
