
# This is the user-interface for a Shiny web application.
# 
# Hui Yao
# 

library(shiny)

# Define UI
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Correlation of Expressions of Two Genes"),
  
  # Sidebar with controls to select the variable to plot against
  # mpg and to specify whether outliers should be included
  sidebarLayout(
    sidebarPanel(
      selectInput("gexp1", "Gene 1:",
                  c("TP53" = "TP53",
                    "PIK3CA" = "PIK3CA",
                    "PTEN" = "PTEN",
                    "KRAS" = "KRAS",
                    "APC" = "APC")),
      
      selectInput("gexp2", "Gene 2:",
                  c("TP53" = "TP53",
                    "PIK3CA" = "PIK3CA",
                    "PTEN" = "PTEN",
                    "KRAS" = "KRAS",
                    "APC" = "APC"),
                  selected="PIK3CA"),
      
      selectInput("type", "Tumor Type:",
                  c("Breast invasive carcinoma" = "BRCA",
                    "Brain lower grade glioma" = "LGG",
                    "Head and neck squamous cell carcinoma" = "HNSC",
                    "Kidney renal clear cell carcinoma" = "KIRC",
                    "Lung adenocarcinoma" = "LUAD",
                    "Lung squamous cell carcinoma" = "LUSC",
                    "Prostate adenocarcinoma" = "PRAD",
                    "Thyroid carcinoma" = "THCA")),
      
      checkboxInput("addLine", label = "Add a regression line", value = FALSE)
    ),
    
    # Show the caption and plot of the requested variable against
    # mpg
    mainPanel(
      
      plotOutput("genePlot",width=600,height=600),
      h4(textOutput("cor"))
    )
  )
))

