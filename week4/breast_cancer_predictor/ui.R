library(shiny)

shinyUI(fluidPage(
    titlePanel("Breast Cancer Predictor"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("bi_rads",
                        "What is the value of the BI-RADS assessment?",
                        min = 1, max = 5,
                        value = 3),
            sliderInput("age",
                        "How old is the patient?",
                        min = 0, max = 150,
                        value = 26),
            selectInput("shape",
                        "How is the shape of the mass?",
                        c("Round" = "1",
                          "Oval" = "2",
                          "Lobular" = "3",
                          "Irregular" = "4")),
            selectInput("margin",
                        "How is the margin of the mass?",
                        c("Circumscribed" = "1",
                          "Microlobulated" = "2",
                          "Obscured" = "3",
                          "ill-defined" = "4",
                          "Spiculated" = "5")),
            selectInput("density",
                        "What is the density of the mass?",
                        c("High" = "1",
                          "Iso" = "2",
                          "Low" = "3",
                          "Fat-containing" = "4")),
            submitButton("Predict")
        ),
        mainPanel(
            h3("Documentation"),
            div("This web application helps to predict if a mass in the breast is benign or malignant."),
            div("BI-RADS (Breast Imaging-Reporting and Data System) is a system used together with mammography to inform the patient about the risk of developing breast cancer."),
            span("More info about BI-RAD "),
            a(href="https://en.wikipedia.org/wiki/BI-RADS", "here."),
            div("We consider categories from 1 to 5. Categories 0 and 6 are not considered in this application because in category 0 there is too much incertainty and in category 6 there exist a biopsy that confirms the malignancy of the mass."),
            div("The age is an important factor in the prediction because the breast cancer is more probable in old girls. The shape, margins and density of the mass complements the information needed for the prediction."),
            span("This application was developed using the data available in: "),
            a(href="https://archive.ics.uci.edu/ml/datasets/Mammographic+Mass", "Mammographic Mass Dataset"),
            h3("Results"),
            textOutput("result")
        )
    )
))