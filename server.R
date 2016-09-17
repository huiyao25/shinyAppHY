
# This is the server logic for a Shiny web application.
# 
# Hui Yao
#

library(shiny)

# We load the two R data objects. 
# exp.data includes the expressions of 5 cancer-related genes for 5172 samples.  
# sample.info includes the sample information.
load("shinyAppData.RData")


# In server, we draw the scatter plot of the expressions of two selected genes   
# and calculate their Pearson correlation coefficient.

shinyServer(function(input, output) {
  
  # Compute the formula text in a reactive expression since it is
  # shared by the output$caption and output$mpgPlot functions
  sel.data <- reactive({
    as.matrix(exp.data[,sample.info$diseaseCode == input$type])
  })
  
  # Return the formula text for printing as a caption
  gene1.exp <- reactive({
    sel.data()[input$gexp1,]
  })
  
  gene2.exp <- reactive({
    sel.data()[input$gexp2,]
  })
  
  # Generate a plot of the requested variable against mpg and
  # only include outliers if requested
  output$genePlot <- renderPlot({
    plot(gene1.exp(), gene2.exp(), main=input$type, xlab = input$gexp1, ylab = input$gexp2)
    if(input$addLine) abline(lsfit(gene1.exp(),gene2.exp()),col="red",lwd=2)
  })
  
  output$cor <- renderText({
    paste("Pearson Correlation Coefficient:",round(cor(gene1.exp(),gene2.exp()),3))
  })
    
})

