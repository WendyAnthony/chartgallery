## ---- setup                       --------------
source("genericprep.R")
# Not on CRAN
if(!require(devtools)) install.packages("devtools")
if(!require(vegalite)) {
  devtools::install_github("hrbrmstr/vegalite")
}
library(vegalite)
vegalite <- vegalite(viewport_height = "300px")

## ---- barchart                    --------------
vegalite %>%
  add_data(seatbelts) %>%
  encode_x("date","ordinal") %>%
  encode_y("DriversKilled", "quantitative") %>%
  mark_bar()

## ---- aggbarchart                 --------------
vegalite %>%
  add_data(seatbelts) %>%
  encode_x("year","ordinal") %>%
  encode_y("DriversKilled", "quantitative","sum") %>%
  mark_bar()

## ---- groupedbarchart             --------------
vegalite %>%
  add_data(seatbelts) %>%
  encode_x("year","ordinal") %>%
  encode_y("DriversKilled", "quantitative","sum") %>%
  encode_color("law", "nominal") %>%
  mark_bar()

## ---- scatterplot                 --------------
vegalite %>%
  add_data(seatbelts) %>%
  encode_x("PetrolPrice","quantitative") %>%
  encode_y("DriversKilled", "quantitative") %>%
  mark_point()

## ---- scatterplotcircles          --------------
vegalite %>%
  add_data(seatbelts) %>%
  encode_x("PetrolPrice","quantitative") %>%
  encode_y("DriversKilled", "quantitative") %>%
  mark_circle()

## ---- binnedscatterplot           --------------
vegalite %>%
  add_data(seatbelts) %>%
  encode_x("year","ordinal") %>%
  encode_y("PetrolPrice", "quantitative") %>%
  encode_size("DriversKilled", "quantitative", aggregate="sum") %>%
  bin_y(maxbins=10) %>%
  mark_point()

## ---- colouredscatterplot         --------------
vegalite %>%
  add_data(seatbelts) %>%
  encode_x("PetrolPrice","quantitative") %>%
  encode_y("DriversKilled", "quantitative") %>%
  encode_color("law", "nominal") %>%
  mark_point()

## ---- colouredtextscatterplot     --------------
vegalite %>%
  add_data(seatbelts) %>%
  encode_x("PetrolPrice","quantitative") %>%
  encode_y("DriversKilled", "quantitative") %>%
  encode_color("law", "nominal") %>%
  encode_text("law", "nominal") %>%
  mark_text()

## ---- bubblechart                 --------------
vegalite %>%
  add_data(seatbelts) %>%
  encode_x("year","ordinal") %>%
  encode_y("PetrolPrice", "quantitative") %>%
  encode_size("DriversKilled", "quantitative", aggregate="sum") %>%
  mark_point()

## ---- scatterplotlogscale         --------------
vegalite %>%
  add_data(seatbelts) %>%
  encode_x("year","ordinal") %>%
  encode_y("DriversKilled", "quantitative")  %>%
  scale_y_log() %>%
  mark_point()

## ---- linechart                   --------------
vegalite %>%
  add_data(seatbelts) %>%
  encode_x("year","ordinal") %>%
  encode_y("DriversKilled", "quantitative", "sum")  %>%
  mark_line()

## ---- multiserieslinechart        --------------
vegalite %>%
  add_data(seatbelts) %>%
  encode_x("year","ordinal") %>%
  encode_y("DriversKilled", "quantitative", "sum")  %>%
  encode_color("law", "nominal") %>%
  mark_line()

## ---- histogram                   --------------
vegalite %>%
  add_data(seatbelts) %>%
  encode_x("PetrolPrice","quantitative") %>%
  encode_y("DriversKilled", "quantitative", "sum") %>%
  bin_x(maxbins=10) %>%
  mark_bar()

## ---- areachart                   --------------
vegalite %>%
  add_data(seatbelts) %>%
  encode_x("year","ordinal") %>%
  encode_y("DriversKilled", "quantitative", "sum")  %>%
  mark_area()

## ---- boxplot                     --------------
## ---- stackedbar                  --------------
## ---- horizstackedbar             --------------
## ---- normalisedstackedbar        --------------
## ---- stackedarea                 --------------
## ---- normalisedstackedarea      --------------
## ---- layeredbar                  --------------
## ---- trellisbar                  --------------
## ---- trellisstackedbar           --------------
## ---- trellisscatter              --------------
## ---- trellishistogram            --------------
## ---- trelliscolouredscatterplot  --------------
## ---- steamgraph                  --------------
## ---- networkgraph                --------------
## ---- beechart                    --------------
## ---- stripplot                   --------------
## ---- slopegraph                  --------------

