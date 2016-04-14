library(RedditExtractoR)
library(tm)
library(wordcloud)
library(RColorBrewer)
library(shiny)
pal2 <- brewer.pal(8,"Dark2")

shinyServer(function(input, output, session) {
  output$plotreddit <- renderPlot({
    redditdata <- reddit_content(URL=input$urlinput)
    reddit.text <- redditdata$comment
    reddit_corpus = Corpus(VectorSource(reddit.text))
    myDTM = TermDocumentMatrix(
      reddit_corpus,
      control = list(
      wordLengths=c(0,Inf),
      removePunctuation = TRUE,
      stopwords = c(stopwords("english")),
      removeNumbers = TRUE, tolower = TRUE) )
    m = as.matrix(myDTM)
    v = sort(rowSums(m), decreasing = TRUE)
    wordcloud(names(v),v,colors=pal2, min.freq = input$freqnumber, max.words = input$cloudnumber)
      })

})