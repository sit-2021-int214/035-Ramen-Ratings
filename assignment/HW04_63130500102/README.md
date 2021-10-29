# R-Assignment 4

**Created by Wongsakorn Saengsurasak (ID: 63130500102)**
  
  Choose Dataset:
  1. Top 270 Computer Science / Programing Books (Data from Thomas Konstantin, [Kaggle](https://www.kaggle.com/thomaskonstantin/top-270-rated-computer-science-programing-books)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv)

### Outlines
1. Explore the dataset
2. Learning function from Tidyverse
3. Transform data with dplyr and finding insight the data
4. Visualization with GGplot2

## Part 1: Import and Explore the dataset

```R
#install
install.packages("dplyr")
install.packages("readr")
install.packages("ggplot2")
install.packages("stringr")
#Library
library(dplyr)
library(stringr)
library(readr)
library(ggplot2)
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
- using function from [dplyr](https://dplyr.tidyverse.org/index.html) to find book title about adventure
```{R}
csv_books %>% 
  filter(stringr::str_detect(Book_title,"Adventure")) %>% 
  group_by(Type) %>% 
  select(Book_title,Rating,Price,Type) %>%
  arrange(desc(Rating))
```
Result:
```{R}
 A tibble: 3 x 4
# Groups:   Type [2]
  Book_title                                                          Rating Price Type     
  <chr>                                                                <dbl> <dbl> <chr>    
1 Adventures in Minecraft                                               4.37  21.0 Paperback
2 Ghost in the Wires: My Adventures as the World's Most Wanted Hacker   3.97  12.9 Hardcover
3 The Quark and the Jaguar: Adventures in the Simple and the Complex    3.85  16.4 Paperback
```
## Part 3: Transform data with dplyr and finding insight the data
### 1). Mean book price
```{R}
mean(csv_books$Price)
```
### Result
```{R}
[1] 54.54186
```
### 2). Books title with rating more than 4.5
```{R}
csv_books %>% 
  select(Book_title,Rating) %>%
  filter(Rating > 4.5)
```
### Result
```{R}
                                                                                                 Book_title Rating
1                                           ZX Spectrum Games Code Club: Twenty fun games to code and learn   4.62
2                                                                                   Your First App: Node.js   5.00
3                       The Elements of Computing Systems: Building a Modern Computer from First Principles   4.54
4               Build Web Applications with Java: Learn every aspect to build web applications from scratch   4.67
5  Designing Data-Intensive Applications: The Big Ideas Behind Reliable, Scalable, and Maintainable Systems   4.72
6                             The Linux Programming Interface: A Linux and Unix System Programming Handbook   4.62
7                                                                  Practical Object Oriented Design in Ruby   4.54
8                                                  Fluent Python: Clear, Concise, and Effective Programming   4.67
9                                                                          CLR via C# (Developer Reference)   4.58
10                                                  The Art of Computer Programming, Volumes 1-4a Boxed Set   4.77
```
### 3). Count each type
```{R}
csv_books %>%
  group_by(Type) %>% count()
```
### Result
```{R}
# A tibble: 6 x 2
# Groups:   Type [6]
  Type                      n
  <chr>                 <int>
1 Boxed Set - Hardcover     1
2 ebook                     7
3 Hardcover                95
4 Kindle Edition           10
5 Paperback               156
6 Unknown Binding           2
```
### 4). Book title with less than 200 pages
```{R}
csv_books %>% 
  select(Book_title,Number_Of_Pages) %>%
  filter(Number_Of_Pages < 200)
```
### Result
```{R}
                                                                                              Book_title Number_Of_Pages
1                                                                                  The Elements of Style             105
2                                                           Responsive Web Design Overview For Beginners              50
3                                        ZX Spectrum Games Code Club: Twenty fun games to code and learn             128
4  Debugging: The 9 Indispensable Rules for Finding Even the Most Elusive Software and Hardware Problems             192
5                                       What Is Life? with Mind and Matter and Autobiographical Sketches             184
6                                                                             JavaScript: The Good Parts             153
7                                    The Pattern on the Stone: The Simple Ideas that Make Computers Work             176
8                                                                                 The Connection Machine             190
9                                                          Agile Retrospectives: Making Good Teams Great             170
10                                                                        Scrum and XP from the Trenches             140
11                                 Apprenticeship Patterns: Guidance for the Aspiring Software Craftsman             176
12                                                          The Principles of Object-Oriented JavaScript             120
13                         Python Programming For Beginners: Quick And Easy Guide For Python Programmers             190
14                                           The Golden Ticket: P, Np, and the Search for the Impossible             176
15                                                         Blueprints Visual Scripting for Unreal Engine             188
16                                                                   Learn You a Haskell for Great Good!             176
17                                       Think Complexity: Complexity Science and Computational Modeling             160
18                                                                                         A Tour of C++             192
19                                                        The Visual Display of Quantitative Information             197
20                           The It Handbook for Business: Managing Information Technology Support Costs             180
21                                    DIV, Grad, Curl, and All That: An Informal Text on Vector Calculus             176
22                                               Lambda-Calculus, Combinators and Functional Programming             192
```
### 5). Min book price
```{R}
csv_books %>% 
  select(Book_title,Price) %>% 
  filter(Price == min(Price)) 
```
### Result
```{R}
Book_title    Price
1 The Elements of Style 9.323529
```
### 6). Max number of pages
```{R}
csv_books %>% 
  select(Book_title,Number_Of_Pages) %>% 
  filter(Number_Of_Pages == max(Number_Of_Pages)) 
```
### Result
```{R}
                                               Book_title Number_Of_Pages
1 The Art of Computer Programming, Volumes 1-4a Boxed Set            3168
```
## Part 4: Visualization with GGplot2
### 1). Pie chart of Rating of each Type
```{R}
ggplot(csv_books, aes(x="", y=Rating, fill=Type)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)
```
### Result 
![piechartratetype](./piechartratetype.png)

### 2). Scatter plot of price and Rating
```{R}
ggplot(csv_books, aes(x=Price, y=Rating)) + 
  geom_point()
```
### Result 
![scatterpricerate](./scatterpricerate.png)

