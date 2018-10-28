library(shiny)
library(e1071)

shinyServer(function(input, output) {
    model <- reactive({
        url_mammographies <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/mammographic-masses/mammographic_masses.data'
        download.file(url_mammographies, destfile='./raw_data/mammographies.csv', mode='wb')
        mammographies <- read.csv(file='./raw_data/mammographies.csv', header=FALSE, sep=',', na.strings=c("?"))
        colnames(mammographies) <- c('bi_rads', 'age', 'shape', 'margin', 'density', 'severity')
        mammographies$bi_rads <- as.factor(mammographies$bi_rads)
        mammographies$margin <- as.factor(mammographies$margin)
        mammographies$density <- as.factor(mammographies$density)
        mammographies$shape <- as.factor(mammographies$shape)
        mammographies$severity <- as.factor(mammographies$severity)
        print(sapply(mammographies, class))

        naiveBayes(severity ~ ., data = mammographies)
    })
    
    prediction <- reactive({
        data <- list(input$bi_rads, input$age, input$shape, input$margin, input$density)
        df <- as.data.frame(data)
        colnames(df) <- c('bi_rads', 'age', 'shape', 'margin', 'density')
        df$bi_rads <- as.factor(df$bi_rads)
        print(sapply(df, class))
        
        prediction <- predict(model(), df)
        prediction
    })
    
    output$result <- renderText({
        prediction <- prediction()
        if(prediction == "0"){
            "Benign: Probably there is no problem with the mass"
        } else {
            "Malignant: Probably the mass is malignant"
        }
    })
})