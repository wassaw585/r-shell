library(rmarkdown)

#same as hitting knit, uses the default parameters
#render("code/surveys-report.Rmd")

render(input = "code/surveys-report.Rmd",     # file to render
       output_dir = "reports",                #select output directory
       params = list(file="data/plot1.csv",   #sets the file parameter to plot1
                     sex = "F")               #sets the sex variable to F
)
