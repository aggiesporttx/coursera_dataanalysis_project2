library(ggplot2)
setwd("D:/online classes/data analysis/project 2")

##read in emisions data
emisions_data = readRDS("summarySCC_PM25.rds")

##read in source code table
source_code_data = readRDS("Source_Classification_Code.rds")


##Question 5
##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

##merge the data
merged_data = merge(emisions_data, source_code_data, by="SCC")
##get baltimore motor vehicle data
baltimore_city_motor_vehicle_data = merged_data[merged_data$fips=="24510" & merged_data$type=="ON-ROAD",]
##sum up by year
yearly_baltimore_vehicle_data = aggregate(Emissions ~ year, baltimore_city_motor_vehicle_data, sum)


##plot it
png("plot5.png")
g = ggplot(yearly_baltimore_vehicle_data , aes(factor(year), Emissions))
g = g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle Baltimore City - 1999 to 2008')
print(g)
dev.off()

