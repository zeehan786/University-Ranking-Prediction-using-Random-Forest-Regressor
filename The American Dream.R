library(tidyverse)
univ = read.csv("C:/Users/zeeha/Desktop/qs-world-university-rankings-2017-to-2022-V2.csv")
glimpse(univ)
univ$international_students <- gsub(",", "", univ$international_students)
univ$international_students = as.integer(univ$international_students, na.rm = FALSE)
sum(is.na(univ$international_students))
univ <- univ %>% drop_na(international_students)
sum(is.na(univ$international_students))
glimpse(univ)
int_students_country <- univ %>% group_by(country) %>% summarize(total_international_students = sum(international_students))
int_students_country <-int_students_country[order(-int_students_country$total_international_students),]
int_students_country_top_10 <- head(int_students_country, 10)
int_students_country_top_10 %>% ggplot(aes(x = total_international_students, y = reorder(country, +total_international_students))) + labs(x = "International Students", y = "Country") + ggtitle("THE AMERICAN DREAM") +
  theme(plot.title = element_text(hjust = 0.5)) + geom_bar(stat = "identity", fill=rgb(0.1,0.4,0.5,0.7) )
