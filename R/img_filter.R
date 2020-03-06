#' Applies a filter to a given image to edit the visual aesthetic.
#'
#' The filter types include 'blur', 'emboss', and 'grayscale'; where
#' blur blends neighboring pixels, emboss creates a '3D like' impression,
#' and grayscale returns a black and white image.
#' The strength of the filter indicates how much of effect is apllied
#' to the image; where 0 is no effect and 1 is very strong effect.
#'
#' @param input_path character the file path of the image
#' @param filter_type character filter to be applied to the input image
#'                    options: 'blur', 'emboss', 'grayscale'
#' @param strength integer or float (0 to 1) the strength of the selected filter effect
#'
#' @return modified image array
#' @export
#'
#' @examples
#' img_filter("images/milad.jpg", "blur", 0.4)
img_filter <- function(input_path, filter_type, strength) {

}

