library(RedditExtractoR)
library(tm)
library(wordcloud)
library(RColorBrewer)

pal2 <- brewer.pal(8,"
redditdata <- reddit_content(URL= )
reddit.text <- redditdata$
reddit_corpus = Corpus(VectorSource(reddit.
myDTM = TermDocumentMatrix(
      reddit_corpus,
      control = list(
      wordLengths=c(0,Inf),
      removePunctuation = TRUE,
      stopwords = c(stopwords("english")),
      removeNumbers = TRUE, 
m = as.matrix(myDTM)
v = sort(rowSums(m), decreasing = TRUE)
wordcloud(names(v),v,colors=pal2, min.freq = 5, max.words = 200)

