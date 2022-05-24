library(shiny)
library(ggplot2)

#' Creates a bar graph using geom_bar().
#'
#' Creates a bar graph categorizing the data in a data.frame based on an R
#' dataset according to values of the categorical variable named attribute,
#' where the height of each bar represents the amount of data in each category.
#'
#' @param attribute The name of the categorical variable in data by which the
#'   bar graph is to categorize the data.
#' @param data A data.frame containing the data from an R dataset.
#' @param entity The name of what the data in the dataset represents (for
#'   example, "Students" for HairEyeColor).
#'
#' @return A ggplot object for the bar graph.
create_geom_bar_chart <- function(attribute, data, entity) {
  # Use of get(): https://cran.r-project.org/doc/FAQ/R-FAQ.html, section 7.21
  # "How can I turn a string into a variable?"
  ggplot(data, aes(get(attribute))) +
    geom_bar(fill = "darkolivegreen2") +
    labs(
      x = attribute,
      y = "Frequency",
      title = paste(entity, "by", attribute)
    )
}

#' Creates a bar graph using geom_col().
#'
#' Creates a bar graph categorizing the data in a data.frame based on an R
#' dataset according to values of the categorical variable named attribute,
#' where the height of each bar is a value in the data.frame.
#'
#' @param attribute The name of the categorical variable in data by which the
#'   bar graph is to categorize the data.
#' @param data A data.frame containing the data from an R dataset.
#' @param entity The name of what the data in the dataset represents (for
#'   example, "Students" for HairEyeColor).
#'
#' @return A ggplot object for the bar graph.
create_geom_col_chart <- function(attribute, data, entity) {
  # Use of get(): https://cran.r-project.org/doc/FAQ/R-FAQ.html, section 7.21
  # "How can I turn a string into a variable?"
  ggplot(data, aes(get(attribute), Freq)) +
    geom_col(fill = "darkolivegreen2") +
    labs(
      x = attribute,
      y = "Frequency",
      title = paste(entity, "by", attribute)
    )
}

server <- function(input, output) {
  # Renders the bar graph for the first tab using the data in HairEyeColor
  # ("Hair and Eye Color of Statistics Students")
  data1 <- data.frame(HairEyeColor)
  output$plot1 <- renderPlot({
    create_geom_col_chart(input$select1, data1, "Students")
  })
  # Renders the bar graph for the second tab using the data in state.abb,
  # state.division, and state.region (among the state datasets about "US State
  # Facts and Figures")
  data2 <- data.frame(Abbreviation = state.abb,
                      Division = state.division,
                      Region = state.region)
  output$plot2 <- renderPlot({
    create_geom_bar_chart(input$select2, data2, "States")
  })
  # Renders the bar graph for the third tab using the data in UCBAdmissions
  # ("Student Admissions at UC Berkeley")
  data3 <- data.frame(UCBAdmissions)
  names(data3)[1] <- "Admission Status" # Changes the name of the first column
                                        # from "Admit" to the clearer "Admission
                                        # Status"
  output$plot3 <- renderPlot({
    create_geom_col_chart(input$select3, data3, "Applicants")
  })
}
