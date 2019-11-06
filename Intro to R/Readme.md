---
title: "Introduction to R"
author: "Emmanuel Olamijuwon"
date: "11/6/2019"
---


# Introduction

In this session we will attempt to cover the basics of reading data into R, data cleaning/wrangling/Management and Analysis. If you are still to install R (click here) or (here) to install RStudio

```{r}

  ##  Outline
  #   - What is R
  #   - The RStudio Interface
  #   - What is R
  
  ##  Activity for Today
  
  #   - Load Data
  #   - Clean Data
  #   - Analyze Data

```


#  Load Data

We can load data into R from various data format including ".csv", ".txt", ".dta", ".sav", ".rjson" among others.

- Import the Teenage Dataset and assign it to ::TeenData::

```{r}

TeenData <- read.csv("C:\\Users\\eOlamijuwon\\OneDrive\\Research\\Computational Social Science\\Eswatini UseR\\Intro to R\\teenageData.csv")


```

  
  #   Note that <- is an assignment function (just as = in STATA)
