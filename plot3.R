# Course project 2 - exploratory data analysis

#check if the files were downloaded
source("download_files.R")

#load ggplot2 library
library(ggplot2)

## reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Of the four types of sources indicated by the type (point, nonpoint, onroad,
##nonroad) variable, which of these four sources have seen decreases in 
##emissions from 1999–2008 for Baltimore City? Which have seen increases 
##in emissions from 1999–2008? Use the ggplot2 plotting system to make a 
##plot answer this question.

#subset only the data from Baltimore
balt_NEI <- NEI[NEI$fips=="24510",]

#aggregate the data in the desired format
totalemissions <- aggregate(Emissions ~ year,balt_NEI, sum)

#make the plot using the ggplot2 library and export the png file
png(file="plot3.png",width=900,height=480,)
plot3 <- ggplot(balt_NEI,aes(factor(year),Emissions,fill=type)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill=FALSE)+
        facet_grid(.~type,scales = "free",space="free") + 
        labs(x="Year", y="Total PM 2.5 Emission (Tons)") + 
        labs(title="Total PM 2.5 Emissions, Baltimore City 1999-2008 by Source Type")
print(plot3)
dev.off()
