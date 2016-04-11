shinyUI(pageWithSidebar(
                  headerPanel("Reddit WordCloud"),
                  
                  sidebarPanel(
                    textInput("urlinput", "URL", "Comment Thread"),
                    submitButton(text = "Update")),

                  mainPanel(
                    plotOutput("plotreddit", width = "100%"))
              )
          )