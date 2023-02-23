# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

#Import Data
tower <- read.csv("Data/towerclean.csv")
yearlist <- as.list(unique(tower$year))
specieslist <- as.list(unique(tower$species))

#########################################################
###################### U I ##############################
#########################################################

ui <- fluidPage(
  titlePanel("Tower Count Data"),
  sidebarLayout(
    sidebarPanel(
        selectInput("yearIn", "Year:", choices = yearlist, multiple = TRUE, selected = 2000),
        checkboxGroupInput("speciesIn", "Species", choices = specieslist, selected  = c("herg","gbbg","coei_ad","blgu")),
        selectInput("plottype","Plot Type", choices = c("barplot","boxplot"))
    ),
    mainPanel(
      plotOutput("plot"))
  )
)

# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
  
  output$plot <- renderPlot({
     if (input$plottype == "barplot") {
        tower %>% 
        group_by(species, year) %>% 
        summarize(max = max(count)) %>% 
        filter(year %in% input$yearIn) %>% 
        filter(species %in% input$speciesIn) %>% 
        ggplot(aes(x = species, y = max, fill = species))+
        geom_col()+
        facet_wrap(~year)+
        labs(title= "High Counts", subtitle = "Great Duck Tower Data")+
        scale_fill_viridis_d()+
        theme_bw()
    } else if (input$plottype == "boxplot") {
        tower %>% 
        group_by(species, year) %>% 
        filter(year %in% input$yearIn) %>% 
        filter(species %in% input$speciesIn) %>% 
        ggplot(aes(x = species, y = count, fill = species))+
        geom_boxplot()+
        facet_wrap(~year)+
        labs(title= "All Counts", subtitle = "Great Duck Tower Data")+
        scale_fill_viridis_d()+
        theme_bw()
    }
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
