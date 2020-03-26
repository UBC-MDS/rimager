#' Reduce image color to either 2 or 8 colors for cartoonized effect
#'
#' @param input_path character the image file path
#' @param style string vector
#'              selected two colors from c("white", "black", "red", "green", "blue", "yellow", "pink", "aqua" )
#'              or "eight" for eight colors
#' @param output_path character if not Null, the modified image will be saved
#'                    in the provided folder path and name
#'
#' @return modified image array
#'
#' @importFrom stats median
#'
#' @export
#'
#' @examples
#' input_path <- system.file("tmp_image", "mandrill.jpg", package = "rimager")
#' new <- reducolor(input_path, c("black", "white"), "new.jpg")
#' OpenImageR::imageShow(new)
reducolor <- function(input_path, style, output_path=NULL) {
  color_list <- list("white" = c(1, 1, 1), "black" = c(0, 0, 0), "red" = c(1, 0, 0),
                    "green" = c(0, 1, 0), "blue" = c(0, 0, 1), "yellow" = c(1, 1, 0),
                    "pink" = c(1, 0.686, 0.843), "aqua" = c(0, 1, 1))
  img <- OpenImageR::readImage(input_path)
  height <- dim(img)[1]
  width <- dim(img)[2]
  red <- img[, , 1]
  green <- img[, , 2]
  blue <- img[, , 3]

  if (length(style)!=1 & length(style)!=2) {
    stop("Input for style should be of length 1 or 2")}

  if (length(style)==2) {
    if (sum(style[1] == names(color_list)) == 0) {
      stop(paste0(style[1], " is not available, please choose from ", list(names(color_list))))}
    if (sum(style[2] == names(color_list)) == 0) {
      stop(paste0(style[2], " is not available, please choose from ", list(names(color_list))))}
    if (style[1] == style[2]) {
      stop("Two colors must be different")}
    new_img <- array(dim=c(height, width, 3))
    new_img[, , 1][(red+green+blue)/3 < 0.5] <- color_list[[style[1]]][1]
    new_img[, , 1][(red+green+blue)/3 >= 0.5] <- color_list[[style[2]]][1]
    new_img[, , 2][(red+green+blue)/3 < 0.5] <- color_list[[style[1]]][2]
    new_img[, , 2][(red+green+blue)/3 >= 0.5] <- color_list[[style[2]]][2]
    new_img[, , 3][(red+green+blue)/3 < 0.5] <- color_list[[style[1]]][3]
    new_img[, , 3][(red+green+blue)/3 >= 0.5] <- color_list[[style[2]]][3]
  } else if (length(style)==1) {
    if (style[1] != "eight") {
      stop("Please put \"eight\" for eight colors or selected two colors")}
    new_img <- array(dim=c(height, width, 3))
    new_img[, , 1][red < median(red)] <- min(red)
    new_img[, , 1][red >= median(red)] <- max(red)
    new_img[, , 2][green < median(green)] <- min(green)
    new_img[, , 2][green >= median(green)] <- max(green)
    new_img[, , 3][blue < median(blue)] <- min(blue)
    new_img[, , 3][blue >= median(blue)] <- max(blue)
  }

  if (!is.null(output_path)) {
    OpenImageR::writeImage(new_img, output_path)
    paste("New image saved in", output_path)
  }
  OpenImageR::imageShow(new_img)
  return(new_img)

}
