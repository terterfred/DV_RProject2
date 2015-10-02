require(tidyr)
require(dplyr)
require(tm)
require(wordcloud)
require(ggplot2)

setwd("/Users/Fred/DV_RProject2/01 Data")

file_path <- "DfTRoadSafety_Accidents_2014.reformatted.csv"

Traffic <- read.csv(file_path, stringsAsFactors = FALSE)

# Accidents number ~ Weather Conditions,Road Surface_Conditions,Speed limit
Traffic %>% group_by(Weather_Conditions,Road_Surface_Conditions,Speed_limit  ) %>% summarise(count = n()) %>% ggplot(aes(x=Speed_limit, y=count, color=Road_Surface_Conditions)) + geom_point() + facet_wrap(~Weather_Conditions)
