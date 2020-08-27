#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Price predictor for horsepower"),
    
    # Sidebar with options selectors
    sidebarLayout(
        sidebarPanel(
            helpText("This application is a predictor for horse power based on features."),
            h3(helpText("Select:")),
            numericInput("mpg", label = h4("MPG"), step = 0.01, value = 20),
            numericInput("cyl", label = h4("cyl"),step=1,value = 3),
            numericInput("disp", label = h4("disp"),step=5,value = 160),
            numericInput("qsec", label = h4("qsec"),step=0.01,value = 15),
            
        ),
        
        # Show a plot with diamonds and regression line
        mainPanel(
            plotOutput("distPlot"),
            h4("Predicted value of horsepower is:"),
            h3(textOutput("result"))
        )
    )
))
