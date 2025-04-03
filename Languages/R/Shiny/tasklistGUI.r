library(shiny)

ui <- fluidPage(
  titlePanel("Listador de Tarefas"),
  sidebarLayout(
    sidebarPanel(
      textInput("tarefa", "Digite a tarefa:"),
      actionButton("adicionar", "Adicionar Tarefa"),
      actionButton("remover", "Remover Tarefa"),
      selectInput("tarefa_selecionada", "Tarefa Selecionada:", choices = NULL)
    ),
    mainPanel(
      h3("Tarefas:"),
      uiOutput("lista_tarefas")
    )
  )
)

server <- function(input, output, session) {
  tarefas <- reactiveVal(character(0))

  observeEvent(input$adicionar, {
    nova_tarefa <- input$tarefa
    if (nzchar(nova_tarefa)) {
      tarefas(c(tarefas(), nova_tarefa))
      updateSelectInput(session, "tarefa_selecionada", choices = tarefas())
      updateTextInput(session, "tarefa", value = "")
    }
  })

  observeEvent(input$remover, {
    tarefa_remover <- input$tarefa_selecionada
    if (!is.null(tarefa_remover)) {
      tarefas(setdiff(tarefas(), tarefa_remover))
      updateSelectInput(session, "tarefa_selecionada", choices = tarefas())
    }
  })

  output$lista_tarefas <- renderUI({
    if (length(tarefas()) == 0) {
      h4("Nenhuma tarefa cadastrada.")
    } else {
      tags$ul(lapply(tarefas(), function(tarefa) {
        tags$li(tarefa)
      }))
    }
  })
}

shinyApp(ui = ui, server = server)