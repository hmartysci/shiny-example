# shiny-example

A small Shiny app demonstrating what I have learned from the Shiny tutorial at https://shiny.rstudio.com/tutorial/. The app is deployed at https://subhasischakraborti.shinyapps.io/shinyapps/.

The app consists of three tabs, each of which displays a bar graph based on a dataset from R’s datasets package. On each tab, a select input is used to choose an attribute, which becomes the categorical variable according to which data from the dataset is categorized to plot the bar graph.

This repository uses a GitHub Actions workflow from [r-lib/actions](https://github.com/r-lib/actions/tree/v2-branch/examples#lint-project-workflow) for linting.
