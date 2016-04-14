shinyUI(pageWithSidebar(
                  headerPanel("Reddit WordCloud"),
                  
                  sidebarPanel(
                    textInput("urlinput", "URL", "https://www.reddit.com/r/todayilearned/comments/4eihm3/til_dogs_feel_most_vulnerable_when_pooping_so/"),
                    sliderInput("cloudnumber", "Number of words in cloud", min = 50, max = 500, value = 200),
                    sliderInput("freqnumber", "Min word Frequency", min = 1, max = 25, value = 5),
                    submitButton(text = "Update")),

                  mainPanel(
                    plotOutput("plotreddit"))
              )
          )