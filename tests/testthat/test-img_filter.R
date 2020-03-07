library(OpenImageR)
test_that("Error should be raised. Should only allow strength input as numeric or integer between 0 and 1", {
  expect_error(img_filter('../mandrill.jpg', filter_type='blur', strength = '5'))
  expect_error(img_filter('../mandrill.jpg', filter_type='blur', strength = 1.5))
  expect_error(img_filter('../mandrill.jpg', filter_type='blur', strength = -2))
})

test_that("Error should be raised. Should only allow filter_type of 'blur' or 'sharpen'", {
  expect_error(img_filter('../mandrill.jpg', filter_type='3D', strength = 0.4))
})

test_that("Output image should be smaller or equal in size to original image array.", {
  img <- OpenImageR::readImage('../mandrill.jpg')
  h <- dim(img)[1]
  w <- dim(img)[2]
  output_img <- img_filter('../mandrill.jpg', filter_type='blur', strength = 0.1)
  output_img2 <- img_filter('../mandrill.jpg', filter_type='sharpen', strength = 0.1)
  expect_lte(h, dim(output_img)[1])
  expect_lte(w, dim(output_img)[2])
  expect_equal(h, dim(output_img2)[1] + 2)
  expect_equal(w, dim(output_img2)[2] + 2)
})
