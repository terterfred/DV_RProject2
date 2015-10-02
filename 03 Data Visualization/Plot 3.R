require(tidyr)
require(dplyr)
require(tm)
require(wordcloud)
require(ggplot2)
setwd("/Users/Fred/DV_RProject2/01 Data")

file_path <- "DfTRoadSafety_Accidents_2014.reformatted.csv"

Traffic <- read.csv(file_path, stringsAsFactors = FALSE)

#Geographical distribution of Accident
Traffic %>% select(Day_of_Week,Latitude,Longitude,Date,Accident_Index) %>% mutate(percent = cume_dist(Accident_Index)) %>% filter(percent <= 0.01)%>% ggplot(aes(x = Longitude, y = Latitude)) + geom_point(aes(color=Day_of_Week))
