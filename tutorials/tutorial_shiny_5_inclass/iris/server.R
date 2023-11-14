library(ggplot2)

function(input, output){
  
  data(iris)

  thePlot <- reactive(
    ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) +
      geom_point()
  )

  theData <- reactive(
    iris
  )

  output$plot <- renderPlot({
    thePlot()
  })

  output$plot_hoverinfo <- renderPrint({
    cat("Hover (throttled):\n")
    str(input$plot_hover)
  })

  output$plot_clickedpoints <- renderTable({
    res <- nearPoints(iris,
                      input$plot_click,
                      "Sepal.Length",
                      "Sepal.Width")
    if (nrow(res) == 0)
      return()
    res
  })

  output$downloadPlot <- downloadHandler(
    filename <- function(){
      paste("Iris_plot", Sys.Date(), ".png", sep="")
    },
    content <- function(file){
      png(file, width=980, height=400,
          units="px", pointsize=12,
          bg="white", res=NA)
      iris.plot <- thePlot()
      print(iris.plot)
      dev.off()
    },
    contentType = "image/png"
  )
  
  output$downloadData <- downloadHandler(
    filename <- function(){
      "iris.csv"
    },
    content <- function(file){
      write.csv(theData(), file)
    },
    contentType = "text/csv"
  )

}