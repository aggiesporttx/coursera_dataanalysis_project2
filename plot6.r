library(ggplot2)
setwd("D:/online classes/data analysis/project 2")

##read in emisions data
emisions_data = readRDS("summarySCC_PM25.rds")

##read in source code table
source_code_data = readRDS("Source_Classification_Code.rds")

##Question 6
##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in 
##Los Angeles County, California (fips == "06037"). 
##Which city has seen greater changes over time in motor vehicle emissions?
##merge data
merged_data <- merge(emisions_data, source_code_data, by="SCC")

##get baltimore and la data
baltimore_and_la = merged_data[(merged_data$fips=="24510"|merged_data$fips=="06037") & merged_data$type=="ON-ROAD",  ]

##aggregate
yearly_emisions = aggregate(Emissions ~ year + fips, baltimore_and_la , sum)
baltimore_and_la$fips[yearly_emisions$fips=="24510"] = "Baltimore City, Maryland"
baltimore_and_la$fips[yearly_emisions$fips=="06037"] = "Los Angeles, California"

##plot it
png("plot6.png")
g <- ggplot(baltimore_and_la, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions  Baltimore City compared to Los Angeles - 1999 to 2008')
print(g)
dev.off()



