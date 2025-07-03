
# Project Title

Profits in the Name of Education: The Student-Worker Model in Disguise

## Project Description

This project examines how some Taiwanese universities exploit international students through internship-heavy vocational programs. Using reports from AIT, NGOs, and alumni, we identify patterns in programs like the 3+4 Vocational Track, where students may work over 40 hours a week—effectively as full-time laborers under the label of education.
We analyzed universities’ financial data, focusing on tuition dependence as a sign of institutional vulnerability. Schools heavily reliant on tuition are more likely to run such programs to sustain operations. This research highlights the need for better transparency and aims to help students and policymakers make informed decisions.

## Getting Started

Based on the characteristics of our data, we primarily used Google Sheets and R for data processing and analysis. Most of the data merging was done in Google Sheets using formulas such as VLOOKUP and pivot tables. R was mainly used for running regressions and data visualization. The following packages were utilized in R: ggplot2, dplyr, writexl, readxl, readr, plotly, ggrepel, and showtext.

## File Structure

sum_table.xlsx：The consolidated table prepared for generating charts and conducting regression analysis.

Regression_Final.R：The final R script, which includes code for running regression analyses and data visualization.

## Analysis

Our project utilized quantitative analysis to explore the correlation between Special Admission Student Ratio and Tuition Fee Reliance across Taiwanese universities. Three key visualizations were generated to illustrate our findings:

#1. Relationship between Special Admission Student Ratio and Tuition Fee Reliance
   
The graphic shows that public universities, with diverse funding, have low tuition fee reliance and do not run special programs—clustering in low-risk areas.
In contrast, schools with special programs (blue dots) are more spread out, showing higher variation in both special admission ratios and tuition reliance. Institutions with over 10% special admission students and over 50% tuition reliance fall into the high-risk zone, raising concerns about financial stability and student support.

<img src="https://github.com/ck0118/studentworker/blob/main/1.jpg?raw=true" width="300"/>

#2. Relationship Between Special Admission Student Ratio and Tuition Reliance by School Type

This plot categorizes universities by ownership type (public vs. private). As shown in the graphic, private universities generally exhibit higher tuition fee reliance, while public universities maintain lower levels. This is largely because public institutions benefit from diverse funding sources such as government subsidies, industry partnerships, and alumni donations. In contrast, private universities rely primarily on tuition fees or support from private foundations.
As a result, it is rare for public universities to operate special admission programs. However, when they do, the increase in special admission ratios tends to be more pronounced, reflecting a steeper shift in financial strategy.

![image](https://github.com/ck0118/studentworker/blob/main/2.jpg)


#3. School Distribution

A regional breakdown highlighted spatial imbalances. In southern Taiwan, special admission students make up 28.86% of the national total—disproportionately high given the region’s smaller student population. In contrast, the north has the most students but a lower special admission ratio (18.65%), while the east has minimal participation (1.91%).
This pattern may reflect two structural pressures: difficulty in student recruitment for private universities in less resourced areas, and local industries’ demand for mid-level labor. To cope, schools may collaborate with factories to recruit international students under special programs—blurring the line between education and labor. This dual-purpose model raises concerns about educational quality and student rights.

![image](https://github.com/ck0118/studentworker/blob/main/3.jpg)


## Results

Regression analyses reveal a significant positive correlation between special international student ratios and tuition reliance in Taiwanese universities. Schools with more such students tend to depend more on tuition income, especially private institutions. Notably, public universities show sharper increases in tuition reliance when adopting special programs. This relationship peaked in academic years 109–110, then declined in 111–112, possibly due to policy intervention. Regionally, Hsinchu City and Pingtung County show heightened financial dependence, highlighting spatial vulnerabilities.

Further analysis shows that schools with higher shares of special international students are more likely to depend on tuition income, reflecting a financial strategy tied to international enrollment. Several private universities, notably in northern and southern Taiwan, exhibit this trend. Cases such as University J, University T, University N, and University C, highlight how expanding special programs may serve as a funding mechanism. (For privacy and ethical considerations, university names have been anonymized.) These patterns raise concerns about institutional priorities and call for greater transparency for prospective international students.


## Contributors

Kao Chai-Yu 高嘉妤 [PM & Program]
Tsong-Yin, Li 李宗穎 [Writer]
Wu Hsin-Yen 吳昕諺 [Writer]
Yeh Ting-Yu 葉庭妤 [Writer]


## Acknowledgments

We would like to sincerely thank Professor Pien for the dedicated supervision and invaluable guidance throughout the course of this research. With the insightful advice, constructive feedback, and consistent support have been crucial to the development and completion of this study.

## References

#Data Source: 
Ministry of Education – University Database ｜教育部 - 大專校院校務資訊公開平臺
Admissions Brochures and Guidelines ｜個別簡章 - From respective universities
Admissions brochures of individual universities for the following programs:
 - New Southbound Industry-Academia Collaboration Program (新南向產學合作國際專班)
 - 3+4 Vocational Education Program for Oversea compartriot students (3+4 產學攜手合作僑生專班)
 - Overseas Youth Vocational Training Program (海青班)
Overseas Community Affairs Council ｜ 僑委會簡章

