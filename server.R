library(shiny)
shinyServer(
  function(input, output,session) {
    
    output$summary <- renderPrint({
     if(input$normcalc=="prob"){
       cat("P(X<=" ,input$xval, ") := ", pnorm(input$xval,input$mean,input$sd))
     }
     if(input$normcalc=="xscore"){
       cat("P(X<= x) = ",input$xprob, "==>x := ", qnorm(input$xprob,input$mean,input$sd))
     }
     
    })
    
    output$summary2 <- renderPrint({
      cat("This is the corrospond standard normal distribution plot for given normal distribution. Shaded area corrospond to cumulative probability/ standarized X-value(z-score)")
    })
    
    output$plot <- renderPlot({
        
        z1<-0
       if(input$normcalc=="xscore"){
         z1<-qnorm(input$xprob)
       }else{
         z1<-(input$xval-input$mean)/input$sd
       }
        
      
       x1<-seq(-4,4,length=200)
       y1<-dnorm(x1)
       plot(x1,y1,type="l", lwd=2, xlab="z-score", ylab="", col="blue")
       x1<-seq(-4,z1,length=200) 
       y1<-dnorm(x1)
       polygon(c(-4,x1,z1),c(0,y1,0),col="gray")
    })
    
    output$summary3 <- renderPrint({
      if(input$tcalc=="probt"){
        cat("P(T<=" ,input$tval, ") := ", pt(input$tval,input$degree))
      }
      if(input$tcalc=="tscore"){
        cat("P(T<= t) = ",input$tprob, "==>t := ", qt(input$tprob,input$degree))
      }
      
    })
    
  }
)