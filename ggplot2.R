## ---- setup                       --------------
source("genericprep.R")
if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

# Network chart
if(!require(GGally)) install.packages("GGally")
if(!require(network)) install.packages("network")
library(GGally)

# Beeswarm
if(!require(ggbeeswarm)) install.packages("ggbeeswarm")
library(ggbeeswarm)


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
# This is inelegant!
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,.(year,law=as.factor(law))]

ggplot( mapping = aes(x=year, y=DriversKilled
                         ,fill=law)) +
  geom_bar(data=seatbeltsAgg[law=="1",],stat="identity", alpha=.5)+
  geom_bar(data=seatbeltsAgg[law=="0",],stat="identity", alpha=.5)

## ---- trellisbar                  --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,.(year,law)]

ggplot(seatbeltsAgg, aes(x=year, y=DriversKilled)) +
  geom_bar(stat="identity")+
  facet_wrap(~law)

## ---- trellisstackedbar           --------------
seatbeltsAgg<-seatbelts[
  ,.(DriversKilled = sum(DriversKilled))
  ,.(year,law,PetrolPrice=cut(PetrolPrice,breaks = 5))]

ggplot(seatbeltsAgg, aes(x=year, y=DriversKilled, fill=PetrolPrice)) +
  geom_bar(stat="identity")+
  facet_wrap(~law)

## ---- trellisscatter              --------------
ggplot(seatbelts, aes(x=PetrolPrice, y=DriversKilled)) +
  geom_point()+
  facet_wrap(~law)

## ---- trellishistogram            --------------
ggplot(seatbelts, aes(x=PetrolPrice, y=..count..) )+
  geom_histogram()+
  facet_wrap(~law)

## ---- trelliscolouredscatterplot  --------------
ggplot(seatbelts, aes(x=PetrolPrice, y=DriversKilled
                      , colour = as.factor(law))) +
  geom_point()+
  facet_wrap(~law)

## ---- steamgraph                  --------------
## ---- networkgraph                --------------
GGally::ggnet2(graphNet)

## ---- beechart                    --------------
ggplot(seatbelts, aes(x=as.factor(law), y=DriversKilled)) +
  ggbeeswarm::geom_beeswarm()

## ---- stripplot                   --------------
## ---- slopegraph                  --------------

