library(shiny)
library(bslib)
library(readr)
library(dplyr)
library(ggplot2)
library(DT)

# Load data
sales <- read_csv("data/chocolate_sales_clean.csv")

ui <- page_sidebar(
  title = "Chocolate Sales Analyser",
  
  sidebar = sidebar(
    selectInput(
      inputId = "country",
      label = "Select country:",
      choices = c("All", sort(unique(sales$country))),
      selected = "All"
    ),
    
    sliderInput(
      inputId = "year_range",
      label = "Select year range:",
      min = min(sales$year, na.rm = TRUE),
      max = max(sales$year, na.rm = TRUE),
      value = c(min(sales$year, na.rm = TRUE), max(sales$year, na.rm = TRUE)),
      sep = ""
    )
  ),
  
  layout_columns(
    card(
      card_header("Total Sales Revenue"),
      div(
        style = "padding: 16px 24px 20px 24px;",
        div(
          style = "font-size:32px; font-weight:600;",
          textOutput("total_sales")
        )
      ),
      full_screen = FALSE
    ),
    
    card(
      card_header("Filtered Rows"),
      div(
        style = "padding: 16px 24px 20px 24px;",
        div(
          style = "font-size:32px; font-weight:600;",
          textOutput("row_count")
        )
      )
    ),
    full_screen = FALSE
  ),
  
  card(
    card_header("Yearly Revenue Trend"),
    plotOutput("sales_plot", height = "350px")
  ),
  
  card(
    card_header("Filtered Data Preview"),
    DTOutput("sales_table")
  )
)

server <- function(input, output, session) {
  
  # Reactive calc
  filtered_data <- reactive({
    df <- sales %>%
      filter(year >= input$year_range[1],
             year <= input$year_range[2])
    
    if (input$country != "All") {
      df <- df %>% filter(country == input$country)
    }
    
    df
  })
  
  # Output 1
  output$total_sales <- renderText({
    total <- sum(filtered_data()$sales, na.rm = TRUE)
    format(round(total, 2), big.mark = ",")
  })
  
  # Output 2
  output$row_count <- renderText({
    nrow(filtered_data())
  })
  
  # Output 3
  output$sales_plot <- renderPlot({
    plot_df <- filtered_data() %>%
      group_by(year) %>%
      summarise(total_sales = sum(sales, na.rm = TRUE), .groups = "drop")
    
    ggplot(plot_df, aes(x = year, y = total_sales)) +
      geom_line(linewidth = 1) +
      geom_point() +
      labs(
        title = "Yearly Sales Trend",
        x = "Year",
        y = "Total Sales Revenue"
      ) +
      theme_minimal()
  })
  
  # Output 4
  output$sales_table <- renderDT({
    datatable(filtered_data(), options = list(pageLength = 8))
  })
}

shinyApp(ui = ui, server = server)