library(magick)

#' Crop the image to a circle
#'
#' Create a new image cropped by a circle mask and leave a margin
#'
#' @param input_path character
#' @param outut_path character
#' @param margin double
#'
#' @return an image file saved in the designated folder
#' @export
#' @examples
#' circropper("path_to_input_img.png", "output_img.png", 20)

circropper <- function(input_path, output_path, margin) {
  img <- image_read(input_path)
  height <- image_info(img)$height
  width <- image_info(img)$width

  png(tf <- tempfile(fileext = ".png"), width, height)
  par(mar = rep(0,4), yaxs="i", xaxs="i")
  plot(0, type = "n", ylim = c(0,height), xlim=c(0,width), axes=F, xlab=NA, ylab=NA)
  plotrix::draw.ellipse(width/2,height/2,width/2-margin,height/2-margin, col="black")
  dev.off()


  mask <- image_read(tf)
  img_out <- image_composite(mask, img, "plus")
  image_write(img_out, path = output_path, format = "png")
}

