install.packages("dplyr")
install.packages("readr")
install.packages("ggplot2")
install.packages("stringr")

library(dplyr)
library(readr)
library(ggplot2)
library(stringr)

csv_books <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
View(csv_books)
is.character(csv_books$Reviews)
csv_books$Reviews <- csv_books$Reviews %>% str_remove(',') %>% as.numeric()
glimpse(csv_books)

csv_books %>% 
  filter(stringr::str_detect(Book_title,"Python")) %>% 
  group_by(Type) %>% 
  select(Book_title,Rating,Price,Type) %>%
  arrange(desc(Rating))

##1
mean(csv_books$Price)
##2
csv_books %>% 
  select(Book_title,Rating) %>%
  filter(Rating > 4.5)
##3
csv_books %>%
  group_by(Type) %>% count()
##4
csv_books %>% 
  select(Book_title,Number_Of_Pages) %>%
  filter(Number_Of_Pages < 200)
##5
csv_books %>% 
  select(Book_title,Price) %>% 
  filter(Price == min(Price)) 
##6
csv_books %>% 
  select(Book_title,Number_Of_Pages) %>% 
  filter(Number_Of_Pages == max(Number_Of_Pages)) 

##piechartratetype
ggplot(csv_books, aes(x="", y=Rating, fill=Type)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)

##scatterpricerate
ggplot(csv_books, aes(x=Price, y=Rating)) + 
  geom_point()
   
