
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rimager

<!-- badges: start -->

<!-- badges: end -->

The rimager package contains functions that aid in image manipulation
and processing.

This package was developed as a project for DSCI-524.

## Creators

| Name                | GitHub                                  |
| ------------------- | --------------------------------------- |
| Keanna Knebel       | [Keanna-K](https://github.com/Keanna-K) |
| Mohammed Salama     | [dataubc](https://github.com/dataubc)   |
| Zhengyang (Zoe) Pan | [zoepan00](https://github.com/zoepan00) |
| Haoyu (Clara) Su    | [clsu22](https://github.com/clsu22)     |

To contribute to this project, you must adhere to the terms outlined in
our [Code of
Conduct.](https://github.com/UBC-MDS/rimager/blob/master/CONDUCT.md)

## Overview:

Want to edit an image in the shell instead of GUI applications?
`rimager` is a R package that provides a quick and easy way to do some
simple image processings and graphic editings. Based on the main needs
of graphic editings, the package integrates four functionalities. It
includes reduce the size of the image, crop image into a circle, reduce
image colors, and apply cool effect filters. By input the path of the
image, users can run any of these functions with one line of code to get
a desired or interesting images.

## Our package in R ecosystem:

There are existing packages to process images. For example
`magick`[here](https://cran.r-project.org/web/packages/magick/vignettes/intro.html),
`imager`[here](https://dahtah.github.io/imager/imager.html) are popular
packages that can be used to resize, cut images and apply filters. The
goal of this package is either to utilize the existing packages to
improve the pre-existing functions or to re-implement code manually.
Also it automates the image editing process, producing the altered image
by one line of code.

## Installation

You can install the released version of rimager from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("rimager")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/rimager")
```

## Functions

  - `circropper`: This function crops the input image into a circle.
    This can be useful when you want to make icons from images.
  - `reduce_dimensions`: This function reduces the dimension of a given
    image by removing vertical and horizontal seams.
  - `img_filter`: This function applies a filter to a given image,
    altering the visual aesthetic. This includes options to blur,
    emboss, and colorize the image.
  - `reducolor`: This function reduces number of colors appearing on the
    image to have cartoonized color effect.

## Dependencies:

TODO

## Example

This is a basic example which shows you how to solve a common problem:

``` r
#library(rimager)
## basic example code
## TODO
```

## Package in python

We have the package with same functionalities in python: `pyimager`. See
[here](https://github.com/UBC-MDS/rimager)
