library(shiny)

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
    create_tab("\"Hair and Eye Color of Statistics Students\"", "select1",
              c("Hair", "Eye", "Sex"), "plot1"),
    create_tab("\"US State Facts and Figures\"", "select2",
              c("Division", "Region"), "plot2"),
    create_tab("\"Student Admissions at UC Berkeley\"", "select3",
              c("Admission Status", "Gender", "Department" = "Dept"), "plot3")
  )
)
