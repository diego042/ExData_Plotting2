# Course project 2 - exploratory data analysis

#check if the files were downloaded
source("download_files.R")

## reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
##(fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
##plot answering this question.

#subset only the data from Baltimore
balt_NEI <- NEI[NEI$fips=="24510",]

#aggregate the data in the desired format
totalemissions <- aggregate(Emissions ~ year,balt_NEI, sum)

#make the plot using the base plot system
png(file="plot2.png",width=480,height=480,)
barplot(totalemissions$Emissions,
        names.arg=totalemissions$year,
        xlab="Year",
        ylab="PM2.5 Emissions (Tons)",
        main="Total PM2.5 Emissions From all Baltimore City Sources"
)
dev.off()
