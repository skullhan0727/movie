#-------------------
#install.packages('DT')
#install.packages("shinythemes")
library(ggplot2)
library(shiny)
library(shinythemes)

f=factor(movie$Genre)
f=factor(movie$Genre,levels = names(table(f) [order(table(f) , decreasing = TRUE)]))

  ui=navbarPage(
    theme = shinytheme("simplex"),
    navbarPage("Movie!",
              #UI of search
               tabPanel("Search",
  titlePanel("DataTable of Movie Rank"),
  fluidRow(
    column(4,
           selectInput("Year",
                       "Year:",
                       c("All",
                         unique(as.character(data$Year))))
    ),
    column(4,
           selectInput("Director",
                       "Director:",
                       c("All",
                         unique(as.character(data$Director))))
    ),
    column(4,
           selectInput("Actors",
                       "Actors:",
                       c("All",
                         unique(as.character(data$Actors))))
    ),
    DT::dataTableOutput("table")
  )),
  
  #UI of TOP3
  tabPanel("TOP3",
    titlePanel("DataTable of Movie Rank"),
           
           # Create a new Row in the UI for selectInputs
           fluidRow(
             column(4,
                    selectInput("Genre",
                                "Genre:",
                                levels(f))
             ),
             column(8,
                    imageOutput("image", width = 300)
             )))
))

  
  server=function(input, output) {
  
  # Server of search
  output$table <- DT::renderDataTable(DT::datatable({

    if (input$Year != "All") {
      data <- data[data$Year == input$Year,]
    }
    if (input$Director != "All") {
      data <- data[data$Director == input$Director,]
    }
    if (input$Actors != "All") {
      data <- data[data$Actors == input$Actors,]
    }
    data
  }))
  
  # Server of TOP3
  output$image <- renderImage({
    
    if (input$Genre=="Drama") {
      return(list(
        src = "C:/Users/user/Desktop/image/01.png",
        contentType = "image/png"
      ))
    }
    
    if (input$Genre=="Adventure") {
      return(list(
        src = "C:/Users/user/Desktop/image/02.png",
        contentType = "image/png"
      ))
    } 
    
    if (input$Genre=="Action") {
      return(list(
        src = "C:/Users/user/Desktop/image/03.png",
        contentType = "image/png"
      ))
    }
    
    if (input$Genre=="Thriller") {
      return(list(
        src = "C:/Users/user/Desktop/image/04.png",
        contentType = "image/png"
      ))
    }
    
    if (input$Genre=="Comedy") {
      return(list(
        src = "C:/Users/user/Desktop/image/05.png",
        contentType = "image/png"
      ))
    }
    else {
      return(list(
        src = "C:/Users/user/Desktop/image/06.png",
        contentType = "image/png"
      ))
    }
  },deleteFile = FALSE)
}

shinyApp(ui = ui, server = server)

