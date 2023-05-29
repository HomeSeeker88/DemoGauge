
library(scales)
library(tidyverse)
load_datasets <- function(country){
  path_age_sex_population <- paste0("D:/DemoGauge/Data/",country, "/", country,"_age_sex_population.csv")
  age_sex_population <- read_csv(path_age_sex_population) %>% gather(key = "Sex", value = "Population", c("Male", "Female", "Total"), factor_key = T)
  
  path_region_age_sex_population <- paste0("D:/DemoGauge/Data/",country, "/", country,"_region_age_sex_population.csv")
  region_age_sex_population <- read_csv(path_region_age_sex_population)
  
  path_population_time <- paste0("D:/DemoGauge/Data/", country, "/", country, "_population_time.csv")
  population_time <- read_csv(path_population_time)
  

  return(list(age_sex_population, region_age_sex_population, population_time))
            
}



