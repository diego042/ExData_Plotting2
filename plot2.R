##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
##(fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
##plot answering this question.
NEI2 <- subset(NEI, subset=NEI$fips=="24510")

y1999<-sum(subset(NEI2$Emissions, subset=NEI2$year==1999))
y2002<-sum(subset(NEI2$Emissions, subset=NEI2$year==2002))
y2005<-sum(subset(NEI2$Emissions, subset=NEI2$year==2005))
y2008<-sum(subset(NEI2$Emissions, subset=NEI2$year==2008))

yearsX<-c(1999,2002,2005,2008)
yearsY<-c(y1999,y2002,y2005,y2008)

png(file="plot2.png",width=480,height=480,)
plot(x=yearsX,y=yearsY,xlab="Year",ylab="Total emissions (tons)",
     main="Baltimore City, Maryland - total emissions from PM2.5")
model<-lm(yearsY~yearsX)
abline(model)
dev.off()
