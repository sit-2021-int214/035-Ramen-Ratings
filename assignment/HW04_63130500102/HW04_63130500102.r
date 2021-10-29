# Library
install.packages("dplyr")
install.packages("readr")
install.packages("ggplot2")
install.packages("stringr")
install.packages("tidyr")

library(dplyr)
library(readr)
library(ggplot2)
library(stringr)
library(tidyr)

# Load data
prog_book <- read.csv('https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv')

# Explore data
glimpse(prog_book)
View(prog_book)

# Learning function
prog_book %>% select(Book_title,Rating) %>% filter(Rating>4.50) %>% arrange(desc(Rating))



# 1
prog_book %>% select(Book_title,Rating,Price) %>% filter(Price == min(Price))

# 2
prog_book %>% select(Book_title,Type) %>% filter(Type == "ebook")

# 3
prog_book %>% group_by(Type) %>% summarise(avg=mean(Rating))

# 4
prog_book %>% select(Book_title,Reviews,Number_Of_Pages) %>% filter(Reviews == 0,Number_Of_Pages < 200)

# 5
prog_book %>% select(Book_title, Rating) %>% arrange(Rating) %>% head(n = 5)

# 6
str_subset(prog_book$Book_title,"Data")



#graph1
ggplot(prog_book) + aes(x = Type, color = Type, fill = Type) + geom_density(alpha = 0.25) + ggtitle("Number of type of book") + xlab("Type")+ylab("Count")

#graph2
prog_book %>%ggplot(aes(x=Rating,y=Number_Of_Pages)) + geom_point()




