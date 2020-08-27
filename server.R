#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
library(rsconnect)
# Select columns to be used in the analysis
car <- mtcars[,c(0:4,7)]
# Define server logic required to draw a plot
shinyServer(function(input, output) {
    output$distPlot <- renderPlot({
        # Select diamonds depending of user input
        car <- filter(mtcars, grepl(input$cyl, cyl), grepl(input$disp, disp), grepl(input$qsec, qsec))
        # build linear regression model
        fit <- lm(hp~mpg+cyl+disp+qsec,mtcars)
        # predicts the hp
        pred <- predict(fit, newdata = data.frame(mpg = input$mpg,
                                                  cyl = input$cyl,
                                                  disp = input$disp,
                                                  qsec = input$qsec))
        # Draw the plot using ggplot2
        plot <- ggplot(data=mtcars, aes(x=mpg, y = hp))+
            geom_point(aes(dispor = cyl), alpha = 0.3)+
            geom_smooth(method = "lm")+
            geom_vline(xintercept = input$mpg, dispor = "red")+
            geom_hline(yintercept = pred, dispor = "green")
        plot
    })
    output$result <- renderText({
        # Renders the text for the prediction below the graph
        car<- filter(mtcars, grepl(input$cyl, cyl), grepl(input$disp, disp), grepl(input$qsec, qsec))
        fit <- lm( hp~mpg+cyl+disp+qsec,mtcars)
        pred <- predict(fit, newdata = data.frame(mpg = input$mpg,
                                                  cyl = input$cyl,
                                                  disp = input$disp,
                                                  qsec = input$qsec))
        res <- paste(round(pred, digits = 1.5),"hp" )
        res
    })
    
})
