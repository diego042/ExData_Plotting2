# Course project 2 - exploratory data analysis

#load ggplot2 library
library("ggplot2")

#check if the files were downloaded
source("download_files.R")

## reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Compare emissions from motor vehicle sources in Baltimore City with emissions
##from motor vehicle sources in Los Angeles County, California (fips == "06037").
##Which city has seen greater changes over time in motor vehicle emissions?

# subset data just from vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the data for each city
vehiclesBalt <- vehiclesNEI[vehiclesNEI$fips=="24510",]
vehiclesBalt$city <- "Baltimore"
vehicleslos <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehicleslos$city <- "Los Angeles"

# Combine the two subsets
bothNEI <- rbind(vehiclesBalt,vehicleslos)

#make the plot
png(file="plot6.png",width=480,height=480,)
plot6 <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
        geom_bar(aes(fill=year),stat="identity") +
        facet_grid(scales="free", space="free", .~city) +
        guides(fill=FALSE) + theme_bw() +
        labs(x="Year", y="Total PM2.5 Emission (Tons)") + 
        labs(title="PM2.5 Motor Vehicle Source Emissions in Baltimore & LA")
print(plot6)
dev.off()
