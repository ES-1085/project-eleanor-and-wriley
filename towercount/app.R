# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)



tower <- read.csv("Data/towerclean.csv")
yearlist <- as.list(unique(towerclean$year))
# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("Tower Count Data"),
  
  sidebarLayout(
    sidebarPanel("Year"),

column(3,
         selectInput("select", h3("Select box"), 
                     choices = yearlist, selected = 1)),
mainPanel(
  textOutput("selected_year"))
)
)

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
  
  output$selected_year <- renderText({ 
    "You have selected this"
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
