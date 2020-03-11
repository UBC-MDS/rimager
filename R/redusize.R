#' A function to reduce the dimension of a give image by removing vertical and horizontal seams
#'
#' A new image with the modified width and height will be created
#'
#' @param input_file character, the file path for the input file
#' @param output_file character, the file path for the output file
#' @param width integer, the width of the reduced image
#' @param height integer, the height of the reduce image
#' @return an array of image
#' @export
#' @examples redusize("images/mandrill.jpg", "images/reduced.jpg", 297, 200)
#' reduce_dimensions(input_file,output_file,width,height)
redusize <- function(input_file, ouput_file, width, height) {
  img <- jpeg::readJPEG(input_file)
  
  nrows = nrow(img)
  ncols = ncol(img)


  # added exception
  if (height > ncols) {stop("Value Error: Width should be less than the original width")}
  if (width > nrows) {stop("Value Error: Height should be less than the original height")}


  
  
  rem_rows = (nrows - width) %% 2
  rem_cols = (ncols - height) %% 2
  
  if ((width %% 2) == 0) {
    remov_rows = ((nrows / 2) - (width / 2) + 1):((nrows / 2) + (width / 2))
    
  } else {
    remov_rows = floor(((nrows / 2) - (width / 2) + 1)):trunc(((nrows / 2) +
                                                                 (width / 2)))
  }
  if ((height %% 2) == 0) {
    remov_cols = ((ncols / 2) - (height / 2) + 1):((ncols / 2) + (height / 2))
    
  } else {
    remov_cols = floor(((ncols / 2)) - (height / 2) + 1):trunc(((ncols / 2)) + (height /
                                                                                  2))
  }
  
  new_img = array(dim = c(width, height, dim(img)[3]))
  
  
  
  for (i in 1:dim(img)[3]) {
    new_img[, , i] = img[, , i][remov_rows, remov_cols]
  }
  
  jpeg::writeJPEG(new_img, target = ouput_file)
  return(new_img)
  
  
}

