if(!require(data.table)) install.packages("data.table")
library(data.table)

seatbelts<-data.table(date=seq(as.Date("1969-01-01")
                               ,as.Date("1984-12-01")
                               ,by = "month")
                      , Seatbelts)[
                        ,year:=year(date)
                      ]
