#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
shinyUI(
    dashboardPage(
        header <- dashboardHeader(title = "Demo Gauge"),
        sidebar <- dashboardSidebar(sidebarMenu(menuItem("Population estimates", tabName = "popTab", icon = icon("dashboard")),
                                                menuItem("Immigration estimates", tabName = "immigrantionTab", icon = icon("warning")),
                                                menuItem("Model", tabName = "modelTab", icon = icon("book")))),
        body <- dashboardBody(tabItems(
            tabItem(tabName = "popTab", h2("Statystyki demograficzne kraju"),
                    fluidRow())
        ))
    )
)
