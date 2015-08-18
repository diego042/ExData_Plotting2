# Course project 2 - exploratory data analysis

## reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Have total emissions from PM2.5 decreased in the United States from 1999 to 
##2008? Using the base plotting system, make a plot showing the total PM2.5 
##emission from all sources for each of the years 1999, 2002, 2005, and 2008.

y1999<-sum(subset(NEI$Emissions, subset=NEI$year==1999))
y2002<-sum(subset(NEI$Emissions, subset=NEI$year==2002))
y2005<-sum(subset(NEI$Emissions, subset=NEI$year==2005))
y2008<-sum(subset(NEI$Emissions, subset=NEI$year==2008))

yearsX<-c(1999,2002,2005,2008)
yearsY<-c(y1999,y2002,y2005,y2008)

png(file="plot1.png",width=480,height=480,)
plot(x=yearsX,y=yearsY,xlab="Year",ylab="Total emissions (tons)",
     main="US total emissions from PM2.5")
model<-lm(yearsY~yearsX)
abline(model)
dev.off()
