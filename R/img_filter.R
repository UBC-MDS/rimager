#' Applies a filter to a given image to edit the visual aesthetic.
#'
#' The filter types include 'blur' and 'sharpen'; where
#' blur blends neighboring pixels and sharpen enhances edges.
#' The strength of the filter indicates how much of effect is apllied
#' to the image; where 0 is no effect and 1 is very strong effect.
#'
#' @param input_path character the file path of the image
#' @param filter_type character filter to be applied to the input image
#'                    options: 'blur' and 'sharpen'
#' @param strength numeric or integer (0 to 1) the strength of the selected filter effect
#' @param output_path character or NULL (default NULL); the file path of the resultant image
#'
#' @return modified image array
#' @export
#'
#' @examples
#' img_filter("images/mandrill.jpg", "blur", 0.4)
img_filter <- function(input_path, filter_type, strength, output_path=NULL) {

  # assert strength is of type integer or numeric
  if (!is.integer(strength) & !is.numeric(strength)) {
    stop("TypeError: Input must be of type integer or numeric for the strength argument.")
  }
  # assert strength is between 0 and 1
  if (strength > 1 | strength < 0) {
    stop("ValueError: The 'strength' parameter can only take on values from 0 to 1")
  }
  # assert filter_type is one of the valid options
  if (filter_type!= 'blur' & filter_type!= 'sharpen') {
    stop("ValueError: The fliter_type entered is not a valid option.")
  }

  # read in image as array
  img = OpenImageR::readImage(input_path)
  h <- dim(img)[1]
  w <- dim(img)[2]
  output_image <- img

  if (filter_type=='blur') {
    # create blur filter
    filt = array(data = 1/(as.integer(h*strength/10)*as.integer(w*strength/10)),
                           dim = c(as.integer(h*strength/10), as.integer(w*strength/10)))
  } else {
      # create sharpen filter
      filt = array(c(0,0,0,0,1,0,0,0,0), dim=c(3,3))
  }

  # get coordinates for the middle of the filter
  filt_h = dim(filt)[1]
  filt_w = dim(filt)[2]
  offset_w = filt_w%/%2
  offset_h = filt_h%/%2

  # Compute convolution with kernel/filter
  for (columns in seq(from=offset_w, to=w-offset_w)){
    for (rows in seq(from=offset_h, to=h-offset_h)){

      new_rgb = array(c(0,0,0), dim=c(1,3))

      for (x in seq(filt_h)){
        for (y in seq(filt_w)){

          # get coords for current filter position
          x_new <- columns + x - offset_h
          y_new <- rows + y - offset_w

          # multiply pixel rgb by filter value
          pixel_rgb <- img[x_new, y_new,]
          new_rgb <- new_rgb + pixel_rgb * filt[x, y]
        }
      }
    }
    if (filter_type=='blur') {
      output_img[columns, rows,]  <- new_rgb
    } else {
      output_img[columns, rows,] <- img[columns, rows,] + (img[columns, rows,] - new_rgb)*strength
    }
  }
  # crop image to remove boundary pixels
  output_img = output_img[offset_h:h-offset_h,offset_w:w-offset_w,]

  if (!is.null(output_path)) {
    writeImage(output_img, output_path)
    paste("New image saved in", output_path)
  }
  return(output_img)

}


