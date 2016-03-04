## ---- setup                       --------------
source("genericprep.R")
if(!require(ggvis)) install.packages("ggvis")
library(ggvis)

## ---- barchart                    --------------
# Using `~date` resulted in
# Error in Math.Date(x) : abs not defined for "Date" objects
seatbelts %>%
  ggvis(~as.factor(date), ~DriversKilled) %>%
  layer_bars()

## ---- aggbarchart                 --------------
seatbelts %>% #group_by(year) %>%
  ggvis(~year, ~DriversKilled) %>%
  layer_bars()

## ---- groupedbarchart             --------------
# Can't make this one work :-/

# seatbelts %>% group_by( law) %>%
#   ggvis(x=~year, y=~DriversKilled, fill=~law) %>%
#   layer_bars()

## ---- scatterplot                 --------------
seatbelts %>%
  ggvis(~PetrolPrice, ~DriversKilled) %>%
  layer_points()

## ---- scatterplotcircles          --------------
seatbelts %>%
  ggvis(~PetrolPrice, ~DriversKilled) %>%
  layer_points(fillOpacity:=0, stroke:="black")

## ---- binnedscatterplot           --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,.(year,PetrolPrice=cut(PetrolPrice,breaks = 10))]

seatbeltsAgg %>%
  ggvis(~PetrolPrice, ~year, size=~DriversKilled) %>%
  layer_points(fillOpacity:=0, stroke:="black")

## ---- colouredscatterplot         --------------
seatbelts %>%
  ggvis(~PetrolPrice, ~DriversKilled, fill=~as.factor(law)) %>%
  layer_points()

## ---- colouredtextscatterplot     --------------
seatbelts %>%
  ggvis(~PetrolPrice, ~DriversKilled
        , fill=~as.factor(law), text:=~as.character(law)) %>%
  layer_text()

## ---- bubblechart                 --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,.(year,PetrolPrice)]

seatbeltsAgg %>%
  ggvis(~year, ~PetrolPrice
        , size=~DriversKilled) %>%
  layer_points()

## ---- scatterplotlogscale         --------------
seatbelts %>%
  ggvis(~PetrolPrice, ~DriversKilled) %>%
  layer_points() %>%
  scale_numeric(property= "y", trans = "log")

## ---- linechart                   --------------
## ---- multiserieslinechart        --------------
## ---- histogram                   --------------
## ---- areachart                   --------------
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

