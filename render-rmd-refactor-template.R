library(rmarkdown)
library(stringr)


parse_arguments <- function(file_names){

  ## Input: a vector with terminal input
  ## output: a vector of files to render
 
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
  return(file_names)
}

render_doc <- function(file){
  
  #input: a csv file to run the Rmd on
  #output: an .html file written to the reports folder.

  out_name <- str_split_fixed(string = file,
                              pattern = "[/|.]",
                              n = 3)
  out_name <- str_c(out_name[2], '.html')
  render(input = "surveys-report.Rmd",
         output_file = out_name,
         output_dir = "reports",
         params = list(file = file))
}

render_docs <- function(file_names){
  #input: a vector of file names
  #output: calls the render_doc function for each file

  for(file in file_names){
    render_doc(file)
  }
}

main<-function(){
  #call functions from above to render the documents
  
  file_names <- commandArgs(trailingOnly = TRUE)
  files <- parse_arguments(file_names)
  render_docs(files)
}

main() # calls the main function
