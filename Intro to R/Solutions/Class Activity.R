
library(tidyr)

library(dplyr)


TeenData <- read.csv(".\\teenageData.csv")


# Using the TeenData, find:

class_exercise <- TeenData %>% 
  
  # HA2 HA3 HA4 HA5 HA6 HA7
  mutate(HIV_know = ifelse((HA2 =="Yes" & HA3 =="No" & HA4 =="Yes" & 
                              HA5 =="No" & HA6 =="No" & HA7 =="Yes" &
                              HA8A =="Yes" & HA8B =="Yes" & HA8C=="Yes" & HA8BB =="Yes"),
                                "Comprehensive Knowledge", "Low Knowledge")) %>% 
  
  mutate(HIV_attitudes = ifelse((HA9 =="Yes" & HA9A =="Yes" & 
                                   HA10 =="Yes" & HA11 =="Yes" & HA12 =="Yes"),
                                "Positive Attitudes", "Poor Attitudes")) %>% 
  
  mutate(age_1sex = replace(SB1, 
                            (SB1=="First time when started living with partner"|
                               SB1=="Never had intercourse"), NA)) %>% 
  droplevels() %>% 
  
  mutate(age_1sex = as.numeric(age_1sex),
         
         time_sinceSex =  ifelse((is.na(age_1sex) ==FALSE),
                                 WB2 - age_1sex, NA))


#  - The number of teenagers who have a comprehensive knowledge of HIV

      table (class_exercise$HIV_know)
      
      # OR
      
      length(which(class_exercise$HIV_know=="Comprehensive Knowledge"))
      
      # OR
      
      nrow(filter(class_exercise, HIV_know == "Comprehensive Knowledge"))

      
      
# - The number of teenagers who have a positive attitude to the PLHIH
      
      table (class_exercise$HIV_attitudes)
      
      # OR
      
      length(which(class_exercise$HIV_attitudes=="Positive Attitudes"))
      
      # OR
      
      nrow(filter(class_exercise, HIV_attitudes == "Positive Attitudes"))
      

#- Among those who have had sex, what is the mean years since last sex (Age - Age1sex).
   
      ?mean
      
      mean(class_exercise$time_sinceSex, na.rm = TRUE)

