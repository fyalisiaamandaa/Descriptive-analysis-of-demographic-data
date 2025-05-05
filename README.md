# Exploratory Data Analysis (EDA)

This repository contains exploratory data analysis (EDA),where I explore and analyze datasets to derive insights and patterns. Below is an overview of the projects in this repository:

### Dataset:
- File: `census2002_2022.csv`
- Description: This document provides detailed information about the US Census Bureau dataset used in the corresponding EDA notebook. The dataset provided for this report covers the under age 5 mortality rate and life expectancy in 227 countries, divided into 5 regions and 21 subregions for the years 2002 and 2022.
- The goal of this project : The goal of this project is to analyse the life expectancy and under 5 age mortality rate using several statistical methods and visualize the result in a graph. In addition, the life expectancy between males and females can be illustrated as a graph and the variability of the value between subregions can be compared. The main purpose is to investigate the correlation between the under age 5 mortality rate for both sexes and life expectancy at birth for both sexes.

There are 10 missing values that are already mentioned in the previous chapter. Before doing the calculation methods, are necessary to replace the missing value. There are 2 Country missing the region and subregion in 2002 and 2022 that need to be fulfilled manually. Moreover, the other missing value is replaced using median. Since it suits the variables with skewed and extreme values. 

#### Frequency distribution
![image](https://github.com/user-attachments/assets/084dcde7-af9c-468d-a854-670169a856ca)

The frequency distribution of life expectancy at birth for both sexes and the frequency distribution of under age 5 mortality rate for both sexes.

![image](https://github.com/user-attachments/assets/bab34d08-22c0-4517-a42f-9ff7b3cdecfb)

The difference in life expectancy and under age 5 mortality rate between the sexes.

#### Homogeneity within subregions

![image](https://github.com/user-attachments/assets/0f4bbc5f-e0bd-4b02-809b-82b2dc51fc95)

The IQRs are visualized in picture above and it can indeed be determine to distinguish heterogeneous and homogeneous behaviour. The length of the quartile gives a hint which one is homogeneous and which one is heterogeneous. If the box is long, then it is classified as heterogeneous. In contrast, when the length is short then it is homogeneous.

#### Correlation coefficients

![image](https://github.com/user-attachments/assets/381befee-11bd-4ca4-a03a-48b38e6f8068)

The scatterplots are used to ease the visualization of the two variables. The scatterplots matrix shows the plots and correlation coefficient number between life expectancy at birth and under age 5 mortality rate.

#### Comparison between years

![image](https://github.com/user-attachments/assets/ae23877c-f5df-49b7-949a-adbec3322ad0)
Difference between the years 2002 and 2022.

![image](https://github.com/user-attachments/assets/487ad813-91ba-4e49-9766-87160f1ad38b)
Boxplot difference between the years of 2002 and 2022 per region.

### For a complete explanation, there is a PDF Descriptive analysis of demographic data.
