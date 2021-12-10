# 🍜 Ramen Ratings
Dataset from : https://github.com/sit-2021-int214/035-Ramen-Ratings/blob/main/ramen-ratings.csv

## 🎯 My Step
1. Search datasets from Kaggle
2. Explore the dataset from the original dataset
3. Download Library and dataset
4. Exploratory Data Analysis
5. Cleaning Dataset
6. Define a question
7. Exploratory Data Analysis with Stat

## Step1️⃣: Search datasets from Kaggle
เนื่องจากพวกเรามีความสนใจในรสชาติของราเม็ง เราจึงทำการหา dataset จาก kaggle และไปเจอกับ dataset ramen ratings มาจึงนำ dataset นี้มาใช้
dataset จาก : https://www.kaggle.com/residentmario/ramen-ratings?select=ramen-ratings.csv

## Step2️⃣: Explore the dataset from the original dataset
ชุดข้อมูลที่ได้มานั้นเกี่ยวกับคนที่ได้ไปกินราเม็งมาจากสถานที่ต่างๆ หลากหลายรูปแบบ โดยมีข้อมูลต่างๆ เช่น ชื่อสินค้า ประเภท คะแนนที่ให้ ฯลฯ โดยใน dataset นี้เป็นข้อมูลของราเม็งต่างๆของราเม็งทั้งหมด 2580 ชื่อและ ตัวแปรทั้งหมด 7 ตัว(2580 varieties with 7 variables) ตัวแปรทั้งหมดประกอบไปด้วย

1. `Review`
2. `Brand` 
3. `Variety` 
4. `Style` 
5. `Country` 
6. `Stars` 
7. `Top Ten` 

## Step3️⃣: Download Library and dataset
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

## Step4️⃣: Exploratory Data Analysis
ตัวแปรทั้ง 7 ตัว มีควาหมายดังนี้
1. Review   = ลำดับที่รีวิว
2. Brand    = ยี่ห้อของราเม็ง
3. Variety  = ชื่อเรียกของราเม็ง
4. Style    = ภาชนะที่ใส่
5. Country  = ประเทศที่ผลิต
6. Stars    = คะแนนที่ให้ (0 ถึง 5)
7. Top ten  = อันดับของราเม็งที่ได้ในปีนั้นๆ (นับแค่ top 10)

หลังจากที่ดูความหมายของตัวแปรทั้งหมดแล้ว พบว่ามีบางชื่อที่ดูแล้วอาจสับสนได้นั่นคือ Review # และ variety
เราจึงทำการเปลี่ยนชื่อจาก Review # เป็น Review_Number และ variety เป็น Type_of_ramen
และเราได้ทำการนำข้อมูล Top ten ออก เนื่องจากมี 2 ข้อมูลใน column เดียวกันเวลาเรียงข้อมูลอาจทำให้สับสนได้
และ column stars ต้องการให้เก็บแค่ numeric เพราะ มีการเก็บค่าทั้งตัวเลขและคำว่า unrated เราจึงทำการ นำ unrated ออก เพื่อให้เก็บค่าเป็นตัวเลขเพียงอย่างเดียว

## Step5️⃣: Cleaning Dataset
### ตรวจสอบ type ของ dataset
```{R}
glimpse(ramen_rating)
```
### ผลลัพธ์
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

### เปลี่ยนชื่อตัวแปร
```{R}
ramen <- ramen %>% rename(
  
  Type_of_ramen = Variety,
  Review_Number = Review..
  
  )
```

### จัดเรียงข้อมูล
```{R}
ramen <- ramen %>% arrange(ramen,Review_Number)
```

### ลบ column Top ten ออก
```{R}
ramen <- ramen %>% select(-Top.Ten)
```

### แปลงข้อมูลจาก character เป็น numeric
```{R}
is.numeric(ramen$Stars)
ramen$Stars <- ramen$Stars %>% str_remove("Unrated") %>% as.numeric() 
```

## Step6️⃣: Defind a question
1. Style ของราเมงมีทั้งหมดกี่แบบ แต่ละแบบมีเท่าไหร่
2. จงแสดง Type of Ramen ที่ Stars เท่ากับ 5
3. จงแสดง Brand ทั้งหมดที่ผลิตในประเทศไทย
4. ประเทศอะไรที่มี Style เป็น Pack มากที่สุดคือประเทศใด
5. Brand อะไรที่ถูกรีวิวไปมากที่สุด

