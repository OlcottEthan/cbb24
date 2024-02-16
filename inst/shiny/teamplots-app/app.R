ui <- fluidPage(
  titlePanel(div('2023-2024 College Basketball Games', style='text-align:center;')),
  
  sidebarLayout(
    sidebarPanel(
      textInput('team','Team'),
      selectInput('plotfunction', 'Plot', c('Win Margins','Home & Away Wins')),
      tags$style(type='text/css','.sidebar{margin-right:50px; }')
    ),
    mainPanel(
      br(),br(),
      tableOutput('table'),
      textOutput('valid_name'),
      br(),br(),br(),br(),
      plotOutput('plot',height='375px', width='600px')
    )
  )
)

server <- function (input,output,session){
  library(shiny)
  library(kableExtra)
  
  teams <- sort(cbbga_wins_23[['team']])
  
  valid_name <- reactive({input$team %in% teams})
  
  output$valid_name <- renderText({
    if (input$team == ''){
      paste("No team specified")
    }else if (!valid_name()){
      similar_names <- teams[grep(input$team,teams,ignore.case = TRUE)]
      if (length(similar_names) == 0){
        return("Not a valid team name")
      } else {
        return(result_string <- paste("Similar team names:", paste(similar_names, collapse = ", ")))
      }
    }else{
      ""
    }
  })
  
  output$table <- renderUI({
    if (valid_name()){
      html_table <- knitr::kable(team_results(input$team),format = 'html') |>
        kable_styling() |>
        kableExtra::scroll_box(width=max("90%","600px"))
      HTML(html_table)
    }
    else {
      return(NULL)
    }
  })
  
  output$plot <- renderPlot({
    if (valid_name()) {
      if (input$plotfunction == "Win Margins") {
        boxplot_winmargin_vs_homestatus(input$team)
      } else {
        barplot_win_vs_homestatus(input$team)
      }
    } else {
      NULL
    }
  })
  
}

shinyApp(ui,server)
