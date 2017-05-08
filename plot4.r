library(ggplot2)
setwd("D:/online classes/data analysis/project 2")

##read in emisions data
emisions_data = readRDS("summarySCC_PM25.rds")

##read in source code table
source_code_data = readRDS("Source_Classification_Code.rds")




##Question 4
##Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
##merge the datasets
merged_data <- merge(emisions_data, source_code_data, by="SCC")
##pull out coal
coal = grepl("coal", merged_data$Short.Name, ignore.case=TRUE)
coal = merged_data[coal , ]
##aggregate by year
yearly_coal_data = aggregate(Emissions ~ year, coal ,  sum)

##plot it
png("plot4.png")
g = ggplot(yearly_coal_data, aes(factor(year), Emissions))
g = g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources - 1999 to 2008')
print(g)
dev.off()