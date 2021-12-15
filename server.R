library(shiny)

shinyServer(function(input, output) {
    
    output$distPlot <- renderPlot({
        
        if (input$distribution=="Normal") {
            x    <- seq(-input$normal_n/2,input$normal_n/2)
            y <- dnorm(x,input$mean,input$sd)
        }
        
        if (input$distribution=="Poisson") {
            x    <- seq(1,input$poisson_n)
            y <- dpois(x,input$lambda)
        }
        
        if (input$distribution=="Binomial") {
            x    <- seq(1,input$binomial_n)
            y <- dbinom(x,input$trials,input$probability)
        }
        
        plot(x, y)
        
    })
    
})
