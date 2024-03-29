library(tidyverse)
univ = read.csv("C:/Users/zeeha/Desktop/qs-world-university-rankings-2017-to-2022-V2.csv")
glimpse(univ)
univ$rank = as.integer(univ$rank_display, na.rm = FALSE)
glimpse(univ)
top_10_univ <- univ %>% filter(rank <= 10) %>% select(university, score, rank, year)
top_10_univ %>% ggplot(aes(x = year, y = score, fill = university)) + geom_line(color="red", linewidth=1.2,show.legend = FALSE) + geom_point(color="black", size=2, show.legend = FALSE) + facet_wrap(~university)
