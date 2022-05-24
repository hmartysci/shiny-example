library(shiny)

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
