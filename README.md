# Chocolate Sales Analyser (R Shiny)

This repository contains an individual R Shiny implementation of the Chocolate Sales Analyser dashboard. It is adapted from our [group project](https://github.com/UBC-MDS/DSCI-532_2026_17_chocosales-analyser), which was originally built in Shiny for Python.

## Features

- Country filter
- Year range filter
- Reactive filtered dataset
- KPI outputs
- Revenue trend plot
- Data table preview

## Live App

[Deployed app link](https://019cdf13-75d6-a5f7-214a-60645e573ba5.share.connect.posit.cloud/)

## Get Started

### Clone the Repository

Clone the repo and follow the steps below to run the dashboard locally:

```bash
git clone https://github.com/shihan66/532-ia.git
cd 532-ia/
```

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