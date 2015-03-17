library(shiny)
library(datasets)

# We use the iris dataset to compute different plots for various Flower Species.
irisData <- iris

# Define server logic required to plot charts for different Flower Species

shinyServer(function(input, output) {
        
        # Compute the formula text in a reactive expression since it is
        # shared by the output$caption, output$summary and output$irisPlot functions
        formulaText <- reactive({input$Plot})
        
        # Print formula Text
        output$caption <- renderText({formulaText()})
        
        # Generate a summary of the dataset
        output$summary <- renderPrint({
                if (formulaText()== "Summary") summary(irisData)
        })
        
        # Generate a desired plot for different species
        output$irisPlot <- renderPlot({
                if (formulaText()== "Box.Plot"){
                        par(mfrow=c(2, 2))
                        boxplot(Sepal.Length~ Species, data = irisData, main = "Sepal Length vs Species" )
                        boxplot(Sepal.Width~ Species, data = irisData, main = "Sepal Width vs Species")
                        boxplot(Petal.Length~ Species, data = irisData, main = "Petal Length vs Species")
                        boxplot(Petal.Width~ Species, data = irisData, main = "Petal Width vs Species")
                }
                if (formulaText()== "Scatter.Plot") pairs(irisData[,1:4],col=irisData$Species, 
                                                          main = "Iris Flower Data Set")
                
        })
})