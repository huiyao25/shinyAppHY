
# This is the user-interface for a Shiny web application.
# 
# Hui Yao
# 
library(shiny)

# Define UI
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Correlation of Expressions of Two Genes"),
  
  # Sidebar with controls to select genes to plot against each other for a specific tumor type
  # and to specify whether the regression line is added into the plot. 
  sidebarLayout(
    sidebarPanel(
      
      # Describe the input data
      p("The expression levels of 5 cancer-related genes from 5172 cancer patients were downloaded from the website of ", 
         a("TCGA data portal.", href="https://tcga-data.nci.nih.gov/docs/publications/tcga/?"), 
         "Please select two gene IDs and a tumor type."),
      
      # Select gene 1
      selectInput("gexp1", "Gene 1:",
                  c("TP53" = "TP53",
                    "PIK3CA" = "PIK3CA",
                    "PTEN" = "PTEN",
                    "KRAS" = "KRAS",
                    "APC" = "APC")),
      
      # Select gene 2
      selectInput("gexp2", "Gene 2:",
                  c("TP53" = "TP53",
                    "PIK3CA" = "PIK3CA",
                    "PTEN" = "PTEN",
                    "KRAS" = "KRAS",
                    "APC" = "APC"),
                  selected="PIK3CA"),
      
      # Select tumor type
      selectInput("type", "Tumor Type:",
                  c("Breast invasive carcinoma (BRCA)" = "BRCA",
                    "Brain lower grade glioma (LGG)" = "LGG",
                    "Head and neck squamous cell carcinoma (HNSC)" = "HNSC",
                    "Kidney renal clear cell carcinoma (KIRC)" = "KIRC",
                    "Lung adenocarcinoma (LUAD)" = "LUAD",
                    "Lung squamous cell carcinoma (LUSC)" = "LUSC",
                    "Prostate adenocarcinoma (PRAD)" = "PRAD",
                    "Thyroid carcinoma (THCA)" = "THCA")),
      
      # Determine whether a regression line is added or not
      checkboxInput("addLine", label = "Add a regression line", value = FALSE)
    ),
    
    # Show the scatter plot of two gene expressions and calcuated Pearson correlation coefficient
    mainPanel(
      
      p("First, we checked the scatter plot of the expression levels of two selected genes."),
      
      # show the scatter plot
      plotOutput("genePlot",width=600,height=600),
      
      # show the correlation coefficient
      p("Second, we calculated the Pearson correlation coefficient for the expression levels of two genes."),
      h4(textOutput("cor"))
    )
  )
))

