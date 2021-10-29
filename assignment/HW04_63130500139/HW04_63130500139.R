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


