library("rmarkdown")
library("stringr")

file_names <- commandArgs(trailingOnly = TRUE)

for(file in file_names)
{
  out_name <- str_split_fixed(string = file,
                              pattern = "[/|.]",
                              n = 3)
  out_name <- str_c(out_name[2], '.html')
  render(input = "surveys-report.Rmd",
         output_file = out_name,
         output_dir = "reports",
         params = list(file = file))
  }
