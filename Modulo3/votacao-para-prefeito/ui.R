#-----------------------------------------------------------------------
#
#         Dashboards e relatórios dinâmicos com R
#
#                                            Prof. Dr. Walmes M. Zeviani
#                Department of Statistics · Federal University of Paraná
#                                       2022-mai-23 · Curitiba/PR/Brazil
#-----------------------------------------------------------------------

library(shiny)

# Função para posicionar os os elementos.
div_placeholder <- function(content = "PLACEHOLDER",
                            color = "#d2d2d2",
                            height = "3em") {
    css <- c(sprintf("background-color: %s;", color),
             "padding: 5px;",
             "margin: 5px;",
             # "border: 1px solid black;",
             "border-radius: 5px;",
             sprintf("height: %s;", height))
    div(content,
        style = paste0(css, collapse = " "))
}

fluidPage(
    titlePanel("Título da aplicação"),
    sidebarLayout(
        sidebarPanel(
            width = 2,
            # Input de Unidade Federativa.
            div_placeholder("UNIDADE FEDERATIVA",
                            color = "#f494dc"),
            # Input de Ano Eleitoral.
            div_placeholder("ANO ELEITORAL",
                            color = "#f494dc")
        ),
        mainPanel(
            flowLayout(
                # Caixas de informação.
                div_placeholder("ANO SELECIONADO",
                                color = "#f4a57e",
                                height = "5em"),
                div_placeholder("UF SELECIONADA",
                                color = "#f4a57e",
                                height = "5em"),
                div_placeholder("TOTAL DE PREFEITURAS",
                                color = "#f4a57e",
                                height = "5em"),
                div_placeholder("PERCENTUAL DE PREFEITURAS",
                                color = "#f4a57e",
                                height = "5em")
            ),
            # Mapa.
            div_placeholder("PLACEHOLRDER: BARRAS",
                            color = "#4adfa0",
                            height = "10em"),
            # Gráfico de barras.
            div_placeholder("PLACEHOLRDER: MAPA",
                            color = "#caff7c",
                            height = "10em"),
            # Tabela.
            div_placeholder("PLACEHOLRDER: TABELA",
                            color = "#8f9fd0",
                            height = "10em")
        )
    )
)

#-----------------------------------------------------------------------
