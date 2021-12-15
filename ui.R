library(shiny)

shinyUI(fluidPage(

    titlePanel(h2("Discrete Distribution Plotter", align = "center")),
    sidebarLayout(
   
        sidebarPanel(
            selectInput("distribution", "Distribution", choices = list("Normal", "Poisson","Binomial")),
            conditionalPanel("input.distribution=='Normal'", 
                             sliderInput("normal_n","Number of points",1,100,50),
                             sliderInput("mean","Mean",-50,50,0),
                             sliderInput("sd","Standard Deviation",0,10,5)
                            
            ),
            conditionalPanel("input.distribution=='Poisson'", 
                         sliderInput("poisson_n","Number of points",1,100,50),
                         sliderInput("lambda","Lambda",1,100,50),

            ),
            conditionalPanel("input.distribution=='Binomial'", 
                         sliderInput("binomial_n","Number of points",1,100,50),
                         sliderInput("trials","Trials",1,100,50),
                         sliderInput("probability","Probability",0,1,0.5)
        )
    ),

        mainPanel(
            plotOutput("distPlot")
        )
    ),
 
 mainPanel(h2("Documentation"),
            h4("1. Choose the distribution you would like to plot (Normal, Poisson or Binomial)"),
            h4("2. Choose the number of points to be plotted (1-100)"),
            h4("3. Select the parameters associated with the distribution you chose:"),
               h4("- Normal: Mean and Standard Deviation"),
               h4("- Poisson: Lambda"),
               h4("- Binomial: Number of Trials and Probability")
    
 )
))

