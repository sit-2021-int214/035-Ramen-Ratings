# 🍜 035-Ramen-Ratings 🍜
Datasets from: [Ramen Ratings](https://github.com/sit-2021-int214/035-Ramen-Ratings/blob/main/ramen-ratings-original.csv)

## ⭕ About's Ramen Ratings Datasets

This dataset is about's over 2500 ramen ratings that are collected from around the world. This dataset has 2580 observations with 6 variables. It includes
1. `Review`
2. `Brand` 
3. `Variety` 
4. `Style` 
5. `Country` 
6. `Stars` 
7. `Top Ten` 

## 📜 Overview
เมื่อเราพูดถึง Ramen คงคิดว่าอาหารนี้อยู่ที่ประเทศญี่ปุ่นเพียงประเทศเดียว แต่ที่จริงแล้ว ramen นั้นมีหลายประเทศทั่วโลกที่ให้ความสนใจและนำมันไปขายในประเทศของตนเองจนเกิดอุสาหกรรม ramen ขึ้น ซึ่งกลุ่มของเราได้สนใจในอุสาหกรรมของ ramen และต้องการศึกษาข้อมูลของ ramen ทั่วโลก กลุ่มของเราจึงเลือกชุดข้อมูล Ramen Ratings เพราะต้องการศึกษา ความนิยมหรือความชื่นชอบของผู้คนที่มีผลต่ออุตสาหกรรม ramen ว่ามีมากแค่ไหน และอุตสาหกรรม ramen นั้นมีที่ไหนบ้าง และที่ไหนที่ได้รับความนิยมมากที่สุด

## 🧰 Tools

- R language
- R Studio Desktop
- Power BI

## 🎯 My Step
1. Download dataset and Library 
2. Cleaning dataset
3. Analytical Inferential Statistics
4. Data Visualization

## Step1️⃣ : Download dataset and Library 
``` ruby
# Loading Library
library(readr)
library(dplyr)
library(stringr)
library(assertive)
library(DescTools)

# Loading Dataset
ramen_ratings <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/035-Ramen-Ratings/main/ramen-ratings.csv")
ramen <- ramen_rating
```

## Step2️⃣ : Cleaning dataset
#### 2.1 ตรวจสอบ type ของ dataset
``` ruby
glimpse(ramen_rating)
```
#### ผลลัพธ์
``` ruby
Rows: 2,580
Columns: 7
$ Review.. <int> 2580, 2579, 2578, 2577, 2576, 2575, 2574, 2573, 2572, 2571, 2570, 2569, 2568, 2567, 2566, ~
$ Brand    <chr> "New Touch", "Just Way", "Nissin", "Wei Lih", "Ching's Secret", "Samyang Foods", "Acecook"~
$ Variety  <chr> "T's Restaurant Tantanmen ", "Noodles Spicy Hot Sesame Spicy Hot Sesame Guan-miao Noodles"~
$ Style    <chr> "Cup", "Pack", "Cup", "Pack", "Pack", "Pack", "Cup", "Tray", "Pack", "Pack", "Pack", "Pack~
$ Country  <chr> "Japan", "Taiwan", "USA", "Taiwan", "India", "South Korea", "Japan", "Japan", "Japan", "Si~
$ Stars    <chr> "3.75", "1", "2.25", "2.75", "3.75", "4.75", "4", "3.75", "0.25", "2.5", "5", "5", "4.25",~
$ Top.Ten  <chr> "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""~
```

#### 2.2 เปลี่ยนชื่อตัวแปร
``` ruby
ramen <- ramen %>% rename(
  
  Type_of_ramen = Variety,
  Review_Number = Review..
  
  )
```

#### 2.3 จัดเรียงข้อมูล
``` ruby
ramen <- ramen %>% 
      arrange(ramen,Review_Number)
```

#### 2.4 ลบ column Top ten ออก
``` ruby
ramen <- ramen %>% 
      select(-Top.Ten)
```

#### 2.5 แปลงข้อมูลจาก character เป็น numeric
``` ruby
is.numeric(ramen$Stars)
ramen$Stars <- ramen$Stars %>% str_remove("Unrated") %>% as.numeric() 
```

## Step3️⃣ : Analytical Inferential Statistics
### No.1 : Brand ที่มีความนิยมสูงที่สุดในแต่ละประเทศ มีอะไรบ้าง



## Step4️⃣ : Data Visualization
