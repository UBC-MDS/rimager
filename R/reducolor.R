#' Reduce image color to either 2 or 8 colors for cartoonized effect
#'
#' @param style integer either 0 or 1
#'              0 for white and black colors
#'              1 for 8 colors
#' @param input_path character the image file path
#' @param output_path character if not Null, the modified image will be saved
#'                    in the provided folder path and name
#'
#' @return modified image array
#' @export
#'
#' @examples
#' redu_color(0, "tests/milad.jpg", "tests/milad_new.jpg")
reducolor <- function(style, input_path, output_path=NULL) {
  img = OpenImageR::readImage(input_path)
  height <- dim(img)[1]
  width <- dim(img)[2]
  red <- img[, , 1]
  green <- img[, , 2]
  blue <- img[, , 3]

  if (style!=0 & style!=1) {stop("Input is invalid for the style argument. Please enter either 0 for black and white color, 1 for eight color scales")}

  if (style==0) {
    new_img <- array(dim=c(height, width, 3))
    new_img[(red+green+blue)/3 < 0.5] <- 0
    new_img[(red+green+blue)/3 >= 0.5] <- 1
  } else if (style==1) {
    new_img <- array(dim=c(height, width, 3))
    new_img[, , 1][red < median(red)] <- min(red)
    new_img[, , 1][red >= median(red)] <- max(red)
    new_img[, , 2][green < median(green)] <- min(green)
    new_img[, , 2][green >= median(green)] <- max(green)
    new_img[, , 3][blue < median(blue)] <- min(blue)
    new_img[, , 3][blue >= median(blue)] <- max(blue)
  }

  if (!is.null(output_path)) {
    writeImage(new_img, output_path)
    paste("New image saved in", output_path)
  }
  return(new_img)

}
