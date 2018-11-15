# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

get_evictions <- function(state, geotype = "block-groups"){

  File <- tempfile()
  Geotype <- paste(geotype, "csv", sep = ".")

  file.path("https://eviction-lab-data-downloads.s3.amazonaws.com", state, Geotype) %>%
    download.file(File)

  read_csv(File, col_types = "ciccnnnnnnnnnnnnnnnnnnnniii") %>%
    rename(geoid = GEOID) %>%
    mutate(geoid = stringr::str_pad(geoid, 11, "left", "0"))
}
