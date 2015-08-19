# Course project 2 - exploratory data analysis

#check if the files were downloaded
source("download_files.R")

## reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Across the United States, how have emissions from coal combustion-related 
##sources changed from 1999–2008?

#subset only the data from coal combustion-related sources
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

#aggregate the data in the desired format
totalemissions <- aggregate(Emissions ~ year,combustionNEI, sum)

png(file="plot4.png",width=480,height=480,)
barplot(totalemissions$Emissions,
        names.arg=totalemissions$year,
        xlab="Year",
        ylab="PM2.5 Emissions (Tons)",
        main="Total US PM2.5 emissions from coal combustion-related sources"
)
dev.off()
