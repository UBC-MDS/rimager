#' Crop the image to a circle
#'
#' Create a new image cropped by a circle mask and leave a margin
#'
#' @param input_path character the image file path
#' @param margin double the distance between circle boundary and the original
#'   image boundary
#' @param output_path character if not NULL, the modified image will be saved
#'   in the provided folder path and name
#'
#' @return a cropped image
#'
#' @import magick
#' @importFrom grDevices dev.off png
#' @importFrom graphics par plot
#'
#' @export
#'
#'
#' @examples
#' path <- system.file("tmp_image", "mandrill.jpg", package = "rimager")
#' circropper(path, 0, "new.png")
circropper <- function(input_path, margin, output_path = NULL) {
  # Check argument type
  if (!is.character(input_path) & !is.double(margin)) {
    stop("TypeError:
         * 'input_path' must be a character vector.
         * 'margin' must be a double vector.")
  }
  if (!is.character(input_path)) {
    stop("TypeError: 'input_path' must be a character vector.")
  }
  if (!is.double(margin)) {
    stop("TypeError: 'margin' must be a double vector.")
  }
  if (!is.null(output_path) & !is.character(output_path)) {
    stop("TypeError: 'output_path' must be a character vector.")
  }

  # read image
  img <- image_read(input_path, strip = TRUE)
  height <- image_info(img)$height
  width <- image_info(img)$width

  # Check margin value
  if (margin > min(height, width)) {
    stop("ValueError: 'margin' must be smaller than ", min(height, width))
  }

  # crop image into a circle
  png(tf <- tempfile(fileext = ".png"), width, height)
  par(mar = rep(0, 4), yaxs = "i", xaxs = "i")
  plot(0,
    type = "n",
    ylim = c(0, height),
    xlim = c(0, width),
    axes = FALSE,
    xlab = NA,
    ylab = NA
  )
  plotrix::draw.ellipse(width / 2,
    height / 2,
    width / 2 - margin,
    height / 2 - margin,
    col = "black"
  )
  dev.off()

  mask <- image_read(tf)
  img_out <- image_composite(mask, img, "plus")

  # write out image given output_path
  if (!is.null(output_path)) {
    image_write(img_out, path = output_path, format = "png")
  }

  return(img_out)
}
