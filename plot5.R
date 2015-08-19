# Course project 2 - exploratory data analysis

#check if the files were downloaded
source("download_files.R")

## reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##How have emissions from motor vehicle sources changed from 1999–2008 in 
##Baltimore City?

#subset only the data from Baltimore
balt_NEI <- NEI[NEI$fips=="24510",]

#subset only the data from coal vehicle sources
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- balt_NEI[balt_NEI$SCC %in% vehiclesSCC,]

#aggregate the data in the desired format
totalemissions <- aggregate(Emissions ~ year,vehiclesNEI, sum)

png(file="plot5.png",width=480,height=480,)
barplot(totalemissions$Emissions,
        names.arg=totalemissions$year,
        xlab="Year",
        ylab="PM2.5 Emissions (Tons)",
        main="Total US PM2.5 emissions from vehicles sources in Baltimore City"
)
dev.off()
