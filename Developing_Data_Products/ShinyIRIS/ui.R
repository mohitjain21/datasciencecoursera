library(shiny)

# Define UI for Iris Data application
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Iris Flower Data Set"),
        
        # Sidebar with controls to select Summary or Plot for the data.
        sidebarLayout(
                sidebarPanel(
                        #Documentation
                        p("Iris Flower Data is multivariate data set introduced by Sir Ronald Fisher (1936)
                          as an example of discriminant analysis."),
                        
                        p("This simple app works a starting point to explore more about the data set. 
                          User needs to select the desired plot type through the reactive drop down menu.
                          This will display various plots for the dataset."),
                        
                        strong("In case of any issue, Please refresh the page."),
                        
                        p(""),
                        
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