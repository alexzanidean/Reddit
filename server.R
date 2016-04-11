shinyServer(function(input, output, sesson) {
    
output$plotreddit <- renderPlot({
  redditdata <- reddit_content(URL=input$urlinput)
  data.text <- redditdata$comment
  data.text <- clean_text(data.text)
  data_corpus = Corpus(VectorSource(data.text))
  #data_corpus <- tm_map(data_corpus,
  #                      content_transformer(function(x) iconv(x, to='UTF-8', sub='byte')), mc.cores=1, lazy=TRUE)
  #data_corpus <- tm_map(data_corpus, content_transformer(tolower), lazy = TRUE)
  data_corpus <- tm_map(data_corpus, function(x)removeWords(x,stopwords('english')), lazy = TRUE)
  data_corpus <- tm_map(data_corpus, function(x)removeWords(x,stopwords("french")), lazy= TRUE)
  #data_corpus <- tm_map(data_corpus, stemDocument, mc.cores=1)
  
  myDTM = TermDocumentMatrix(data_corpus, control = list(minWordLength = 0))
  m = as.matrix(myDTM)
  v = sort(rowSums(m), decreasing = TRUE)
  
  wordcloud(names(v),v ,min.freq=5,max.words=300, random.order=F, colors=pal2, rot.per=.2)
      })

})
