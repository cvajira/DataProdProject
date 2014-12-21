library(shiny)

shinyUI(navbarPage("Statistical Distribution Calculator",
                   tabPanel("Normal ",
                            sidebarPanel(
                              radioButtons("normcalc", "Calculation type:",
                                           c("Cumulative Probability P(X<= x)" = "prob",
                                             "x- value" = "xscore")),
                              
                              h5("Directions:"),                      
                              helpText("If you want to calculate cumulative probability, then enter mean, sd and x-value in apporopriate boxes. If you want to calculate x-value, then enter mean, sd and cumulative probability in appropriate boxes."),
                            
                              numericInput("mean", 
                                           label = "Mean", 
                                           value = 0),
                              
                              numericInput("sd", 
                                           label = "Standard Deviation", 
                                           value = 1), 
                              
                              numericInput("xprob", 
                                           label = "Cumulative Probability P(X<= x)", 
                                           value = 0.5),
                              
                              numericInput("xval", 
                                           label = "x- value", 
                                           value = 0)                    
                              ),
                        
                            mainPanel(
                              verbatimTextOutput("summary"),
                              verbatimTextOutput("summary2"),
                              plotOutput("plot")
                              )
                   ),
                   tabPanel("t-Dist ",
                            sidebarPanel(
                              radioButtons("tcalc", "Calculation type:",
                                           c("Cumulative Probability P(T<= t)" = "probt",
                                             "t- score" = "tscore")),
                              
                              h5("Directions:"),                      
                              helpText("If you want to calculate cumulative probability, then enter degree of freedom and t-score in apporopriate boxes. If you want to calculate t-score, then enter degree of freedom and cumulative probability in appropriate boxes."),
                              
                              numericInput("degree", 
                                           label = "Degree of Freedom", 
                                           value = 1),
                              
                              numericInput("tprob", 
                                           label = "Cumulative Probability P(T<= t)", 
                                           value = 0.5),
                              
                              numericInput("tval", 
                                           label = "t-Score", 
                                           value = 0)                    
                            ),
                            
                            mainPanel(
                              verbatimTextOutput("summary3")
                            )
                   ),
                   tabPanel("HELP Documentation ",
                            h5("Normal Distribution Calculator:"),
                            helpText("Example 1(x-Value): Suppose your normal distribution is with mean =10, sd=2 and you want to calculate x-value such that P(X < = x)=0.75. Then first choose, x-value radio button. Next enter mean(10), sd(2) and cumulative probability(0.75) and leave other box as it is. You will see that answer is x=11.348. Also you can see the standard normal distribution graph with shaded area. Value of shaded area equal to 0.75"  ),
                            helpText("Example 2(Cululative Probability): Suppose your normal distribution is with mean =10, sd=2 and you want to calculate culumulative probability  P(X < = x) when x=9. Then first choose, Cumulative Probability radio button. Next enter mean(10), sd(2) and x-value (9) and leave other box as it is. You will see that answer is P(X<=x)=0.308 Also you can see the standard normal distribution graph with shaded area equal to 0.308"  )
                            
                            
                            )
))
                          
  

