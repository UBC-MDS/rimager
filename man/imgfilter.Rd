% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/imgfilter.R
\name{imgfilter}
\alias{imgfilter}
\title{Applies a filter to a given image to edit the visual aesthetic.}
\usage{
imgfilter(input_path, filter_type, strength, output_path = NULL)
}
\arguments{
\item{input_path}{character the file path of the image}

\item{filter_type}{character filter to be applied to the input image
options: 'blur' and 'sharpen'}

\item{strength}{numeric or integer (0 to 1);
the strength of the selected filter effect}

\item{output_path}{character or NULL (default NULL);
the file path of the resultant image}
}
\value{
modified image array
}
\description{
The filter types include 'blur' and 'sharpen'; where
blur blends neighboring pixels and sharpen enhances edges.
The strength of the filter indicates how much of effect is applied
to the image; where 0 is no effect and 1 is very strong effect.
}
\examples{
input_path <- system.file("tmp_image", "mandrill.jpg", package = "rimager")
imgfilter(input_path, "blur", 0.2)
}
