## ---- setup                       --------------
source("genericprep.R")
if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

## ---- barchart                    --------------
ggplot(seatbelts, aes(x=date, y=DriversKilled)) +
  geom_bar(stat="identity")

## ---- aggbarchart                 --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,year]

ggplot(seatbeltsAgg, aes(x=year, y=DriversKilled)) +
  geom_bar(stat="identity")

## ---- groupedbarchart             --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,.(year,law=as.factor(law))]

ggplot(seatbeltsAgg, aes(x=year, y=DriversKilled
                         , group=law, fill=law)) +
  geom_bar(stat="identity")

## ---- scatterplot                 --------------
ggplot(seatbelts, aes(x=PetrolPrice, y=DriversKilled)) +
  geom_point()

## ---- scatterplotcircles          --------------
ggplot(seatbelts, aes(x=PetrolPrice, y=DriversKilled)) +
  geom_point(shape=1)

## ---- binnedscatterplot           --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,.(year,PetrolPrice=cut(PetrolPrice,breaks = 10))]

ggplot(seatbeltsAgg, aes(x=year, y=PetrolPrice
                         , size=DriversKilled)) +
  geom_point()

## ---- colouredscatterplot         --------------
ggplot(seatbelts, aes(x=PetrolPrice, y=DriversKilled
                      , colour = as.factor(law))) +
  geom_point()

## ---- colouredtextscatterplot     --------------
ggplot(seatbelts, aes(x=PetrolPrice, y=DriversKilled
                      , colour = as.factor(law)
                      , label = as.factor(law))) +
  geom_text()

## ---- bubblechart                 --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,.(year,PetrolPrice)]

ggplot(seatbeltsAgg, aes(x=year, y=PetrolPrice
                         , size=DriversKilled)) +
  geom_point(alpha=0.5)

## ---- scatterplotlogscale         --------------
ggplot(seatbelts, aes(x=PetrolPrice, y=DriversKilled)) +
  geom_point() +
  scale_y_log10()

## ---- linechart                   --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,year]

ggplot(seatbeltsAgg, aes(x=year, y=DriversKilled)) +
  geom_line()

## ---- multiserieslinechart        --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,.(year, law=as.factor(law))]

ggplot(seatbeltsAgg, aes(x=year, y=DriversKilled
                         , group=law , colour=law)) +
  geom_line()

## ---- histogram                   --------------
ggplot(seatbelts, aes(x=PetrolPrice, y=..count..) )+
  geom_histogram()

## ---- areachart                   --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,year]

ggplot(seatbeltsAgg, aes(x=year, y=DriversKilled)) +
  geom_area()

## ---- boxplot                     --------------
ggplot(seatbelts, aes(x=cut(PetrolPrice,10), y=DriversKilled)) +
  geom_boxplot()

## ---- stackedbar                  --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,.(year,law=as.factor(law))]

ggplot(seatbeltsAgg, aes(x=year, y=DriversKilled
                         ,fill=law)) +
  geom_bar(stat="identity")

## ---- horizstackedbar             --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,.(year,law=as.factor(law))]

ggplot(seatbeltsAgg, aes(x=year, y=DriversKilled
                         ,fill=law)) +
  geom_bar(stat="identity") +
  coord_flip()

## ---- normalisedstackedbar        --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,.(year,law=as.factor(law))]

ggplot(seatbeltsAgg, aes(x=year, y=DriversKilled
                         ,fill=law)) +
  geom_bar(stat="identity",position = "fill")

## ---- stackedarea                 --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,.(year,law=as.factor(law))]
dummyRow<-data.table(year=1984,law=0,DriversKilled=0)
seatbeltsAgg <- rbindlist(list(seatbeltsAgg,dummyRow), use.names=TRUE,fill=TRUE)

ggplot(seatbeltsAgg[order(year,law),], aes(x=year, y=DriversKilled
                         ,fill=law)) +
  geom_area(position="stack")

## ---- normalisedstackedarea      --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,.(year,law=as.factor(law))]
dummyRow<-data.table(year=1984,law=0,DriversKilled=0)
seatbeltsAgg <- rbindlist(list(seatbeltsAgg,dummyRow), use.names=TRUE,fill=TRUE)

ggplot(seatbeltsAgg[order(year,law),], aes(x=year, y=DriversKilled
                                           ,fill=law)) +
  geom_area(position="fill")

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
