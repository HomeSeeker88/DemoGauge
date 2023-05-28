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
  #source("D:/moje rzeczy/DemoGauge/src/Tidy/data_extracter.r")
  observeEvent(input$confirmButton,{

      country <- input$inputCountry

    datasets <- load_datasets(as.character(country))
    dataset_age_sex <- datasets[[1]] %>% mutate(Age = as.integer(Age))
  }, ignoreNULL = F)
      
      

      
      #output$age_pyramid <- renderPlot(ggplot(dataset_age_sex, aes(x= )))


})
