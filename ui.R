library(shiny)

# Creates a new tab named tab_name displaying a bar graph for a dataset.
# The tab has a selectInput named select_name for selecting one of the
# attributes in the input attributes vector. The selected attribute is
# the categorical variable according to which data from the dataset is
# categorized to plot a bar graph named plot_name.
create_tab <- function(tab_name, select_name, attributes, plot_name) {
  tabPanel(
    tab_name,
    fluidRow(
      column(
        4, offset = 4,
        # a grey well containing the select list of attributes
        wellPanel(
          selectInput(select_name, "Attribute:", attributes)
        )
      ),
    ),
    fluidRow(
      style = "margin-bottom:20px;",
      column(10, offset = 1, plotOutput(plot_name))
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
    create_tab("\"Hair and Eye Color of Statistics Students\"", "select1",
              c("Hair", "Eye", "Sex"), "plot1"),
    create_tab("\"US State Facts and Figures\"", "select2",
              c("Division", "Region"), "plot2"),
    create_tab("\"Student Admissions at UC Berkeley\"", "select3",
              c("Admission Status", "Gender", "Department" = "Dept"), "plot3")
  )
)
