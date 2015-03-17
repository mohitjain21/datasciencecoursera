library(shiny)

# Define UI for Iris Data application
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Iris Flower Data Set"),
        
        # Sidebar with controls to select Summary or Plot for the data.
        sidebarLayout(
                sidebarPanel(
                        selectInput("Plot", "Choose a Plot Type:",
                                    c(
                                            "Summary" = "Summary",    
                                            "Scatter Plot" = "Scatter.Plot",
                                            "Box Plot" = "Box.Plot"                           
                                    ))),
                
                # Show the Plot type selected.
                mainPanel(
                        h3(textOutput("caption")),
                        verbatimTextOutput("summary"),
                        plotOutput("irisPlot")                        
                )
        )
))