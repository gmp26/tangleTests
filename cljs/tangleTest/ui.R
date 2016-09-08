
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(rectanglewidget)

shinyUI(fluidPage(

  
  # Application title
  titlePanel("Tangle Test (Clojurescript version)"),
  
  # Sidebar with a slider input for number of bins

  sidebarLayout(
    sidebarPanel(
      
      h4("A standard slider"),
      
      sliderInput("sbins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("sdistPlot")
    )
  ),
  sidebarLayout(
    sidebarPanel(
      
      h4("A tangle is an inline slider"),
      
      p("The histogram uses ",
        cljsTK::tk_drag(30, " bins"),
        ". Try dragging that number to the right or left."),
      
      hr(),
      
      p("The rectangle is ",
        cljsTK::tk_drag(200, " pixels", id = "wpx"), " wide and ",
        cljsTK::tk_drag(100, " pixels", id = "hpx"), " tall.",
        rectanglewidget::rectangleWidgetOutput("square")
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
