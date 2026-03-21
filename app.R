library(shiny)

# Interfata grafica
ui <- fluidPage(
  # CSS ca sa arate frumos aplicatia. (inspirat de culorile din theme Dracula de pe RStudio)
  # In general, am aflat ce elemente doresc sa modific cu inspect element in browser. (de exemplu, irs este pentru slider)
  tags$style(HTML("
    body {
      background-color: #282a36 !important;
      color: #f8f8f2 !important;
    }
    
    .navbar-default {
      background-color: #44475a !important;
      border-color: #6272a4 !important;
    }
    
    .navbar-default .navbar-brand {
      color: #ff79c6 !important;
      font-weight: bold !important;
    }
    
    .navbar-default .navbar-nav > li > a {
      color: #f8f8f2 !important;
      font-weight: bold !important;
    }
    
    .navbar-default .navbar-nav > li > a:hover { 
      background-color: #ff79c6 !important; 
      color: #282a36 !important;
    }
      
    .navbar-default .navbar-nav > .active > a {
      background-color: #6272a4 !important;
      color: #f1fa8c !important; 
    }
    
    .well {
      background-color: #44475a !important;
      border-color: #6272a4 !important;
    }
    
    .btn-primary {
      background-color: #ff79c6 !important;
      border-color: #ff79c6 !important;
      color: #282a36 !important;
      font-weight: bold !important;
    }
    
    .btn-primary:hover {
      background-color: #f1fa8c !important;
      border-color: #f1fa8c !important;
    }
    
    .irs-bar {
      background: #ff79c6 !important;
    }
    
    .irs-handle {
      border: 8px solid #9d7cff !important;
    }
    
    .irs-single {
      background: #9d7cff !important;
    }
    
    pre {
      font-family: monospace !important;
      background-color: #282a36 !important;
      color: #f8f8f2 !important;
      white-space: pre !important;
      line-height: 1 !important;
      font-size: 11px !important;
      border-color: #6272a4 !important;
    }
  ")),
  
  # Meniu cu cate o pagina pentru fiecare din cele 5 exercitii. Fiecare exercitiu are apoi toate graficele unul sub altul.
  navbarPage(
    "Exercițiul 2",
    
    tabPanel("1.",
             sidebarPanel(
               sliderInput("n", 
                           "Numărul de observații (n):", 
                           value = 500, 
                           min = 100, 
                           max = 5000,
                           step = 10),
               
               br(),
               
               # Buton pentru a genera un nou set de valori. (am ales sa implememntez asa, in loc sa se modifice automat graficele cand se trage de slider)
               actionButton("go", 
                            "Go!",
                            class = "btn-primary",
                            icon = icon("refresh")),
               
               br(), br(),
               
               # Pisica decorativa!
               pre("
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠾⠉⢻⣦⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣠⣤⢤⣤⣴⠟⠋⠀⠀⠀⠀⠀⠀⠉⠛⠻⣶⣤⠤⢶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⢤⣄⣀⠀⠀⢸⣿⠽⣶⡘⣟⠀⣰⡆⠀⠀⠀⠀⠀⠀⠀⣀⠉⠀⠀⢸⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠈⠉⠉⠛⠛⠷⠤⢄⣘⡀⠈⠀⠓⠻⠶⠀⢴⣶⡞⣯⠽⣦⠀⢾⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠓⠒⠤⠤⢀⣀⣿⣝⠁⠋⠀⠀⢻⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠓⠲⠤⠬⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠓⠒⠂⠤⠤⣤
            ")
               
             ),
             
             # Graficele unul sub altul, separate prin linii.
             mainPanel(
               plotOutput("plotX", height = "300px"),
               hr(),
               plotOutput("plot32X", height = "300px"),
               hr(),
               plotOutput("plotX2", height = "300px"),
               hr(),
               plotOutput("plotsuma", height = "300px"),
               hr(),
               plotOutput("plotsuma2", height = "300px")
             )
    ),
    
    tabPanel("2.",
             sidebarPanel(
               sliderInput("n2",
                           "Numărul de observații (n):", 
                           value = 500, 
                           min = 100, 
                           max = 5000,
                           step = 10),
               
               numericInput("mu", 
                            "μ (medie):", 
                            value = 2, 
                            step = 0.5),
               
               numericInput("sigma", 
                            "σ (deviație standard):", 
                            value = 3, 
                            min = 0.1, 
                            step = 0.1),
               
               br(),
               
               actionButton("go2",
                            "Go!",
                            class = "btn-primary",
                            icon = icon("refresh")),
               
             ),
             
             mainPanel(
               plotOutput("2plotX", height = "300px"),
               hr(),
               plotOutput("2plot32X", height = "300px"),
               hr(),
               plotOutput("2plotX2", height = "300px"),
               hr(),
               plotOutput("2plotsuma", height = "300px"),
               hr(),
               plotOutput("2plotsuma2", height = "300px")
             )
    ),
    
    tabPanel("3.",
             sidebarPanel(
               sliderInput("n3",
                           "Numărul de observații (n):", 
                           value = 500, 
                           min = 100, 
                           max = 5000,
                           step = 10),
               
               numericInput("lambda3", 
                            "λ (lambda):", 
                            value = 1, 
                            min = 0.01, 
                            step = 0.1),
               
               br(),
               
               actionButton("go3",
                            "Go!",
                            class = "btn-primary",
                            icon = icon("refresh")),
             ),
             
             mainPanel(
               plotOutput("3plotX", height = "300px"),
               hr(),
               plotOutput("3plot25X", height = "300px"),
               hr(),
               plotOutput("3plotX2", height = "300px"),
               hr(),
               plotOutput("3plotsuma", height = "300px")
             )
    ),
    
    tabPanel("4.",
             sidebarPanel(
               sliderInput("n4",
                           "Numărul de observații (n):", 
                           value = 500, 
                           min = 100, 
                           max = 5000,
                           step = 10),
               
               numericInput("lambda4", 
                            "λ (lambda):", 
                            value = 3, 
                            min = 0.01, 
                            step = 0.1),
               
               br(),
               
               actionButton("go4",
                            "Go!",
                            class = "btn-primary",
                            icon = icon("refresh")),
             ),
             
             mainPanel(
               plotOutput("4plotX", height = "300px"),
               hr(),
               plotOutput("4plot3X2", height = "300px"),
               hr(),
               plotOutput("4plotX2", height = "300px"),
               hr(),
               plotOutput("4plotsuma", height = "300px")
             )
    ),
    
    tabPanel("5.",
             sidebarPanel(
               sliderInput("n5",
                           "Numărul de observații (n):", 
                           value = 500, 
                           min = 100, 
                           max = 5000,
                           step = 10)
               ,
               sliderInput("size5",
                           "r (număr de încercări):",
                           value = 10,
                           min = 1,
                           max = 100,
                           step = 1),
               
               sliderInput("prob5",
                           "p (probabilitate):",
                           value = 0.5,
                           min = 0,
                           max = 1,
                           step = 0.01),
               
               br(),
               
               actionButton("go5",
                            "Go!",
                            class = "btn-primary",
                            icon = icon("refresh")),
             ),
             
             mainPanel(
               plotOutput("5plotX", height = "300px"),
               hr(),
               plotOutput("5plot5X4", height = "300px"),
               hr(),
               plotOutput("5plotX3", height = "300px"),
               hr(),
               plotOutput("5plotsuma", height = "300px")
             )
    ),
  )
)

# Logica aplicatiei. (R propiu-zis)
server <- function(input, output) {
  # Culorile pentru grafice, ca sa nu caut numele lor de fiecare data si sa fiu mai eficienta.
  grafice <- list(
    bg = "#282a36",
    title = "#ff79c6",
    text = "#f8f8f2",
    grid = "#44475a",
    empirice = "#ff79c6",
    teoretice = "#f1fa8c",
    legend_bg = "#44475a",
    legend_border = "#6272a4"
  ) 
  
  # Functie de colorare, ca sa scriu cat mai putin cod repetitiv.
  coloreaza <- function() {
    par(bg = grafice$bg,
        col.main = grafice$text,
        col.lab = grafice$text,
        col.axis = grafice$text,
        fg = grafice$text)
  }
  
  # 1 - Distributie normala standard
  # Date aleatorii la fiecare apasare a butonului.
  simuleaza <- eventReactive(input$go, {
    rnorm(input$n)
  }, ignoreNULL = FALSE)
  # ignoreNULL = FALSE este acolo pentru a fi afisat ceva initial, inainte de vreo apasare a butonului. (sa nu fie pagina goala...)
  
  output$plotX <- renderPlot({
    x <- simuleaza()
    est <- ecdf(x)
    
    coloreaza()
    
    # Empiric!
    plot(est,
         main = bquote("Funcția pentru: " ~ x),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7,
         ny = 7,
         col = grafice$grid,
         lty = "dotted")
    
    # Teoretic, pentru comparatie. (curve - pentru continuu)
    curve(pnorm, 
          add = TRUE, 
          lwd = 2, 
          lty = 2,
          col = grafice$teoretice)
    
    # Legenda pentru claritate.
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  # Analog a fost construite si celelalte reprezentari grafice.
  
  output$plot32X <- renderPlot({
    x <- simuleaza()
    y <- 3*x + 2
    est <- ecdf(y)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ 3*x + 2),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, 
         ny = 7, 
         col = grafice$grid, 
         lty = "dotted")
    
    curve(pnorm((x - 2)/3),
          add = TRUE,
          lwd = 2,
          lty = 2,
          col = grafice$teoretice)
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$plotX2 <- renderPlot({
    x <- simuleaza()
    y <- x^2
    est <- ecdf(y)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ x^2),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, 
         ny = 7, 
         col = grafice$grid, 
         lty = "dotted")
    
    curve(pchisq(x, df = 1),
          add = TRUE,
          lwd = 2,
          lty = 2,
          col = grafice$teoretice)
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$plotsuma <- renderPlot({
    x <- simuleaza()
    n <- length(x)
    sims <- replicate(2000, sum(sample(x, replace = TRUE)))
    est <- ecdf(sims)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ sum(x[i])),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, 
         ny = 7, 
         col = grafice$grid, 
         lty = "dotted")
    
    curve(pnorm(x, mean = 0, sd = sqrt(n)),
          add = TRUE,
          lwd = 2,
          lty = 2,
          col = grafice$teoretice)
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$plotsuma2 <- renderPlot({
    x <- simuleaza()
    n <- length(x)
    sims <- replicate(2000, sum(sample(x, replace = TRUE)^2))
    est <- ecdf(sims)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ sum(x[i]^2)),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, 
         ny = 7, 
         col = grafice$grid, 
         lty = "dotted")
    
    curve(pchisq(x, df = n),
          add = TRUE,
          lwd = 2,
          lty = 2,
          col = grafice$teoretice)
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  # 2 - Distributie normala generala
  simuleaza2 <- eventReactive(input$go2, {
    rnorm(input$n2, mean = input$mu, sd = input$sigma)
  }, ignoreNULL = FALSE)
  
  output$`2plotX` <- renderPlot({
    x <- simuleaza2()
    est <- ecdf(x)
    
    mu_value <- isolate(input$mu)
    sigma_value <- isolate(input$sigma)
    # isolate este folosit pentru a functiona bine butonul
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ x),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7,
         ny = 7,
         col = grafice$grid,
         lty = "dotted")
    
    curve(pnorm(x, mean = mu_value, sd = sigma_value), 
          add = TRUE, 
          lwd = 2, 
          lty = 2,
          col = grafice$teoretice)
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$`2plot32X` <- renderPlot({
    x <- simuleaza2()
    y <- 3*x + 2
    est <- ecdf(y)
    
    mu_value <- isolate(input$mu)
    sigma_value <- isolate(input$sigma)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ 3*x + 2),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, 
         ny = 7, 
         col = grafice$grid, 
         lty = "dotted")
    
    curve(pnorm(x, mean = 3*mu_value + 2, sd = 3*sigma_value),
          add = TRUE,
          lwd = 2,
          lty = 2,
          col = grafice$teoretice)
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$`2plotX2` <- renderPlot({
    x <- simuleaza2()
    y <- x^2
    est <- ecdf(y)
    
    mu_value <- isolate(input$mu)
    sigma_value <- isolate(input$sigma)
    lambda_value <- (mu_value / sigma_value)^2
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ x^2),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, 
         ny = 7, 
         col = grafice$grid, 
         lty = "dotted")
    
    curve(pchisq(x, df = 1, ncp = lambda_value),
          add = TRUE,
          lwd = 2,
          lty = 2,
          col = grafice$teoretice)
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$`2plotsuma` <- renderPlot({
    x <- simuleaza2()
    n <- length(x)
    sims <- replicate(2000, sum(sample(x, replace = TRUE)))
    est <- ecdf(sims)
    
    mu_value <- isolate(input$mu)
    sigma_value <- isolate(input$sigma)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ sum(x[i])),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, 
         ny = 7, 
         col = grafice$grid, 
         lty = "dotted")
    
    curve(pnorm(x, mean = n*mu_value, sd = sqrt(n)*sigma_value),
          add = TRUE,
          lwd = 2,
          lty = 2,
          col = grafice$teoretice)
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$`2plotsuma2` <- renderPlot({
    x <- simuleaza2()
    n <- length(x)
    sims <- replicate(2000, sum(sample(x, replace = TRUE)^2))
    est <- ecdf(sims)
    
    mu_value <- isolate(input$mu)
    sigma_value <- isolate(input$sigma)
    lambda_value <- n * (mu_value / sigma_value)^2
    sigma_sq_value <- sigma_value^2
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ sum(x[i]^2)),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, 
         ny = 7, 
         col = grafice$grid, 
         lty = "dotted")
    
    curve(pchisq(x / sigma_sq_value, df = n, ncp = lambda_value),
          add = TRUE,
          lwd = 2,
          lty = 2,
          col = grafice$teoretice)
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  # 3 - Distributia exponentiala
  simuleaza3 <- eventReactive(input$go3, {
    rexp(input$n3, rate = input$lambda3)
  }, ignoreNULL = FALSE)
  
  output$`3plotX` <- renderPlot({
    x <- simuleaza3()
    est <- ecdf(x)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ x),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, 
         ny = 7, 
         col = grafice$grid, 
         lty = "dotted")
    
    curve(pexp(x, rate = input$lambda3),
          add = TRUE,
          lwd = 2,
          lty = 2,
          col = grafice$teoretice)
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$`3plot25X` <- renderPlot({
    x <- simuleaza3()
    y <- 2 - 5*x
    est <- ecdf(y)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ 2 - 5*x),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, ny = 7, col = grafice$grid, lty = "dotted")
    
    curve(ifelse(x <= 2, 1 - pexp((2 - x)/5, rate = input$lambda3), 1),
          add = TRUE,
          lwd = 2,
          lty = 2,
          col = grafice$teoretice)
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$`3plotX2` <- renderPlot({
    x <- simuleaza3()
    y <- x^2
    est <- ecdf(y)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ x^2),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, ny = 7, col = grafice$grid, lty = "dotted")
    
    curve(pexp(sqrt(x), rate = input$lambda3),
          add = TRUE,
          lwd = 2,
          lty = 2,
          col = grafice$teoretice)
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$`3plotsuma` <- renderPlot({
    x <- simuleaza3()
    n <- length(x)
    sims <- replicate(2000, sum(sample(x, replace = TRUE)))
    est <- ecdf(sims)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ sum(x[i])),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, ny = 7, col = grafice$grid, lty = "dotted")

    curve(pgamma(x, shape = n, rate = input$lambda3),
          add = TRUE,
          lwd = 2,
          lty = 2,
          col = grafice$teoretice)
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  # 4 - Distributia Poisson
  simuleaza4 <- eventReactive(input$go4, {
    rpois(input$n4, lambda = input$lambda4)
  }, ignoreNULL = FALSE)
  
  output$`4plotX` <- renderPlot({
    x <- simuleaza4()
    est <- ecdf(x)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ x),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, ny = 7, col = grafice$grid, lty = "dotted")
    
    xvals <- 0:max(x)
    
    # lines - pentru discret
    lines(xvals, ppois(xvals, lambda = input$lambda4),
          lwd = 2,
          lty = 2,
          col = grafice$teoretice,
          type = "s")
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$`4plot3X2` <- renderPlot({
    x <- simuleaza4()
    y <- 3*x + 2
    est <- ecdf(y)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ 3*x + 2),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, ny = 7, col = grafice$grid, lty = "dotted")
    
    xvals <- seq(min(y), max(y))
    
    lines(xvals, ppois((xvals - 2)/3, lambda = input$lambda4),
          lwd = 2,
          lty = 2,
          col = grafice$teoretice,
          type = "s")
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$`4plotX2` <- renderPlot({
    x <- simuleaza4()
    y <- x^2
    est <- ecdf(y)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ x^2),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, ny = 7, col = grafice$grid, lty = "dotted")
    
    xvals <- sort(unique(y))
    F_y <- sapply(xvals, function(val) sum(dpois(0:floor(sqrt(val)), lambda = input$lambda4)))
    
    lines(xvals, F_y, lwd = 2, lty = 2, col = grafice$teoretice, type = "s")
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$`4plotsuma` <- renderPlot({
    x <- simuleaza4()
    n <- length(x)
    sims <- replicate(2000, sum(sample(x, replace = TRUE)))
    est <- ecdf(sims)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ sum(x[i])),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, ny = 7, col = grafice$grid, lty = "dotted")

    xvals <- min(sims):max(sims)
    
    lines(xvals, ppois(xvals, lambda = n*input$lambda4),
          lwd = 2,
          lty = 2,
          col = grafice$teoretice,
          type = "s")
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  # 5 - Distributia binomiala
  sliderVals5 <- eventReactive(input$go5, {
    list(
      n5 = input$n5,
      size5 = input$size5,
      prob5 = input$prob5
    )
  }, ignoreNULL = FALSE)
  
  simuleaza5 <- eventReactive(input$go5, {
    vals <- sliderVals5()
    rbinom(vals$n5, size = vals$size5, prob = vals$prob5)
  }, ignoreNULL = FALSE)
  
  output$`5plotX` <- renderPlot({
    vals <- sliderVals5()
    x <- simuleaza5()
    est <- ecdf(x)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ x),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, ny = 7, col = grafice$grid, lty = "dotted")
    
    xvals <- 0:vals$size5
    
    lines(xvals, pbinom(xvals, size = vals$size5, prob = vals$prob5),
          lwd = 2,
          lty = 2,
          col = grafice$teoretice,
          type = "s")
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$`5plot5X4` <- renderPlot({
    vals <- sliderVals5()
    x <- simuleaza5()
    y <- 5*x + 4
    est <- ecdf(y)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ 5*x + 4),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, ny = 7, col = grafice$grid, lty = "dotted")

    xvals <- seq(min(y), max(y))
    
    lines(xvals, pbinom((xvals - 4)/5, size = vals$size5, prob = vals$prob5),
          lwd = 2,
          lty = 2,
          col = grafice$teoretice,
          type = "s")
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$`5plotX3` <- renderPlot({
    vals <- sliderVals5()
    x <- simuleaza5()
    y <- x^3
    est <- ecdf(y)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ x^3),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, ny = 7, col = grafice$grid, lty = "dotted")
    
    xvals <- sort(unique(y))
    F_y <- sapply(xvals, function(val) sum(dbinom(0:floor(val^(1/3)), size = vals$size5, prob = vals$prob5)))
    
    lines(xvals, F_y, lwd = 2, lty = 2, col = grafice$teoretice, type = "s")
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
  
  output$`5plotsuma` <- renderPlot({
    vals <- sliderVals5()
    x <- simuleaza5()
    n <- length(x)
    sims <- replicate(2000, sum(sample(x, replace = TRUE)))
    est <- ecdf(sims)
    
    coloreaza()
    
    plot(est,
         main = bquote("Funcția pentru: " ~ sum(x[i])),
         xlab = "x",
         ylab = "F(x)",
         lwd = 2,
         bty = "l",
         col = grafice$empirice,
         pch = 8)
    
    grid(nx = 7, ny = 7, col = grafice$grid, lty = "dotted")

    xvals <- min(sims):(n*vals$size5)
    
    lines(xvals, pbinom(xvals, size = n*vals$size5, prob = vals$prob5),
          lwd = 2,
          lty = 2,
          col = grafice$teoretice,
          type = "s")
    
    legend("topleft",
           legend = c("empiric", "teoretic"),
           col = c(grafice$empirice, grafice$teoretice),
           lwd = 2.5,
           bg = grafice$legend_bg,
           text.col = grafice$text,
           box.col = grafice$legend_border)
  })
}

shinyApp(ui = ui, server = server)