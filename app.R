#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(htmltools)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Central BBQ"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            radioButtons("Downtown"),
            radioButtons("Poplar")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            leafletOutput("CentralMap")
        
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    CentralMap <- renderLeaflet({
        leaflet(options = leafletOptions(zoomSnap=.1)) %>%
        addTiles()
        
    })
    Observe ({
        CentralData$name <- c("Downtown", "Poplar")
        CentralData$address <- c("147 E Butler Ave 38102", "6201 Poplar Ave 38119")
        CentralData$phone <- c("901.672.7760", "901.417.7962")
        CentralData$long <- c("-90.057134", "-89.856992")
        CentralData$lat <- c("35.134117", "35.101341")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
