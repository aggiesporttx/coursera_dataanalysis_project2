library(ggplot2)
setwd("D:/online classes/data analysis/project 2")

##read in emisions data
emisions_data = readRDS("summarySCC_PM25.rds")

##read in source code table
source_code_data = readRDS("Source_Classification_Code.rds")

##Question 1
##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
##make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
##aggregate  by year
yearly_emissions = with(emisions_data, aggregate(Emissions ~year, emisions_data,sum))

##plot it
png('plot1.png')
barplot(height=yearly_emissions$Emissions, names.arg=yearly_emissions$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' by specificed years'))
dev.off()
