## ---- setup                       --------------
source("genericprep.R")
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
## ---- scatterplotcircles          --------------
## ---- binnedscatterplot           --------------
## ---- colouredscatterplot         --------------
## ---- colouredtextscatterplot     --------------
## ---- bubblechart                 --------------
## ---- scatterplotlogscale         --------------
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

