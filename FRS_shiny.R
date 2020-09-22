
  ui <- shinyUI(fluidPage(
    mainPanel(
      titlePanel("Framingham Risk Score"),
      numericInput("age", "Age:",0, min = 0, max = 300),
      numericInput("tot_chol", "Total Cholesterol:",0, min = 0, max = 300),
      numericInput("hdl", "HDL:",0, min = 0, max = 300),
      numericInput("sbp", "Treated Systolic Blood Pressure:",0, min = 0, max = 300),
      numericInput("smoke", "Smoker:",0, min = 0, max = 300),
      numericInput("diabetes", "Diabetes:",0, min = 0, max = 300),
      textOutput("text_calc"))
  ))
  server <- shinyServer(function(input, output,session){
    
    vals <- reactiveValues()
    observe({
      vals$age <- input$age
      vals$tot_chol <- input$tot_chol
      vals$hdl <- input$hdl
      vals$sbp <- input$sbp
      vals$smoke <- input$smoke
      vals$diabetes <- input$diabetes
    })
    
    output$text_calc <- renderText({
      paste("The FRS is =", vals$age+vals$tot_chol+vals$hdl+vals$sbp+vals$smoke+vals$diabetes,withMathJax("$$\\text{Display formula in heading }X_n=X_{n-1}-\\varepsilon$$"))
    })
  })
  
call_app = shinyApp(ui = ui, server = server)
