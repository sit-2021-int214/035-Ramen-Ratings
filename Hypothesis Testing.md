# Hypothesis Testing

### Step to do:

0. Assign variables:
   - u0 or p0
   - xbar or pbar
   - n
   - sd (or sigma)
   - alpha (default is 0.05)
1. State the hypothesis
2. Select Level of significance (alpha)
3. Select Test statistic (This formula for one population)
   - z/t <- (xbar - u0) / (sd/sqrt(n))
   - z <- (pbar-p0) / sqrt((p0\*(1-p0))/n)
4. Finding P-value approach or Critical Value approach
   - P-value for Z: `pvalue <- pnorm(z)`
   - Critical Value for Z: `zalpha <- qnorm(alpha)`
   - P-value for T: `pvalue <- pt(q, df,lower.tail = TRUE)`
   - talpha for T: `talpha <- qt(p, df, lower.tail = TRUE)`
5. Compare P-value with alpha or z/t with zalpha/talpha
6. Conclusion
## Define question
จากข้อมูล ramen ทีได้สำรวจมามีข้อมูลทั้งหมด 2,580 ข้อมูล โดยทางกลุ่มสนใจ ramen ชนิด Pack ซึ่งมีจำนวนทั้งหมด 1,531 ข้อมูล ได้ตั้งสมมติฐานว่า คะแนนเฉลี่ยของ ramen ชนิด Pack มีคะแนนเฉลี่ยมากกว่า 3.7 คะแนน
โดยมีคะแนนเฉลี่ยของramenทั้งหมดอยู่ที่ 3.65 คะแนน และมีส่วนเบี่ยงเบนมาตรฐาน 1.01 ซึ่งเรากำหนดค่า alpha เท่ากับ 0.05
### Step 0 : Assign variables
``` ruby
n <- 1531
xbar <- 3.65
sd <- 1.01
u0 <- 3.7
```
### Step 1 : State the hypothesis
``` ruby
H0 : u0 >= 3.7
Ha : u0 < 3.7
```

### Step 2 : Select Level of significance
``` ruby
alpha <- 0.05
```

### Step 3 : Select Test statistic
```ruby
z <- (xbar - u0) / (sd/sqrt(n))
```
#### Result
``` ruby
[1] -1.937029
```
### Step 4 : Finding P-value approach or Critical Value approach
```ruby
# P-value approach
pvalue <- pnorm(z); 

# Critical Value approach
zalpha <- qnorm(alpha);
```
#### Result
``` ruby
> pvalue
[1] 0.02637087
> zalpha
[1] -1.644854
```

### Step 5 : Compare P-value with alpha or z/t with zalpha/talpha
``` ruby
P-value approach : "Reject H0"
critical value approach : "Reject H0"
```

### Step 6 : Conclusion
จากการทดสอบสมมุติฐานสรุปว่า ไม่เป็นไปตามสมมุติฐานข้างต้นคือ คะแนนเฉลี่ยของ ramen ชนิด Pack มีคะแนนเฉลี่ยน้อยกว่า 3.7 คะแนน
