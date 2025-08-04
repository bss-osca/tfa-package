library(tidyverse)
# message("Set locale: ", Sys.setlocale("LC_ALL", "English"), "\n")
# zips <- as_tibble(read_csv2("../inst/extdata/zip_jutland.csv")) # , locale = locale(encoding = "ISO-8859-1")
# # iconv(zips$Area, from = "UTF-8", to = "UTF-8")
# # Encoding(zips$Area)

# Download and read the GeoNames Denmark ZIP code file
download.file("http://download.geonames.org/export/zip/DK.zip", "DK.zip")
unzip("DK.zip")

# Read the file (tab-delimited, no headers)
zips <- read.delim("DK.txt", header = FALSE, stringsAsFactors = FALSE)

# Assign column names (per GeoNames format)
colnames(zips) <- c("country_code", "postal_code", "place_name",
                      "admin_name1", "admin_code1", "admin_name2",
                      "admin_code2", "admin_name3", "admin_code3",
                      "latitude", "longitude", "accuracy")

zips <- zips |>
   select(postal_code, place_name, latitude, longitude)

usethis::use_data(zips, overwrite = TRUE)

