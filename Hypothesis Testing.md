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
