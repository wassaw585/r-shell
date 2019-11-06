library(rmarkdown)

args <- unlist(commandArgs(trailingOnly = TRUE))

length(args)

#same as hitting knit, uses the default parameters
#render("code/surveys-report.Rmd")


for(arg in args)
{
  arg
  render(input = "surveys-report.Rmd",     # file to render
         output_dir = "reports",                #select output directory
         params = list(file=args)   #sets the file parameter to plot1
        )
}