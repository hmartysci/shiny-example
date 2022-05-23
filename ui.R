library(shiny)

# Creates a new tab named tabName displaying a bar graph for a dataset.
# The tab has a selectInput named selectName for selecting one of the attributes
# in the input attributes vector. The selected attribute is the categorical
# variable according to which data from the dataset is categorized to plot a bar
# graph named plotName.
createTab <- function(tabName, selectName, attributes, plotName) {
  tabPanel(
    tabName,
    fluidRow(
      column(
        4, offset = 4,
        wellPanel( # a grey well containing the select list of attributes
          selectInput(selectName, "Attribute:", attributes)
        )
      ),
    ),
    
    fluidRow(
      style = "margin-bottom:20px;",
      column(10, offset = 1, plotOutput(plotName))
    )
  )
}

fluidPage(
  tags$head(includeHTML("google-analytics.js")),
  style = "margin: 10px; font-family: \"Times New Roman\";
    background-color: beige;",
  
  titlePanel(
    h1(style = "text-align: center;", "Bar Graphs from R Datasets"),
    windowTitle = "Bar Graphs from R Datasets"
  ),
  
  # a panel containing 3 tabs, each with a bar graph for an R dataset
  navlistPanel(
    createTab("\"Hair and Eye Color of Statistics Students\"", "select1",
              c("Hair", "Eye", "Sex"), "plot1"),
    createTab("\"US State Facts and Figures\"", "select2",
              c("Division", "Region"), "plot2"),
    createTab("\"Student Admissions at UC Berkeley\"", "select3",
              c("Admission Status", "Gender", "Department" = "Dept"), "plot3")
  )
)