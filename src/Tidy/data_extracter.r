
library(scales)
load_datasets <- function(country){
  path_age_sex_population <- paste0("D:/moje rzeczy/DemoGauge/Data/",country, "/", country,"_age_sex_population.csv")
  age_sex_population <- read_csv(path_age_sex_population) %>% gather(key = "Sex", value = "Population", c("Male", "Female", "Total"))
  
  path_region_age_sex_population <- paste0("D:/moje rzeczy/DemoGauge/Data/",country, "/", country,"_region_age_sex_population.csv")
  region_age_sex_population <- read_csv(path_region_age_sex_population)
  
  path_population_time <- paste0("D:/moje rzeczy/DemoGauge/Data/", country, "/", country, "_population_time.csv")
  population_time <- read_csv(path_population_time)
  
  
  return(list(age_sex_population, region_age_sex_population, population_time))
            
}


gather(ger[[1]], key = "Sex", value = "Population", c("Male","Female","Total"))

popSum <- ger[[1]] %>% filter(Sex == "Total") %>% summarise(totalPop = sum(Population)) %>% as.integer()
ger[[1]] %>%filter(Sex !="Total" & Age != "Total") %>%  ggplot(aes(x = Age, fill = Sex, y = ifelse(Sex == "Male", -Population/popSum, Population/popSum))) + geom_bar(stat = "identity")+ coord_flip() + scale_y_continuous(labels = abs, limits = max(ger[[1]]$Population/popSum) * c(-1,1)) +coord_flip()+
  ylab("Percent of population")+ ggtitle("Pyramid age of Germany")
  #scale_y_continuous(labels = abs, limits = max(ger[[1]]$Population) * c(-1, 1)) + labs(title = "Population Pyramid", x = "Age", y = "Percent of population") +

