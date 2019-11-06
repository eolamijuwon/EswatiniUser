---
Title: "Introduction to R"
Event: "Eswatini UseR Meetup"
Author: "Emmanuel Olamijuwon"
Date: "11/6/2019"
---


# Introduction

In this session we will attempt to cover the basics of reading data into R, data cleaning/wrangling/Management and Analysis. If you are still to install R [[click here](https://cloud.r-project.org/)] or [[here](https://rstudio.com/products/rstudio/download/)] to install RStudio


## Packages

A package is a collection of R functions, complied code and sample data. Examples of R packages can be found on the RStudio [[website](https://rstudio.com/products/rpackages/)].

Some common R packages are
  
  -  GGPlot
  -  dplyr
  -  tidyr
  -  readr
  
  These packages are also embedded in the Tidyverse package and a detailed description of can be found on the package  [[website](https://www.tidyverse.org/packages/)].

  
To install/use a package

  - Step 1: Install the package install.packages(`package.name`)
  
  --  or devtools::install_github("repository/package.name")
  
  -  Step 2: Load the package    library(`package.name`)
  
```{r}

  install.packages("dplyr")

  install.packages("readr")
  
  ##  or install.packages("readr", "dplyr")
  
  library(dplyr)
  
  library(readr)

```

  # Alternatively you can use the "glimpse" function
  # from the dplyr package to view the data structure



#  Load Data

We can load data into R from various data format including ".csv", ".txt", ".dta", ".sav", ".rjson" among others.

For this activity, we will use the [[teenageData](https://github.com/eolamijuwon/EswatiniUser/blob/master/Intro%20to%20R/teenageData.csv/)] which is a subset data extracted from the 2014 Multiple Indicator Cluster Survey of Eswatini. The sample data contains basic demographic features of teenagers [15-19 years] who were in Eswatini at the time of data collection. The MICS full dataset can be downloaded on the [[UNICE website](https://mics.unicef.org/surveys/)].

- Activity: Import the teenageData into RStudio and assign it to ::TeenData::

```{r}

TeenData <- read.csv("C:\\Users\\eOlamijuwon\\OneDrive\\Research\\Computational Social Science\\Eswatini UseR\\Intro to R\\teenageData.csv")

#   Note that <- is an assignment function (just as = in STATA)

```


# Data Exploration

```{r}

  # We can browse the dataset with "View"
  View(TeenData)
  
  # You can check the structure of your dataset
  str(TeenData)
  
  # You can examine the first few observations
  # in the dataset (could be 5/10/more) using the 
  # `head` function
  
  head(TeenData, n=30) 
  
  # You can check how many rows(number of observations)
  # are in your dataset using the `nrow` function 
  
  nrow(TeenData)
  
  # You can check how many rows(number of variables)
  # are in your dataset using the `nrow` function 
  ncol(TeenData)

```



