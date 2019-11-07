
library(dplyr)


TeenData <- read.csv(".\\teenageData.csv")

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


# How many teenagers are in the `TeenPreg` dataset

    nrow(TeenPreg)
    

# How many teenagers in the `TeenPreg` dataset have had sex and support IPV

    table (TeenPreg$ever_had_sex, TeenPreg$violence_atti)
    
    # OR
    
    length(which(TeenPreg$ever_had_sex=="Had Sex" & TeenPreg$violence_atti == "Support Violence"))
    
    # OR
    
    nrow(filter(TeenPreg, ever_had_sex == "Had Sex" & violence_atti == "Support Violence"))
    
    # OR
    
    sum(with(TeenPreg, ever_had_sex == "Had Sex" & violence_atti == "Support Violence"))


# How many teenagers in the `TeenPreg` dataset support IPV and have Sec+ education
    
    table (TeenPreg$education, TeenPreg$violence_atti)
    
    # OR
    
    length(which(TeenPreg$education=="Secondary+" & TeenPreg$violence_atti == "Support Violence"))
    
    # OR
    
    nrow(filter(TeenPreg, education=="Secondary+"  & violence_atti == "Support Violence"))
    
    # OR
    
    sum(with(TeenPreg, education=="Secondary+" & violence_atti == "Support Violence"))
    
    
