library(readr)
library(readxl)
library(dplyr)
library(ggplot2)
install.packages("writexl")
library(writexl)


install.packages("showtext")
library(showtext)
showtext_auto()  

install.packages("plotly")
library(plotly)

install.packages("ggrepel")
library(ggrepel)

setwd("~/Desktop/Big Data/final project")
sum_table<- read_excel("finalfile.xlsx")



school_avg <- sum_table %>%
  group_by(name) %>%
  summarise(
    avg_intl_ratio = mean(intl_ratio),
    avg_special_intl_ratio = mean(special_intl_ratio),
    avg_tuition_ratio = mean(tuition_ratio)
  )

sum_table <- sum_table %>%
  left_join(
    school_avg %>% select(name, avg_intl_ratio, avg_tuition_ratio,avg_special_intl_ratio),
    by = "name" 
  )


#境外生比例跟財務依賴度(無控變)
modeldf <- lm( avg_intl_ratio ~avg_tuition_ratio, data = sum_table)
summary(modeldf)

ggplot(sum_table, aes(x = avg_tuition_ratio, y = avg_intl_ratio)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "境外生比例與學雜費佔比關係")

#不顯著


#特招境外生跟財務依賴度(無控變)
modeldf <- lm(  avg_tuition_ratio ~avg_special_intl_ratio , data = sum_table)
summary(modeldf)

#不點出名稱
ggplot(sum_table, aes(x = avg_special_intl_ratio, y =  avg_tuition_ratio )) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "特殊境外生比例與學雜費佔比關係")


#Regressionwithcontrol
#特招境外生跟財務依賴度(地區)
modeldf <- lm(avg_tuition_ratio ~ avg_special_intl_ratio * city, data = sum_table)
summary(modeldf)


#特招境外生跟財務依賴度(學校類型)
modeldf <- lm(avg_tuition_ratio ~ avg_special_intl_ratio * category, data = sum_table)
summary(modeldf)


#特招境外生跟財務依賴度(學校區域)
modeldf <- lm(avg_tuition_ratio ~ avg_special_intl_ratio * region, data = sum_table)
summary(modeldf)

#特殊境外生比例與學雜費佔比關係

school_avg$highlight <- ifelse(school_avg$avg_special_intl_ratio == 0, "regular_admission", "special_admission")

top_points <- school_avg %>%
  filter(avg_special_intl_ratio > 0.1,avg_tuition_ratio > 0.5)

ggplot(school_avg, aes(x = avg_special_intl_ratio, y = avg_tuition_ratio)) +
  geom_point(aes(color = highlight), alpha = 0.6) +
  scale_color_manual(values = c("regular_admission" = "gray45", "special_admission" = "skyblue3")) +
  geom_smooth(method = "lm", se = TRUE, color = "navyblue") +
  geom_text_repel(data = top_points,
                  aes(label = name), 
                  size = 3,
                  color = "salmon") +
  labs(title = "特殊境外生比例與學雜費佔比關係",
       color = "特殊境外生比例") +
  theme_minimal()

x_mid <- median(school_avg$avg_special_intl_ratio, na.rm = TRUE)
y_mid <- median(school_avg$avg_tuition_ratio, na.rm = TRUE)


#圖一
ggplot(school_avg, aes(x = avg_special_intl_ratio, y = avg_tuition_ratio)) +
  geom_point(aes(color = highlight), alpha = 0.6) +
  scale_color_manual(values = c("regular_admission" = "gray45", "special_admission" = "skyblue3")) +
  geom_vline(xintercept = x_mid, linetype = "dashed", color = "gray40") +
  geom_hline(yintercept = 0.5, linetype = "dashed", color = "gray40") +
  geom_smooth(method = "lm", se = TRUE, color = "navyblue") +
  geom_text_repel(data = top_points,
                  aes(label = name), 
                  size = 3,
                  color = "salmon") +
  labs(title = "特殊境外生比例與學雜費佔比關係（四象限分析）",
       x = "平均特殊境外生比例",
       y = "平均學雜費佔比",
       color = "入學類型") +
  theme_minimal()




#特招境外生跟財務依賴度(公私立)
modeldf <- lm(avg_tuition_ratio ~ avg_special_intl_ratio * type , data = sum_table)
summary(modeldf)

#圖二- 特招境外生跟財務依賴度(公私立)
ggplot(sum_table, aes(x = avg_special_intl_ratio, y = avg_tuition_ratio, color = type)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_manual(values = c("國立" = "skyblue3", "私立" = "salmon")) +
  labs(title = "公私立特殊境外生比例與學雜費佔比關係",
       color = "設立別") +
  theme_minimal()
ㄋㄋ
