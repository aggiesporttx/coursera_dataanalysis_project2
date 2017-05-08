library(ggplot2)
setwd("D:/online classes/data analysis/project 2")

##read in emisions data
emisions_data = readRDS("summarySCC_PM25.rds")

##read in source code table
source_code_data = readRDS("Source_Classification_Code.rds")



##Question 2 
##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
##Use the base plotting system to make a plot answering this question.
##get maryland data
maryland_emissions= emisions_data[emisions_data$fips=="24510",]
##aggregate by year
yearly_maryland_emissions =  	aggregate(Emissions ~year, maryland_emissions,sum)

##plot it
png('plot2.png')
barplot(height=maryland_emissions$Emissions, names.arg=maryland_emissions$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in Baltimore City by specificed years'))
dev.off()
