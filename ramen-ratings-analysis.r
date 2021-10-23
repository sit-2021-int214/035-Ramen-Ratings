#Loading Library
library(readr)
library(dplyr)
library(stringr)
library(assertive)
library(DescTools)

#Loading Dataset
ramen_rating <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/035-Ramen-Ratings/main/ramen-ratings-original.csv")
ramen <- ramen_rating

#Rename
ramen <- ramen %>% rename(
  
  Type_of_ramen = type_of_ramen,
  Review_Number = Review_No.
  
  )

#SortData
ramen <- ramen %>% arrange(ramen,Review_Number)

#Change character to numeric
is.numeric(ramen$Stars)
ramen$Stars <- ramen$Stars %>% str_remove("Unrated") %>% as.numeric()

#Remove top.ten
ramen <- ramen %>% select(-Top.Ten)

glimpse(ramen)
View(ramen)

write.csv(ramen,file = "C:/Users/HP/Documents/ramen_clean.csv", row.names = FALSE)

#1.
ramen %>% count(ramen$Style)

#2.
ramen %>% select(Type_of_ramen) %>% filter(ramen$Stars==5) 

#3.
ramen %>% filter(ramen$Country == "Thailand") %>% count(Brand)

#4.
#ramen %>% filter(ramen$Style == "Pack") %>% count(Country)
ramen %>% filter(ramen$Style == "Pack") %>% summarise(Mode(Country))

#5.
ramen %>% summarise(Mode(Brand))
#ramen %>% count(Brand)
