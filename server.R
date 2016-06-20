library(shiny)

data <- read.csv("outcome-of-care-measures.csv")

best <- function(State, outcome) {

  col <- if (outcome == "heart attack") {
    11
  } else if (outcome == "heart failure") {
    17
  } else {
    23
  }
  data[, col] <- suppressWarnings(as.numeric(levels(data[, col])[data[, col]]))
  data[, 2] <- as.character(data[, 2])
  statedata <- data[grep(State, data$State), ]
  orderdata <- statedata[order(statedata[, col], statedata[, 2], na.last = NA), ]
  orderdata[1, 2]
}

shinyServer(
  function(input, output){
    best_hos<-reactive({best(input$State, input$outcome)})
    output$inputvalues<-renderPrint({paste(input$State, ",",
                                           input$outcome)})
    output$besthospital<-renderPrint({paste(best_hos())})
    }
  )