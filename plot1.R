# Course project 2 - exploratory data analysis

## reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Have total emissions from PM2.5 decreased in the United States from 1999 to 
##2008? Using the base plotting system, make a plot showing the total PM2.5 
##emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#aggregate the data in the desired format
totalemissions <- aggregate(Emissions ~ year,NEI, sum)

png(file="plot1.png",width=480,height=480,)
barplot(totalemissions$Emissions,
        totalemissions$year,
        xlab="Year",
        ylab="PM2.5 Emissions (Tons)",
        main="Total PM2.5 Emissions From All US Sources"
)
dev.off()
