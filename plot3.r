library(ggplot2)
setwd("D:/online classes/data analysis/project 2")

##read in emisions data
emisions_data = readRDS("summarySCC_PM25.rds")

##read in source code table
source_code_data = readRDS("Source_Classification_Code.rds")


##Question 3
##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have 
##seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
##Use the ggplot2 plotting system to make a plot answer this question.
##get maryland data
maryland_emissions= emisions_data[emisions_data$fips=="24510",]
##aggregate by year
yearly_type_maryland_emissions =  	aggregate(Emissions ~year + type, maryland_emissions,sum)

##plot it
png('plot3.png')
g = ggplot(yearly_type_maryland_emissions , aes(year, Emissions, color = type))
g = g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City - 1999 to 2008')
print(g)
dev.off()
