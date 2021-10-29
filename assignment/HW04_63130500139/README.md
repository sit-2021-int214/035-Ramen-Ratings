# R-Assignment 4

**Created by Chayatorn Lertthasanawong (ID: 63130500139)**
  
  Choose Dataset:
  1. Top 270 Computer Science / Programing Books (Data from Thomas Konstantin, [Kaggle](https://www.kaggle.com/thomaskonstantin/top-270-rated-computer-science-programing-books)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv)

### Outlines
1. Explore the dataset
2. Learning function from Tidyverse
3. Transform data with dplyr and finding insight the data
4. Visualization with GGplot2

## Part 1: Import and Explore the dataset

```R
#Library
library(dplyr , readr , ggplot2)
csv_books <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
#Explore
is.character(csv_books$Reviews)
csv_books$Reviews <- csv_books$Reviews %>% str_remove(',') %>% as.numeric()
glimpse(csv_books)
```

### Result

```{R}
Rows: 271
Columns: 7
$ Rating          <dbl> 4.17, 4.01, 3.33, 3.97, 4.06, 3.84, 4.09, 4.15, 3.87, 4.62, 4.03, 3.78, 3.73, 3.87, 3.87,~
  $ Reviews         <dbl> 3829, 1406, 0, 1658, 1325, 117, 5938, 1817, 2093, 0, 160, 481, 33, 1255, 593, 417, 80, 27~
  $ Book_title      <chr> "The Elements of Style", "The Information: A History, a Theory, a Flood", "Responsive Web~
$ Description     <chr> "This style manual offers practical advice on improving writing skills. Throughout, the e~
  $ Number_Of_Pages <int> 105, 527, 50, 393, 305, 288, 256, 368, 259, 128, 352, 352, 200, 328, 240, 288, 392, 304, ~
  $ Type            <chr> "Hardcover", "Hardcover", "Kindle Edition", "Hardcover", "Kindle Edition", "Paperback", "~
$ Price           <dbl> 9.323529, 11.000000, 11.267647, 12.873529, 13.164706, 14.188235, 14.232353, 14.364706, 14~
```
จากการสำรวจข้อมูลได้ผลสรุปว่า มีจำนวนแถวทั้งหมด 271 แถว และมีคอลัมน์ทั้งหมด 7 คอลัมน์ โดยแบ่งได้ดังนี้
|      Name       | Datatype|
|-----------------|---------|
|1. Rating          |double   |
|2. Reviews         |character|
|3. Book_title      |character|
|4. Description     |character|
|5. Number_Of_Pages |integer  |
|6. Type            |character|
|7. Price           |double   |
## Part 2: Learning function from Tidyverse
- Function `geom_line()` from package [ggplot2](https://ggplot2.tidyverse.org/reference/geom_path.html?q=geom%20_%20line)). The result is displayed as a line graph.
## Part 3: Transform data with dplyr and finding insight the data