## Step7️⃣: Exploratory Data Analysis with Stat
### 1. Style ของราเมงมีทั้งหมดกี่แบบ แต่ละแบบมีเท่าไหร่
#### Code
```{R}
ramen %>% count(ramen$Style)
```

#### Result
```{R}
ramen$Style     n
1                2
2         Bar    1
3        Bowl  481
4         Box    6
5         Can    1
6         Cup  450
7        Pack 1531
8        Tray  108
```
#### Summary
```{R}
จาก style ที่ได้ สรุปได้ว่า
Pack มีจำนวน 1531 รีวิว
Bowl มีจำนวน 481 รีวิว
Cup มีจำนวน 450 รีวิว
Tray มีจำนวน 108 รีวิว
Box มีจำนวน 6 รีวิว
ไม่ได้ใส่ค่า มีจำนวน 2 รีวิว
Bar มีจำนวน 1 รีวิว
Can มีจำนวน 1 รีวิว
```

### 2. จงแสดง Type of Ramen ที่ Stars เท่ากับ 5
#### Code
```{R}
ramen %>% select(Type_of_ramen) %>% filter(ramen$Stars==5) 
```

#### Result
```{R}
Type_of_ramen
1                                                                      Chow Mein
2                                                                   Chikin Ramen
3                                                                 Mi Goreng Sate
4                                               Mi Goreng Jumbo Barbecue Chicken
5                                                                      Mi Goreng
6                                             Curly Noodles With Grilled Chicken
7                                                     Special Fried Curly Noodle
8                                        Yakisoba With Mayonnaise/Mustard Packet
9                                                          Shrimp Creamy Tom Yum
10                                                                     Mi Goreng
11                                                            Nagasaki Sara Udon
12                                                          Mi Goreng Jumbo Beef
13                                                                  Spicy Sesame
14                                                Steam Spinach Ramen With Onion
15                                              Ramen Noodle Soup Creamy Chicken
16                                                                 Superior Soup
17                                                      Yakisoba Noodles Karashi
18                                                        Mi Hai Cua Crab Flavor
19                                                      Pancit Canton toyo Mansi
20                                                                  Tempura Udon
                                .
                                .
                                .
386                                                  Creamy tom Yum Kung Flavour
```
#### Summary
```[R}
รายชื่อ Type_of_star ที่มี stars เท่ากับ 5 มีจำนวนทั้งหมด 386 รีวิว (เนื่องจากข้อมูลมีจำนวนมากจึงนำมาแค่ 21 รีวิว) 
```

### 3. จงแสดงจำนวน Brand ทั้งหมดที่ผลิตในประเทศไทย
#### Code
```{R}
ramen %>% filter(ramen$Country == "Thailand") %>% count(Brand)
```

#### Result
```{R}
             Brand  n
1         7 Select  2
2  7 Select/Nissin  1
3            Bamee  4
4             Boss  1
5     Fashion Food  3
6    Fashion Foods  5
7       GreeNoodle  4
8       Kim's Bowl  1
9          Kin-Dee  2
10           Knorr  1
11     Little Cook 13
12            Mama 58
13            MAMA 16
14        Mee Jang  7
15          Nissin 17
16            Papa  1
17  President Rice  1
18  Royal Umbrella  2
19           Ruski  5
20          Sunlee  8
21     Tao Kae Noi  1
22     Thai Choice  3
23         Wai Wai 22
24         Yum Yum 12
25         Zow Zow  1
```

#### Summary
```{R}
Brand ที่มีในประเทศไทยมีทั้งหมด 25 brand และมีจำนวนทั้งหมด 191 รีวิว
```

### 4. ประเทศอะไรที่มี Style เป็น Pack มากที่สุดคือประเทศใด
#### Code
```{R}
ramen %>% filter(ramen$Style == "Pack") %>% summarise(Mode(Country))
```

#### Result
```{R}
1   South Korea
```

#### Summary
```{R}
ประเทศที่มี style เป็น Pack มากที่สุด คือประเทศ South Korea ที่มีจำนวนทั้งหมด 183 รีวิว
```

### 5. Brand อะไรที่ถูกรีวิวไปมากที่สุด
#### Code
```{R}
ramen %>% summarise(Mode(Brand))
```

#### Result
```{R}
1      Nissin
```

#### Summary
```{R}
Brand ที่ถูกรีวิวไปมากที่สุด ตือ Nissin ซึ่งมีจำนวนทั้งหมด 381 รีวิว
```
