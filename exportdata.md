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
ชุดข้อมูลที่ได้มานั้นเกี่ยวกับคนที่ได้ไปกินราเม็งมาจากสถานที่ต่างๆ หลากหลายรูปแบบ โดยมีข้อมูลต่างๆเช่น ชื่อสินค้า ประเภท คะแนนที่ให้ฯลฯ
โดยใน dataset นี้เป็นข้อมูลของราเม็งต่างๆของราเม็งทั้งหมด 2580 ชื่อและ ตัวแปรทั้งหมด 7 ตัว(2580 varieties with 7 variables)
ตัวแปรทั้งหมดประกอบไปด้วย
1. `Review #`
2. `Brand`
3. `Variety`
4. `Style`
5. `Country`
6. `Stars`
7. `Top ten`

## Step 3 Download Library and dataset
```{R}
#Loading Library
library(readr)
library(dplyr)
library(stringr)
library(assertive)

#Loading Dataset
ramen_ratings <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/035-Ramen-Ratings/main/ramen-ratings.csv")
```

## Step 4 Exploratory Data Analysis


## Step 5 Cleaning Dataset


## Step 6 Defind a question
1. Sytle ของราเมงมีทั้งหมดกี่แบบ แต่ละแบบมีเท่าไหร่
2. จงแสดง Type of Ramen ที่ Stars เท่ากับ 5
3. จงแสดง Brand ทั้งหมดที่ผลิตในประเทศไทย
4.
5.

## Step 7 Exploratory Data Analysis with Stat



