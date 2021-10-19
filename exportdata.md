# Ramen Ratings
Dataset from : https://github.com/sit-2021-int214/035-Ramen-Ratings/blob/main/ramen-ratings.csv

## My Step
1. Search datasets from Kaggle
2. Explore the dataset from the original dataset
3. Download Library and dataset
4. Exploratory Data Analysis
5. Cleaning Dataset
6. Define a question
7. Exploratory Data Analysis with Stat

## Step 1 Search datasets from Kaggle
เนื่องจากพวกเรามีความสนใจในรสชาติของราเม็ง เราจึงทำการหา dataset จาก kaggle และไปเจอกับ dataset ramen ratings มาจึงนำ dataset นี้มาใช้
dataset จาก : https://www.kaggle.com/residentmario/ramen-ratings?select=ramen-ratings.csv

## Step 2 Explore the dataset from the original dataset
ชุดข้อมูลที่ได้มานั้นเกี่ยวกับคนที่ได้ไปกินราเม็งมาจากสถานที่ต่างๆ หลากหลายรูปแบบ โดยมีข้อมูลต่างๆ เช่น ชื่อสินค้า ประเภท คะแนนที่ให้ ฯลฯ โดยใน dataset นี้เป็นข้อมูลของราเม็งต่างๆของราเม็งทั้งหมด 2580 ชื่อและ ตัวแปรทั้งหมด 7 ตัว(2580 varieties with 7 variables) ตัวแปรทั้งหมดประกอบไปด้วย

1. `Review #`
2. `Brand` 
3. `Variety` 
4. `Style` 
5. `Country` 
6. `Stars` 
7. `Top Ten` 

## Step 3 Download Library and dataset
```{R}
#Loading Library
library(readr)
library(dplyr)
library(stringr)
library(assertive)

#Loading Dataset
ramen_ratings <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/035-Ramen-Ratings/main/ramen-ratings.csv")
ramen <- ramen_rating
```

## Step 4 Exploratory Data Analysis
ตัวแปรทั้ง 7 ตัว มีควาหมายดังนี้
1. Review # = ลำดับที่รีวิว
2. Brand    = ยี่ห้อของราเม็ง
3. Variety  = ชื่อเรียกของราเม็ง
4. Style    = ภาชนะที่ใส่
5. Country  = ประเทศที่ผลิต
6. Stars    = คะแนนที่ให้
7. Top ten  = อันดับของราเม็งที่ได้ในปีนั้นๆ(นับแค่ top 10)

หลังจากที่ดูความหมายของตัวแปรทั้งหมดแล้ว พบว่ามีบางชื่อที่ดูแล้วอาจสับสนได้นั่นคือ Review # และ variety
เราจึงทำการเปลี่ยนชื่อจาก Review # -> Review_Number และ variety เป็น Type_of_ramen
และเราได้ทำการนำข้อมูล Top ten ออก เนื่องจากมี 2 ข้อมูลใน column เดียวกันเวลาเรียงข้อมูลอาจำทำให้สับสนได้
และ column stars ต้องการให้เก็บแค่ numeric เพราะ มีการเก็บค่าทั้งตัวเลขและคำว่า unrate เราจึงทำการ นำ unrated ออก เพื่อให้เก็บค่าเป็นตัวเลขเพียงอย่างเดียว

## Step 5 Cleaning Dataset
# Check type ของ dataset
```{R}
glimpse(ramen_rating)
```
# Result
```{R}
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

# เปลี่ยนชื่อตัวแปร
```{R}
ramen <- ramen %>% rename(
  
  Type_of_ramen = Variety,
  Review_Number = Review..
  
  )
```

# จัดเรียงข้อมูล
```{R}
ramen <- ramen %>% arrange(ramen,Review_Number)
```

# ลบ column Top ten ออก
```{R}
ramen <- ramen %>% select(-Top.Ten)
```

# แปลงข้อมูลจาก character เป็น numeric
```{R}
is.numeric(ramen$Stars)
ramen$Stars <- ramen$Stars %>% str_remove("Unrated") %>% as.numeric() 
```


## Step 6 Defind a question
1. Sytle ของราเมงมีทั้งหมดกี่แบบ แต่ละแบบมีเท่าไหร่
2. จงแสดง Type of Ramen ที่ Stars เท่ากับ 5
3. จงแสดง Brand ทั้งหมดที่ผลิตในประเทศไทย
4.
5.

## Step 7 Exploratory Data Analysis with Stat



