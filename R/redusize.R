#' Reduces the dimension of a given image by removing vertical and
#' horizontal seams
#'
#' A new image with the modified height and width will be created
#'
#' @param input_path character, the path for the input file
#' @param output_path character, the path for the output file
#' @param height integer, the height of the reduced image
#' @param width integer, the width of the reduce image
#' @return an array of image
#' @export
#' @examples
#' input_path <- system.file("tmp_image", "mandrill.jpg", package = "rimager")
#' OpenImageR::imageShow(redusize(input_path, "reduced.jpg", 297, 200))
redusize <- function(input_path, output_path, height, width) {
  img <- OpenImageR::readImage(input_path)
  nrows <- nrow(img)
  ncols <- ncol(img)
  # added exception
  if (width > ncols) {
    stop("Value Error: height should be less than the original height")
  }
  if (height > nrows) {
    stop("Value Error: width should be less than the original width")
  }
  rem_rows <- (nrows - height) %% 2
  rem_cols <- (ncols - width) %% 2

  if ((height %% 2) == 0) {
    remov_rows <- ((nrows/2) - (height/2) + 1):((nrows/2) + (height/2))
  } else {
    remov_rows <- floor(((nrows/2) - (height/2) + 1)):trunc(((nrows/2) +
      (height/2)))
  }
  if ((width %% 2) == 0) {
    remov_cols <- ((ncols/2) - (width/2) + 1):((ncols / 2) + (width/2))
  } else {
    remov_cols <- floor(((ncols/2)) - (width/2) + 1):trunc(((ncols/2)) + (width/2))
  }

  new_img <- array(dim = c(height, width, dim(img)[3]))

  for (i in 1:dim(img)[3]) {
    new_img[, , i] <- img[, , i][remov_rows, remov_cols]
  }
  if (!is.null(output_path)) {
    OpenImageR::writeImage(new_img, output_path)
    paste("New image saved in", output_path)
  }
  OpenImageR::imageShow(new_img)
  return(new_img);
}
