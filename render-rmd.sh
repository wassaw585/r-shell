for filename in data/plot1.csv data/plot2.csv
do
   Rscript render-rmd.R $filename
done