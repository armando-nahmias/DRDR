# ui <- fluidPage(
#   # Conteúdo para criar o front-end.
#   numericInput("idade", "Qual a sua idade?", value = NA),
#   textInput("nome", "Qual o seu nome?"),
#   textOutput("cumprimento")
# 
# )
# server <- function(input, output, session) {
#   # Conteúdo para criar o back-end.
#   tableOutput("mortgage")
#   output$cumprimento <- renderText({
#     paste0("Olá ", input$nome)
#   })
# }
# shinyApp(ui, server)


# library(shiny)
# 
# ui <- fluidPage(
#   sliderInput("x", label = "Se x é", min = 1, max = 50, value = 30),
#   sliderInput("y", label = "Se y é", min = 1, max = 50, value = 30),
#   "Então x vezes y é",
#   textOutput("produto")
# )
# 
# server <- function(input, output, session) {
#   output$produto <- renderText({
#     input$x * input$y # Há algo errado aqui, escolha a alternativa que resolva o problema
#   })
# }
# 
# shinyApp(ui, server)


# library(shiny)
# 
# ui <- fluidPage(
#   sliderInput("x", "Se x é", min = 1, max = 50, value = 30),
#   sliderInput("y", "e y é", min = 1, max = 50, value = 5),
#   "então, (x * y) é", textOutput("produto"),
#   "e, (x * y) + 5 é", textOutput("produto_mais5"),
#   "e (x * y) + 10 é", textOutput("produto_mais10")
# )
# 
# server <- function(input, output, session) {
#   produto <- reactive({
#     input$x * input$y
#   })
#   output$produto <- renderText({
#     produto()
#   })
#   output$produto_mais5 <- renderText({
#     produto() + 5
#   })
#   output$produto_mais10 <- renderText({
#     produto() + 10
#   })
# }
# 
# shinyApp(ui, server)

library(shiny)
library(ggplot2)

datasets <- c("economics", "faithfuld", "seals")

ui <- fluidPage(
  selectInput("dataset", "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  plotOutput("plot")
)

server <- function(input, output, session) {
  # Bloco 1.
  dataset <- reactive({
    get(input$dataset, "package:ggplot2")
  })
  # Bloco 2.
  output$summary <- renderPrint({
    summary(dataset())
  })
  # Bloco 3.
  output$plot <- renderPlot({
    plot(dataset())
  }, res = 96)
}

shinyApp(ui, server)