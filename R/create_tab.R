library(shiny)

#' Creates a new tab for a navlistPanel.
#'
#' Creates a new tab displaying a bar graph for a dataset. The tab has a
#' selectInput for selecting one of the attributes in the attributes vector
#' parameter. The selected attribute is the categorical variable according to
#' which data from the dataset is categorized to plot a bar graph.
#'
#' @param tab_name The name of the new tab.
#' @param select_name The name of the selectInput.
#' @param attributes A vector of attribute strings for the selectInput.
#' @param plot_name The name of the bar graph.
#'
#' @return A new tabPanel.
#' @export
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
