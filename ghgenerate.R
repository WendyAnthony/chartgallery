library(rmarkdown)
render("charting.Rmd", output_file = "index.html"
       , output_dir = "out")
render("ggvis.Rmd", output_dir = "out")
