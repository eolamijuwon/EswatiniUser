
  # We'll use this to make comments in R 
  ######################################
  
  
  ##  Introduction to R
  ##  Eswatini UseR
  ##  November 8, 2019
  
  
  ##  Outline
  #   - What is R
  #   - The RStudio Interface
  #   - What is R
  
  ##  Activity for Today
  
  #   - Load Data
  #   - Clean Data
  #   - Analyze Data
  
  
  
  
  
  
  
  ##  Load Data
  #   We can load data into R from various data formate
  #   including ".csv", ".txt", ".dta", ".sav", ".rjson" among others.
  
  #   Import the Teenage Dataset and assign it to ::TeenData::
  
  TeenData <- read.csv("C:\\Users\\eOlamijuwon\\OneDrive\\Research\\Computational Social Science\\Eswatini UseR\\Intro to R\\teenageData.csv")
  #   Note that <- is an assignment function (just as = in STATA)
  
  
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
  
  ##  R Packages
  ##  A collection of R functions, complied code and sample data
  
  ##  Example == https://rstudio.com/products/rpackages/
  ##  GGPlot
  ##  dplyr
  ##  tidyr
  ##  readr
  ##  Detailed description of the packages can be found on the package website
  ##  Example == https://www.tidyverse.org/packages/
  
  
  ##  To use a package
  ##  Step 1: Install the package install.packages(`package.name`)
  ##            or devtools::install_github("hadley/babynames")
  ##  Step 2: Load the package    library(`package.name`)
  
  ##  Example ::
  
  install.packages("dplyr")
  install.packages("readr")
  
  ##  or install.packages("readr", "dplyr")
  library(dplyr)
  library(readr)
  
  # Alternatively you can use the "glimpse" function
  # from the dplyr package to view the data structure
  
  dplyr::glimpse(TeenData)
  
  # or glimplse(TeenDate)
  
  ##  Let's re-read our Teenage data using the `readr` package and assign it to ::TeenDatR::
  
  TeenDatR <- read_csv ("C:\\Users\\eOlamijuwon\\OneDrive\\Research\\Computational Social Science\\Eswatini UseR\\Intro to R\\teenageData.csv")

  
  # Let's get into real business
  
  #     - Clean Data - We want study teenage pregnancy in Eswatini
  #       That is, our sample should be teenagers
  #       From the old `TeenData` data, create a new dataset ::TeenPreg:: focusing on:
  #       - Teenagers that have never given birth (CM1)
  #       - Create a var `ever_had_sex` from -Age at first sex (SB1)
  #         Note: Variable names cannot have spaces
  #       - Create a var `education` [<Sec/Sec+] from Highest educational attain (welevel).
  #       - Create a var `violence_atti [No support/Support Violence]` from DV1A-DV1I
  #       - Drop all other variables and keep [ever_had_sex, education, violence_atti]
  #       We will use the dplyr package [filter, select, mutate]
  
  
  #       - 
  #     SOLUTION
  #     - Clean Data - We want study teenage pregnancy in Eswatini
  #       That is, our sample should be teenagers
  #       From the old `TeenData` data, create a new dataset ::TeenPreg:: focusing on:
  TeenPreg <- TeenData %>% 
  #       - Teenagers that have never given birth (CM1)
    filter(CM1 == "No") %>% 
  #       - Create a var `ever_had_sex` from -Age at first sex (SB1)
    mutate(ever_had_sex = as.numeric(SB1),
           ever_had_sex = ifelse((ever_had_sex < 11), 
                                 "Had Sex", "Never Had Sex")) %>% 
  #         Note: Variable names cannot have spaces
  #       - Create a var `education` [<Sec/Sec+] from Highest educational attain (welevel).
    mutate(education = ifelse((welevel == "None" | welevel == "Primary"),
                              "< Secondary", "Secondary+")) %>% 
  #       - Create a var `violence_atti [No support/Support Violence]` from DV1A-DV1I
    
    mutate(violence_atti = ifelse((DV1A =="Yes" |
                                    DV1B =="Yes" | DV1C =="Yes" | 
                                    DV1D =="Yes" | DV1E =="Yes" | 
                                    DV1F =="Yes" | DV1G =="Yes" |
                                    DV1H =="Yes" | DV1I =="Yes"),
                                  "No support", "Support Violence")) %>% 
    
  #       - Drop all other variables and keep [ever_had_sex, education, violence_atti]
    select("ever_had_sex", "education", "violence_atti")
    
  #   BRIEF Exercise
  
      # How many teenagers are in the `TeenPreg` dataset
      # How many teenagers in the `TeenPreg` dataset have had sex and support IPV
      # How many teenagers in the `TeenPreg` dataset support IPV and have Sec+ education
      # NOTE: You can use the `table` function to tabulate
  
  #   Data Management
  #   Using the TeenData, find:
  #   The number of teenagers who have a comprehensive knowledge of HIV
  #   The number of teenagers who have a positive attitude to the PLHIH
  #   Among those who have had sex, what is the mean time since last sex (Age - Age1sex).
