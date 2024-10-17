function(input, output) {
  
  output$textDisplay = renderText({
    input$comment
#    input$slider
#    input$comboBox
#    input$pickRadio
#    input$pickNumber
#    paste(as.character(as.Date(input$dateRange[[1]], origin="1970-01-01")),
#          as.character(as.Date(input$dateRange[[2]], origin="1970-01-01")),
#          collapse=",")
#    as.character(as.Date(input$theDate, origin="1970-01-01"))
#    input$boxInput
#    paste(input$checkGroup, collapse=",")
  })

  output$classDisplay = renderText({
    class(input$comment)
#    class(input$slider)
#    class(input$comboBox)
#    class(input$pickRadio)
#    class(input$pickNumber)
#    class(input$dateRange)
#    class(input$theDate)
#    class(input$boxInput)
#    class(input$checkGroup)
  })

}