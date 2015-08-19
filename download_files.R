# Course project 2 - exploratory data analysis

# If the file does not exist, download it
File <- "NEI_data.zip"
if(!file.exists(File)) {
        archiveURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
        download.file(url=archiveURL,destfile=File)
}
if(!(file.exists("summarySCC_PM25.rds") && 
             file.exists("Source_Classification_Code.rds"))) { unzip(File) }
