A Shiny App for Calculation of Correlation of Expression of Tumor-Related Genes
========================================================
author: Hui Yao
date: 9/17/2016
autosize: true

Background
========================================================

Investigation of correlation of gene expression is important in characterization of molecular mechanisms of cancer biology.

- Select 5 genes, TP53, PIK3CA, PTEN, KRAS and APC, with highest mutation rate in cancer patients (http://www.tumorportal.org/).
- Download the expression levels of these genes from 5172 cancer patients from the website of TCGA data portal (https://tcga-data.nci.nih.gov/docs/publications/tcga/?).
- These cancer patient samples are collected from 8 tumor types, BRCA, BRCA, HNSC, KIRC, LGG, LUAD, LUSC, PRAD and THCA. 

Input
========================================================


- Use **fluidPage** and **sidebarLayout** to organize the user interface.
- Use widget, **selectInput**, to select genes and tumor type.
- Use widget, **checkboxInput**, to specify whether a regression line is added into the plot.



Output
========================================================

- We calculate the Pearson correlation coefficients and draw the scatter plots.
    + For example, PIK3CA~PAC for BRCA, the Pearson correlation coefficient is 0.654 

*** 

![plot of chunk unnamed-chunk-1](shinyAppHYSlide-figure/unnamed-chunk-1-1.png)

Summary
================================

- We built the Shiny app to investigate the correlations of cancer-related genes. 
- The widgets were used for input in ui.R.
- The reactive expressions were used in server.R because the expressions were called by two **render** functions.


