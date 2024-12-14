library(shiny)
library(shinydashboard)
library(here)

# UI
ui <- dashboardPage(
  dashboardHeader(
    title = div(style = "text-align: center; width: 100%;", 
                "Economic Impact of the Russia-Ukraine Conflict on U.S Key Indicators")
  ),
  dashboardSidebar(
    width = 300, # Extended sidebar width
    sidebarMenu(
      menuItem("Scatter Plot: Oil Prices vs S&P 500", tabName = "scatter_plot", icon = icon("chart-line")),
      menuItem("Oil and S&P 500 Trends", tabName = "oil_sp500", icon = icon("chart-line")),
      menuItem("Stocks and Inflation", tabName = "stocks_inflation", icon = icon("chart-line")),
      menuItem("Consumer Sentiment and Oil Price Trends", tabName = "cs_oil", icon = icon("chart-line"))
    )
  ),
  dashboardBody(
    tabItems(
      # Scatter Plot Tab
      tabItem(tabName = "scatter_plot",
              imageOutput("scatter_plot_image")),
      
      # Oil and S&P 500 Animation Tab
      tabItem(tabName = "oil_sp500",
              imageOutput("oil_sp500_gif")),
      
      # Stocks and Inflation Animation Tab
      tabItem(tabName = "stocks_inflation",
              imageOutput("stocks_inflation_gif")),
      
      # Oil and Consumer Sentiment Tab 
      tabItem(tabName = "cs_oil",
              imageOutput("oil_consumer_sentiment_image"))
    )
  )
)

# Server
server <- function(input, output, session) {
  
  # Debug: Print image paths
  print(here("images", "oil_vs_stocks_scatterplot.png"))
  print(here("images", "stocks_vs_oil.gif"))
  print(here("images", "stocks_vs_inflation.gif"))
  print(here("images", "sentiment_vs_oil_boxplot.png"))
  
  # Render Scatter Plot Image
  output$scatter_plot_image <- renderImage({
    list(
      src = here("images", "oil_vs_stocks_scatterplot.png"),
      contentType = "image/png",
      alt = "Scatter Plot: Oil Prices vs S&P 500",
      height = 680,
      width = 1100
    )
  }, deleteFile = FALSE)
  
  # Render Oil and S&P 500 Animation
  output$oil_sp500_gif <- renderImage({
    list(
      src = here("images", "stocks_vs_oil.gif"),
      contentType = "image/gif",
      alt = "Oil and S&P 500 Trends"
    )
  }, deleteFile = FALSE)
  
  # Render Stocks and Inflation Animation
  output$stocks_inflation_gif <- renderImage({
    list(
      src = here("images", "stocks_vs_inflation.gif"),
      contentType = "image/gif",
      alt = "Stocks and Inflation Trends"
    )
  }, deleteFile = FALSE)
  
  # Render Consumer Sentiment and Oil Price Trends Image
  output$oil_consumer_sentiment_image <- renderImage({
    list(
      src = here("images", "sentiment_vs_oil_boxplot.png"),
      contentType = "image/png",
      alt = "Consumer Sentiment and Oil Price Trends",
      height = 680,
      width = 1100
    )
  }, deleteFile = FALSE)
}

# Run the App
shinyApp(ui, server)