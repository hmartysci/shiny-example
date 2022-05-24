library(tidyverse)

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
#' @export
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
#' @export
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
