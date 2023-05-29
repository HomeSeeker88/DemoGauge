#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  #source("D:/DemoGauge/src/Tidy/data_extracter.r")
  observeEvent(input$confirmButton,{

    country <- input$inputCountry
    print(country)
    print(class(country))
    datasets <- load_datasets(country)
    dataset_age_sex <- datasets[[1]] %>% mutate(Age = as.integer(Age))
    popSum <- dataset_age_sex %>% filter(Sex == "Total") %>% summarise(totalPop = sum(Population)) %>% as.integer()
    
    output$age_pyramid <- renderPlot(dataset_age_sex %>%filter(Sex !="Total" & Age != "Total") %>%  ggplot(aes(x = Age, fill = Sex, y = ifelse(Sex == "Male", -Population/popSum, Population/popSum))) + geom_bar(stat = "identity")+ coord_flip() + scale_y_continuous(labels = abs, limits = max(dataset_age_sex$Population/popSum) * c(-1,1)) +coord_flip()+
                                       ylab("Percent of population")+ ggtitle("Pyramid age of Germany"))
  }, ignoreNULL = F)
      
      

      
     


})
