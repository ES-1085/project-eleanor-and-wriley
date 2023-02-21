# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)



tower <- read.csv("Data/towerclean.csv")
yearlist <- as.list(unique(towerclean$year))
# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("Tower Count Data"),
  
  sidebarLayout(
    sidebarPanel("Year"),
    mainPanel("High Count", align = "center")
  ),

column(3,
         selectInput("select", h3("Select box"), 
                     choices = yearlist, selected = 1)),
)
# Define server logic to plot various variables against mpg ----
server <- function(input, output) {
  
  # Compute the formula text ----
  # This is in a reactive expression since it is shared by the
  # output$caption and output$mpgPlot functions
  formulaText <- reactive({
    paste("mpg ~", input$year)
  })
  
  # Return the formula text for printing as a caption ----
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against mpg ----
  # and only exclude outliers if requested
  output$plot <- renderPlot({
    barplot(as.formula(formulaText()),
            data = tower, x = species,
            col = "#75AADB", pch = 19)
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
