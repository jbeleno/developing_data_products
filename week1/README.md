## Shiny
* Web development framework for R, without using HTML, Javascript and CSS
* It is for prototypes
* R Studio has free hosting service for shiny apps but with limitations (25 hours per month and at most 5 apps)
* It uses Bootstrap for design and mobile compatibility
* install.packages("shiny")
* library(shiny)
* ui.R for interface and server.R for functionality
* To execute the app in R Studio
- `setwd("~/Desktop/Repositories/developing_data_products/week1/example1")` or `Session > Set Working Directory > To Source File Location`
- `runApp()`
- or `runApp("APP_PATH")`
* `?builder to see more information about HTML supported by Shiny
* Reactivity provides a way for your app to respond since inputs will change depending on how users interact with your user interface
* Delayed reactivity works when you don't want inmediate calculation of the model -- e.g., heavy montecarlo processing, bootstrap, etc. This works by using something like a button to activate the calculation -- submitButton().
* It can work by programming HTML directly the class for outputs is "shiny-text-outputs"

## Shiny Gadgets
* Manipulate: Add interactive functionalities to standard R plots
* Shiny Gadgets provides a way to use Shiny's interactivity and user interface tools as part of a data analysis, using the miniUI package. It is for interactive graphics

## Google Vis
* It leverages the interactive graphics provided by R -- e.g., maps, motion charts, interactive maps, interactive tables, line charts, bar charts, tree maps
* `results="asis" to work properly in knitr and slidify

## Plotly
* Web application and library for creating and sharing visualizations