library(magick)

#' Crop the image to a circle
#'
#' Create a new image cropped by a circle mask and leave a margin
#'
#' @param input_path character the image file path
#' @param margin double the distance between circle boundary and the original image boundary
#'
#' @return a cropped image
#' @export
#'
#' @examples
#' circropper("path_to_input_img.png", "output_img.png", 20)

circropper <- function(input_path, margin) {
  # Check argument type
  if (!is.character(input_path) & !is.double(margin)){
    stop("TypeError: The 'input_path' arguments must be a character and the 'margin' argument must be a double")}
  if (!is.character(input_path)){
    stop("TypeError: The 'input_path' argument must be a character")}
  if (!is.double(margin)){
    stop("TypeError: The 'margin' argument must be a double")}

  img <- image_read(input_path)
  height <- image_info(img)$height
  width <- image_info(img)$width

  # Check margin value
  if (margin > min(height, width)){
    stop("ValueError: The 'margin' argument should be smaller than ", min(height, width))
  }

  png(tf <- tempfile(fileext = ".png"), width, height)
  par(mar = rep(0,4), yaxs="i", xaxs="i")
  plot(0, type = "n", ylim = c(0,height), xlim=c(0,width), axes=F, xlab=NA, ylab=NA)
  plotrix::draw.ellipse(width/2,height/2,width/2-margin,height/2-margin, col="black")
  dev.off()

  mask <- image_read(tf)
  img_out <- image_composite(mask, img, "plus")

  return(img_out)
}
