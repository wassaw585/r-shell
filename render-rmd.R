library("rmarkdown")
library("stringr")

file_names <- commandArgs(trailingOnly = TRUE)

if("-a" %in% file_names){
  folder <- file_names[2]
  file_names <- Sys.glob(str_c(folder, "/*.csv"))
  
  if(length(file_names) == 0){
    print("No files found in the specified forlder.")
  }
} else{file_names <- file_names}

if(length(file_names) == 0){
  print("please provide a list of .csv files
        
        To specify a folder, please use the -a flag")
}

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
