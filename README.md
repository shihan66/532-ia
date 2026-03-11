# Chocolate Sales Analyser (R Shiny)

This repository contains an individual R Shiny implementation of the Chocolate Sales Analyser dashboard. It is adapted from our group project, which was originally built in Shiny for Python.

## Features

- Country filter
- Year range filter
- Reactive filtered dataset
- KPI outputs
- Revenue trend plot
- Data table preview

## Live App
[Deployed app link]()

## Get Started

### Install packages

Open R or RStudio and run:

```r
install.packages(c("shiny", "bslib", "readr", "dplyr", "ggplot2", "DT"))
```

### Run the app locally

Make sure you are in the root project directory, then run:

```r
shiny::runApp()
```

Or oepn `app.R` in RStudio and click **Run App**.