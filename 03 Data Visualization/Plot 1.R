require(tidyr)
require(dplyr)
require(tm)
require(wordcloud)
require(ggplot2)

setwd("/Users/Fred/DV_RProject2/01 Data")

file_path <- "DfTRoadSafety_Accidents_2014.reformatted.csv"

Traffic <- read.csv(file_path, stringsAsFactors = FALSE)

# Plot the time with high accident frequency in Q1
select(Traffic,Time,Date) %>% filter(Date >= '01/01/2014' & Date <= '31/03/2014') %>% select(Time) %>% paste(.$text, collapse = "") %>% VectorSource() %>% Corpus() %>% DocumentTermMatrix() %>% as.matrix() %>% colSums() -> freq

set.seed(142)
wordcloud(names(freq), freq, min.freq=5, scale=c(5, .1), colors=brewer.pal(6, "Dark2"))
